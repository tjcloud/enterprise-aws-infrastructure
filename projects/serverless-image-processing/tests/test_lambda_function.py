import io

from urllib.parse import quote_plus

from PIL import Image

from app.lambda_function import process_s3_record


class FakeS3:

    def __init__(self, image_bytes):

        self.image_bytes = image_bytes

        self.get_requests = []

        self.put_requests = []

    def get_object(self, Bucket, Key):

        self.get_requests.append({
            "Bucket": Bucket,
            "Key": Key
        })

        return {
            "Body": io.BytesIO(self.image_bytes),
            "ETag": '"test-etag-123"'
        }

    def put_object(self, **kwargs):

        self.put_requests.append(kwargs)


class FakeTable:

    def __init__(self):

        self.items = []

    def put_item(self, Item):

        self.items.append(Item)


def create_image_bytes(
    image_format="JPEG",
    size=(1600, 1200),
    mode="RGB"
):

    image = Image.new(size=size, mode=mode, color="blue")

    buffer = io.BytesIO()

    image.save(buffer, format=image_format)

    return buffer.getvalue()


def create_record(key):

    return {
        "s3": {
            "bucket": {
                "name": "input-bucket"
            },
            "object": {
                "key": quote_plus(key, safe="/")
            }
        }
    }


def test_jpeg_is_resized_and_saved():

    image_bytes = create_image_bytes()

    fake_s3 = FakeS3(image_bytes)

    fake_table = FakeTable()

    result = process_s3_record(
        create_record("incoming/sample image.jpg"),
        fake_s3,
        fake_table,
        "output-bucket"
    )

    assert result["status"] == "processed"

    assert fake_s3.get_requests[0]["Key"] == "incoming/sample image.jpg"

    assert result["processed_width"] == 800

    assert result["processed_height"] == 600

    assert len(fake_s3.put_requests) == 1

    assert fake_s3.put_requests[0]["ContentType"] == "image/jpeg"

    assert fake_table.items[0]["status"] == "SUCCEEDED"

    processed_image = Image.open(
        io.BytesIO(fake_s3.put_requests[0]["Body"])
    )

    assert processed_image.format == "JPEG"

    assert processed_image.size == (800, 600)


def test_png_transparency_is_converted_to_jpeg():

    image_bytes = create_image_bytes(
        image_format="PNG",
        size=(400, 300),
        mode="RGBA"
    )

    fake_s3 = FakeS3(image_bytes)

    fake_table = FakeTable()

    result = process_s3_record(
        create_record("transparent.png"),
        fake_s3,
        fake_table,
        "output-bucket"
    )

    assert result["status"] == "processed"

    processed_image = Image.open(
        io.BytesIO(fake_s3.put_requests[0]["Body"])
    )

    assert processed_image.format == "JPEG"

    assert processed_image.mode == "RGB"

    assert processed_image.size == (400, 300)


def test_unsupported_file_is_skipped():

    fake_s3 = FakeS3(b"not an image")

    fake_table = FakeTable()

    result = process_s3_record(
        create_record("document.txt"),
        fake_s3,
        fake_table,
        "output-bucket"
    )

    assert result["status"] == "skipped"

    assert result["reason"] == "unsupported_format"

    assert len(fake_s3.get_requests) == 0

    assert len(fake_s3.put_requests) == 0

    assert len(fake_table.items) == 0


def test_invalid_image_is_skipped():

    fake_s3 = FakeS3(b"this is not a real image")

    fake_table = FakeTable()

    result = process_s3_record(
        create_record("broken.jpg"),
        fake_s3,
        fake_table,
        "output-bucket"
    )

    assert result["status"] == "skipped"

    assert result["reason"] == "invalid_image"

    assert len(fake_s3.put_requests) == 0

    assert len(fake_table.items) == 0
