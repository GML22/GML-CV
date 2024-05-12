import qrcode

# QR code definition
qr = qrcode.QRCode(version=1,
                   error_correction=qrcode.constants.ERROR_CORRECT_Q,
                   box_size=10, border=4)

# Add link to GitHub portfolio as data in QR code
qr.add_data('https://github.com/GML22')

# Create QR code
qr.make(fit=True)

# Create image from QR code
img = qr.make_image(fill_color="white", back_color="transparent")

# Save QR code image to disk
img.save("imgs\\qr_code.png")
