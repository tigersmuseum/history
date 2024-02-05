## Overlaying WW1 trench maps

The basic idea is to use [Scalable Vector Graphics (SVG)](https://www.w3schools.com/graphics/svg_intro.asp) to overlay graphics on the image of a trench map. We start with 1:40,000 trench map and consider how to plot British Trench Map Grid System map references.

The 1:40,000 scale maps have 24 boxes, labelled A to X, laid out in a 6 x 4 grid, that are each six thousand yards square. The lettered boxes contain 36 numbered boxes, 1 to 36, in a 6 x 6 grid, that are each one thousand yards square. A thousand yard box divides up into 4 boxes that are 500 yards square and labelled a, b, c, and d. A 50 yard square in each of these boxes is indexed by a pair of digits (an easting and a northing) in the range 0-9. Occasionally, a 5 yard square box is indexed by a pair of digits in the range 0-99.

A map location is thus referenced on a grid of 720 by 480 coordinates, each representing a 50 yard square. We can convert map references to points in a 720 x 480 grid, and overlay them on the image of the appropriate trench map.  

### An example 

The [11 Bde front line](../examples/51b.svg) overlay shows map references mentioned in 11<sup>th</sup> Brigade Intelligence Summary reports between 25<sup>th</sup> and 29<sup>th</sup> of August, 1917 (from [TNA: WO 95/1492/1 pp 53-60](https://discovery.nationalarchives.gov.uk/details/r/C14016980)). Locations in British territory are blue dots, and those in German territory are red dots. The position of the 11<sup>th</sup> Brigade front line during those dates is apparent. The example opens zoomed in on the overlaid data. Click anywhere to see the whole trench map.

This overlay was created using an XSLT transform. See the **map overlay** target in *[places/build.xml](https://github.com/tigersmuseum/history/blob/main/places/build.xml)* for the input data and stylesheet used. 
The overlay stylesheet imports *[tmap.xsl](../xsl/tmap.xsl)* to convert map references to X,Y coordinates. This utility stylesheet is independent of both the input data and
how the coordinates are used. 

The finished example has the overlay displayed on an image of the [51b Enemy Organizations 25-8-18](http://digitalarchive.mcmaster.ca/islandora/object/macrepo%3A3970/-/collection) map in the [McMaster University collection](https://library.mcmaster.ca/maps/ww1/ndx5to40.htm). The medium resolution map image was downloaded from McMasters, then converted from JP2 to JPEG format and resized to be 20% of the original using [ImageMagick](https://imagemagick.org/). Finally, there was a bit of fiddling with the SVG *viewBox* attribute and the *image* tag attributes to get the image to line up as well as possible with the 720 x 480 grid used in the overlay. 
