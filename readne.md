# Powershell scripts

## Scripts

### - Nvidia clips to QSV AV1

> this also just recreates the current folder's sub-dir structure and re-encodes and videos under those folders to AV1. not exclusivce to Nvidia clips at all!

This uses [QSVEncC64](https://github.com/rigaya/QSVEnc/releases) to convert the clips recorded by Shadowplay to AV1 using QSV.
I moved to an Intel A770 from an Nvidia card so that is why I made this.

Just put `Nvidia_clips_to_QSV_AV1.ps1` in your nvidia recording folder and run it!
If the folder's name is `Clips` it will create a new folder next to it called `Clips AV1` with the same folder structure but with videos encoded to AV1.

There is no check for if the folder is empty so if a folder just has screenshots then it will still be made in the new AV1 folder but nothing will be put inside!

*Of course you need [QSVEncC](https://github.com/rigaya/QSVEnc/releases) in your path for this to work!*
