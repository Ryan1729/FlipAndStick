FlipAndStick
============

This script for GIMP takes a set of layers and apppends a flipped copy of the layers to a copy of the layers, producing a longer looped animation from any animation, though it should work on just about any image.

Installation
============
Place the script in your Gimp scripts folder. See [here](http://docs.gimp.org/2.8/en/install-script-fu.html) for details.

Usage
============
Once installed the script will be found in Filters > Animation > Flip-And-Stick

To use, simply open your layered image, a gif for example, and start the script. Once the script is finished running, in most cases you should have a nicely looped set of layers sutable for export as a gif. However, if the original gif does a full image replace at any point, you may want to unoptimize the resulting set of layers so that the gif looks right. Also, if the original animation uses a time between frames other than than the usual 100ms then you will probably want to adjust the timing on the new layers 
