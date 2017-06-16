This project is done to allow the interested parties to get more information about dance details (at one of the dance arangetram) by scanning the qr code through their mobile devices and redirect it to web site

# Directories
## web
This directory will contain all html pages, javascript, css or any other web related stuff.

## src
This directory will contain node.js JavaScript files.


## src\images
generated QR code images for each html page will be here.

# Process
## Uploading the web directory
using deploy.ps1 file which scans the entire web directory and uploads to AWS S3 bucket and enables static web hosting


## Generating the QR code
from src directory one needs to run
* npm install ( installs all the packages)
* node generate.js
* after this src\images will be populated with images for each html page.



