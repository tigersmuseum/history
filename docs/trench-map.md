## Overlaying information on WW1 trench maps

The basic idea is to use [Scalable Vector Graphics (SVG)](https://www.w3schools.com/graphics/svg_intro.asp) to overlay graphics on the image of a trench map.

We start with 1:40,000 trench map and consider how to plot British Trench Map Grid System map references.

The 1:40,000 scale maps have 24 boxes, labelled A to X, laid out in a 6 x 4 grid, that are each six thousand yards square. The lettered boxes contain 36 numbered boxes, 1 to 36, in a 6 x 6 grid, that are each one thousand yards square. A thousand yard box divides up into 4 boxes that are 500 yards square and labelled a, b, c, and d. A 50 yard square in each of these boxes is indexed by a pair of digits in the range 0-9. Occasionally, a 5 yard square box is indexed by a pair of digits in the range 0-99.

A typical map is therefore referenced as a grid of 720 by 480 coordinates, each representing a 50 yard square. We can convert map references to points in a 720 x 480 grid, and use this an an overlay. If we can then find an image of the right map, and   

Download the "medium" resolution image from McMasters. Convert from JP2 to JPEG and resize to be 20% of the original. I use [ImageMagick](https://imagemagick.org/) for this.

The British Trench Map Grid System

Make an SVG file that has the JPEG image as a background