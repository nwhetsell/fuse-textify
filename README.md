This is a Fuse for
[DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve)
and [Fusion](https://www.blackmagicdesign.com/products/fusion/)
that converts images to text. It is based on
[Meta Fide Computer Vision](https://www.metafide.com/?product=computer-vision)
(MIT-licensed) by [**@IgorRidanovic**](https://github.com/IgorRidanovic), but
has different options and adds some outputs.

To install this Fuse, place [Textify.fuse](Textify.fuse) in

> ~/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Fuses

on macOS, and

> %PROGRAMDATA%\Blackmagic Design\DaVinci Resolve\Fusion\Fuses

on Windows.

You can use this Fuse’s Scaled Downsampled Image output to add color to text.
Here is one way to do this:
1. In Fusion, connect Textify’s Main Output to a Merge node’s Background input
2. Connect Textify’s Scaled Downsampled Image output to the Merge node’s
   Foreground input
3. Set the Merge node’s Apply Mode to Darken

## Dependencies

To implement limited support for non-ASCII characters, this Fuse incorporates
code from
[lua-utf8-simple](https://github.com/blitmap/lua-utf8-simple)
([MIT-licensed](https://github.com/blitmap/lua-utf8-simple/blob/7ef030750d8e408ac5d724aefab2ec8769731005/LICENSE)),
[lua-bit-numberlua](https://github.com/davidm/lua-bit-numberlua)
(also [MIT-licensed](https://github.com/davidm/lua-bit-numberlua/blob/30b6828b298b46411b548202d40524caba06a99c/COPYRIGHT)),
and the [luapower.com utf8 library](https://github.com/luapower/utf8)
([public domain](https://github.com/luapower/utf8/blob/702449d5728dd65c3ed41151ec32db5b1cc932de/utf8.lua#L3)).
This Fuse also uses the `xor` function from https://lua-users.org/wiki/BitUtils.
