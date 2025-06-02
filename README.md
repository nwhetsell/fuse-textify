This is a Fuse for
[DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve)
and [Fusion](https://www.blackmagicdesign.com/products/fusion/)
that converts images to text. It is based on
[Meta Fide Computer Vision](https://www.metafide.com/?product=computer-vision)
(MIT-licensed) by [**@IgorRidanovic**](https://github.com/IgorRidanovic), but
has different options and adds some outputs.

To install this Fuse, place [Textify.fuse](Textify.fuse) in
> /Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Fuses
on macOS, and
> %PROGRAMDATA%\Blackmagic Design\DaVinci Resolve\Fusion\Fuses
on Windows.

You can use this Fuse’s Scaled Downsampled Image output to add color to text.
Here is one way to do this:
1. In Fusion, connect Textify’s Main Output to a Merge node’s Background input
2. Connect Textify’s Scaled Downsampled Image output to the Merge node’s
   Foreground input
3. Set the Merge node’s Apply Mode to Darken
