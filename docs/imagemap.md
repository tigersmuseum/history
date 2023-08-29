## Image Mapping

This is a JPEG image of the colours of the 1st Battalion, The Royal Hampshire Regiment:
<img src="https://tigersmuseum.github.io/history/colours/1stBn.jpg" width="50%"/>

We can make this into an **[image map](https://tigersmuseum.github.io/history/colours/1stBn.svg)** that links the battle honours listed on the colours to the relevant web pages in [The Royal Hampshire Regiment's timeline](https://www.royalhampshireregiment.org/about-the-museum/timeline/).

The image map is a [Scalable Vector Graphics (SVG)](https://www.w3schools.com/graphics/svg_intro.asp) file. It has the JPEG image as background, and has has its *viewBox* attribute set to the width and height of the image. You use image coordinates in the SVG to define shapes (simple rectangles suffice in this example) covering the parts of the image you want to make clickable. You make these shapes invisible by setting the style properties *fill:none* and *stroke:none*, but nevertheless clickable by setting the style property *pointer-events:all*.

Tip: set the stroke colour to something bright, red say, while you're working out the positions and angles of the shapes, and then set it to 'none' when you're happy with the results.
