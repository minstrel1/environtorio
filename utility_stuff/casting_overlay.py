from PIL import Image

import glob, os

overlay = Image.open("casting_overlay.png")

snowslurry = Image.open("snowslurry_cropped.png")
snowslurry.thumbnail((24, 24), Image.Resampling.LANCZOS)

for input_path in glob.glob("casting_overlay_input/*.png"):
    file, ext = os.path.splitext(input_path)

    file_name = file.split("\\")[1]

    print("we got a file " + file_name)

    input_image = Image.open(input_path).convert("RGBA")

    input_crop = input_image.crop((0, 0, 64, 64))
    input_crop.thumbnail((48, 48), Image.Resampling.LANCZOS)

    new_image = Image.new("RGBA", (120, 64), (0, 0, 0, 0))

    new_image.paste(input_crop, (16, 16, 64, 64), mask = input_crop)
    new_image.paste(overlay ,(0, 0, 64, 64), mask = overlay)

    advanced_image = new_image.copy()
    advanced_image.paste(snowslurry, (4, 36, 28, 60), mask = snowslurry)

    basic_mip_1 = new_image.crop((0, 0, 64, 64))
    basic_mip_2 = new_image.crop((0, 0, 64, 64))
    basic_mip_3 = new_image.crop((0, 0, 64, 64))

    basic_mip_1.thumbnail((32, 32), Image.Resampling.LANCZOS)
    basic_mip_2.thumbnail((16, 16), Image.Resampling.LANCZOS)
    basic_mip_3.thumbnail((8, 8), Image.Resampling.LANCZOS)

    new_image.paste(basic_mip_1, (64, 0, 96, 32))
    new_image.paste(basic_mip_2, (96, 0, 112, 16))
    new_image.paste(basic_mip_3, (112, 0, 120, 8))

    new_image.save("output/basic-" + file_name + "-casting" + ".png")

    advanced_mip_1 = advanced_image.crop((0, 0, 64, 64))
    advanced_mip_2 = advanced_image.crop((0, 0, 64, 64))
    advanced_mip_3 = advanced_image.crop((0, 0, 64, 64))

    advanced_mip_1.thumbnail((32, 32), Image.Resampling.LANCZOS)
    advanced_mip_2.thumbnail((16, 16), Image.Resampling.LANCZOS)
    advanced_mip_3.thumbnail((8, 8), Image.Resampling.LANCZOS)

    advanced_image.paste(advanced_mip_1, (64, 0, 96, 32))
    advanced_image.paste(advanced_mip_2, (96, 0, 112, 16))
    advanced_image.paste(advanced_mip_3, (112, 0, 120, 8))

    advanced_image.save("output/advanced-" + file_name + "-casting" + ".png")
