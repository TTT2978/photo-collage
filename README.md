To Install:
==============================================

Termux use this: 
curl -sL https://raw.githubusercontent.com/TTT2978/photo-collage/refs/heads/main/installer.sh | bash

Ubuntu use this: 
curl -sL https://raw.githubusercontent.com/TTT2978/photo-collage/refs/heads/main/installer_ubuntu.sh | bash

Windows use this: 
irm https://raw.githubusercontent.com/TTT2978/photo-collage/refs/heads/main/installer.ps1 | iex

==============================================

To Use:

flag:

-n <name> Output file name (default: collage_output)

-f <format> Output format (jpg, png, webp) (default: png)

-c <color/TB> Background color or TB(TB is Trans), (default: none)

-d <path> Destination directory path (default: .)

-s <number> Pixel spacing between images (default 135)

-dir <v/h> Direction: v (vertical), h (horizontal) (default: v)

-h , --help


==============================================

Mechanism: When using this feature, no matter how many images you combine, it will automatically increase the resolution of the combined image. So, even if you combine 100 images, the file size will be larger, but the image will still be sharp when you zoom in... 
