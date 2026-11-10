from pathlib import Path
from PIL import Image, ImageDraw

output_path = Path(__file__).parent / "sample-image.png"

image = Image.new("RGB", (1600, 1200), (35, 100, 170))
draw = ImageDraw.Draw(image)

draw.rectangle(
    (100, 100, 1500, 1100),
    outline="white",
    width=12
)

draw.text(
    (180, 250),
    "SERVERLESS IMAGE PROCESSING",
    fill="white"
)

draw.text(
    (180, 350),
    "Original image: 1600 x 1200",
    fill="white"
)

image.save(output_path, format="PNG")

print(f"Sample image created: {output_path}")
print(f"Original dimensions: {image.size}")
