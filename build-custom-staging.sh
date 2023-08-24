#!/bin/bash
#Display commands and their arguments as they are executed.
set -x
#Display shell input lines as they are read.
set -v
wget -q 'https://github.com/AppImageCrafters/appimage-builder/releases/download/v1.0.3/appimage-builder-1.0.3-x86_64.AppImage'
chmod +x 'appimage-builder-1.0.3-x86_64.AppImage'
./appimage-builder-1.0.3-x86_64.AppImage --appimage-extract
cp runtime/mksquashfs squashfs-root/usr/bin/mksquashfs
sed -i 's|xz|zstd|' squashfs-root/usr/lib/python3.8/site-packages/appimagebuilder/modules/prime/appimage_primer.py
squashfs-root/AppRun --recipe wine-staging-custom.yml

