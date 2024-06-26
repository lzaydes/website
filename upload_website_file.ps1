# ./upload_website_file.ps1 ../website_private_key styles.css

param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$ssh_key_path,

    [Parameter(Mandatory=$true, Position=1)]
    [string]$filepath,
    
    [Parameter(Position=2)]
    [string]$remote_filepath
)

$remote_filepath = if ($remote_filepath -eq "") {$filepath} else {$remote_filepath}
scp -ri $ssh_key_path $filepath puugflte@leozaydes.com:~/public_html/$remote_filepath
