# Get current folder name
$current_location = Get-Location
$current_folder_name = Split-Path -Path $path -Leaf

# Create AV1 folder
$folder = "..\" + $current_folder_name + " AV1\"
mkdir $folder

# Create the sub-folders in the new folder
Get-ChildItem ".\" -Filter * -exclude Nvidia_clips_to_QSV_AV1.ps1 | 
Foreach-Object {
    echo $_.Name

    $folder = "..\" + $current_folder_name + " AV1\" + $_.Name

    mkdir $folder
}

# Go through all the sub-folders and encode any video ending in mp4, mov, mkv, avi, m4v or webm
Get-ChildItem ".\" -Filter * -exclude Nvidia_clips_to_QSV_AV1.ps1 | 
Foreach-Object {
    
    $video_folder = ".\" + $_.Name

    $global:video_folder_global = $_.Name

    Get-ChildItem $video_folder -Filter ("*.mp4", "*.mov", "*.mkv", "*.avi", "*.m4v", "*.webm") | 
        Foreach-Object {

            $in = $_.FullName
            $output = "..\" + $current_folder_name + " AV1\" + $global:video_folder_global + "\" + $_.Name

            
            QSVEncC64 -i $in -c av1 --output-depth 10 --icq 24 -b 3 -u best --gop-len 180 --gpu-copy --i-adapt --b-adapt --la-depth 100 --b-pyramid --audio-codec opus --colormatrix auto --colorprim auto --transfer auto --metadata copy -o $output

            echo $output

        }

}


