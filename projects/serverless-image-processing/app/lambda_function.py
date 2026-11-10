import hashlib
import io
import logging
import os

from datetime import datetime, timezone
from urllib.parse import unquote_plus

import boto3

from PIL import Image, ImageOps, UnidentifiedImageError


logger = logging.getLogger()
logger.setLevel(logging.INFO)

MAX_DIMENSIONS = (800, 800)

SUPPORTED_EXTENSIONS = {".jpg", ".jpeg", ".png"}


def process_s3_record(record, s3_client, metadata_table, output_bucket):

    source_bucket = record["s3"]["bucket"]["name"]

    encoded_key = record["s3"]["object"]["key"]

    source_key = unquote_plus(encoded_key)

    extension = os.path.splitext(source_key)[1].lower()

    if extension not in SUPPORTED_EXTENSIONS:
        logger.warning("Unsupported image format: %s", source_key)

        return {
            "status": "skipped",
            "reason": "unsupported_format",
            "source_key": source_key
        }

    response = s3_client.get_object(
        Bucket=source_bucket,
        Key=source_key
    )

    source_etag = response.get("ETag", "").strip('"')

    image_bytes = response["Body"].read()

    try:
        with Image.open(io.BytesIO(image_bytes)) as original:

            image = ImageOps.exif_transpose(original)

            original_width, original_height = image.size

            image.thumbnail(
                MAX_DIMENSIONS,
                Image.Resampling.LANCZOS
            )

            if "A" in image.getbands() or "transparency" in image.info:

                rgba_image = image.convert("RGBA")

                background = Image.new(
                    "RGB",
                    rgba_image.size,
                    (255, 255, 255)
                )

                background.paste(
                    rgba_image,
                    mask=rgba_image.getchannel("A")
                )

                image = background

            else:
                image = image.convert("RGB")

            processed_width, processed_height = image.size

            output_buffer = io.BytesIO()

            image.save(
                output_buffer,
                format="JPEG",
                quality=85,
                optimize=True
            )

            output_bytes = output_buffer.getvalue()

    except (UnidentifiedImageError, OSError) as error:

        logger.warning(
            "Invalid image skipped: %s. Error: %s",
            source_key,
            error
        )

        return {
            "status": "skipped",
            "reason": "invalid_image",
            "source_key": source_key
        }

    image_id = hashlib.sha256(
        f"{source_bucket}/{source_key}/{source_etag}".encode("utf-8")
    ).hexdigest()

    output_key = f"processed/{image_id}.jpg"

    s3_client.put_object(
        Bucket=output_bucket,
        Key=output_key,
        Body=output_bytes,
        ContentType="image/jpeg"
    )

    metadata_table.put_item(
        Item={
            "image_id": image_id,
            "source_bucket": source_bucket,
            "source_key": source_key,
            "output_bucket": output_bucket,
            "output_key": output_key,
            "original_width": original_width,
            "original_height": original_height,
            "processed_width": processed_width,
            "processed_height": processed_height,
            "content_type": "image/jpeg",
            "status": "SUCCEEDED",
            "source_etag": source_etag,
            "processed_at": datetime.now(timezone.utc).isoformat()
        }
    )

    logger.info(
        "Image processed successfully: %s -> %s",
        source_key,
        output_key
    )

    return {
        "status": "processed",
        "image_id": image_id,
        "output_key": output_key,
        "processed_width": processed_width,
        "processed_height": processed_height
    }


def lambda_handler(event, context):

    input_bucket = os.environ["INPUT_BUCKET"]

    output_bucket = os.environ["OUTPUT_BUCKET"]

    table_name = os.environ["METADATA_TABLE"]

    s3_client = boto3.client("s3")

    dynamodb = boto3.resource("dynamodb")

    metadata_table = dynamodb.Table(table_name)

    results = []

    for record in event.get("Records", []):

        source_bucket = record["s3"]["bucket"]["name"]

        if source_bucket != input_bucket:

            raise ValueError(
                f"Unexpected source bucket: {source_bucket}"
            )

        result = process_s3_record(
            record,
            s3_client,
            metadata_table,
            output_bucket
        )

        results.append(result)

    logger.info("Processing results: %s", results)

    return {
        "results": results,
        "record_count": len(results)
    }
