## Overlaying information on WW1 trench maps

The basic idea is to use [SVG](https://www.w3schools.com/graphics/svg_intro.asp) to overlay graphics on the image of a trench map.

We start with British Trench Map Grid System map references.

The 1:40,000 scale maps have 24 boxes, labelled A to X, laid out in a 6x4 grid, that are each six thousand yards square. The lettered boxes contain 36 numbered boxes, 1 to 36, in a 6x6 grid, that are each one thousand yards square.

Download the "medium" resolution image from McMasters. Convert from JP2 to JPEG and resize to be 20% of the original. I use [ImageMagick](https://imagemagick.org/) for this.


The British Trench Map Grid System

Make an SVG file that has 