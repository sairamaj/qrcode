$BucketName = 'dancedetails'
$SourceDirectory = "web"

# Clean the bucket
Function Clean-S3Bucket
{
    param(
        $BucketName
    )

    foreach($obj in (Get-S3Object -BucketName $BucketName))
    {
        Remove-S3Object -BucketName $BucketName -InputObject $obj -Force
    }
}


$bucket = Get-S3Bucket -BucketName $BucketName
if( $bucket -eq $null)
{
    Write-Host "creating bucket $BucketName"
    New-S3Bucket -BucketName $BucketName -PublicReadOnly
    
    # Enable as static web host
    Write-Host "Enabling web host"
    Write-S3BucketWebsite -BucketName $BucketName -WebsiteConfiguration_IndexDocumentSuffix index.htm  -WebsiteConfiguration_ErrorDocument error.html
}
else
{
    Clean-S3Bucket -BucketName $BucketName
}


Write-Host "uploading html source"
foreach($file in (Get-ChildItem $SourceDirectory))
{
    Write-S3Object -BucketName $BucketName -Key $file.Name -File $file.FullName -CannedACLName public-read
}
Write-Host "uploading successful"