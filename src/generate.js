var qr = require('qr-image')
var fs = require('fs'), path = require('path')

var mkdirp = require('mkdirp');

mkdirp('images', function(err) { 
});

var baseUrl = 'http://dancedetails.s3-website-us-east-1.amazonaws.com/'
fs.readdir('../web', function(err, files){
    var htmlFiles = files
                    .filter( f=> f.endsWith('html'))
                    .filter( f => (f != 'error.html') && ( f != 'index.html') )
    htmlFiles.forEach( htmlFile => {
        var htmlUrl = baseUrl + htmlFile
        var imageName =  path.join('images',path.basename(htmlFile, '.html') + '.png')
        console.log(imageName)
        console.log('generating: ' + htmlFile)
        var imageData = qr.imageSync(htmlUrl, { type: 'png' });
        fs.writeFileSync(imageName, imageData)        
    })
})

