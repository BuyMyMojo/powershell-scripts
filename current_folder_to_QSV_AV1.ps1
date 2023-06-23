# Get current folder name
$current_location = Get-Location
$current_folder_name = Split-Path -Path $current_location -Leaf

# Create AV1 folder
$folder = "..\" + $current_folder_name + " AV1\"
mkdir $folder

# Go through all the sub-folders and encode any video ending in mp4, mov, mkv, avi, m4v or webm
Get-ChildItem $current_location -Include *.mp4,*.mov,*.mkv,*.avi,*.m4v,*.webm -recurse | 
    Foreach-Object {
        $in = $_.FullName
        $output = "..\" + $current_folder_name + " AV1\" + $_.Name + ".mp4"
        
        echo $in

        QSVEncC64 -i $in -c av1 --output-depth 10 --icq 24 -b 3 -u best --gop-len 180 --gpu-copy --i-adapt --b-adapt --la-depth 100 --b-pyramid --audio-codec opus --colormatrix auto --colorprim auto --transfer auto --metadata copy -o $output
        echo $output
    }


