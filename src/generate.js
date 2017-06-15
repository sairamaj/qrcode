var qr = require('qr-image')
var fs = require('fs')

var png_string = qr.imageSync('I love QR!', { type: 'png' });
fs.writeFileSync('qr.png',png_string)