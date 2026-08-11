# Trench Maps

The [British Trench Map ontology](https://rdf.muninn-project.org/ontologies/btmaps-en.html) models the WW1 British Trench Map Coordinate system and its relationship to modern latitude and longitude coordinates. The basis of the system is a *grid* of 1:40,000 scale *map sheets*. The ontology includes information about each sheet, and how they link up to form the grid; so we can transform the ontology OWL file to make a [Scalable Vector Graphics (SVG)](https://www.w3schools.com/graphics/svg_intro.asp) diagram of the grid, applying *[btmaps.xsl](../xsl/maps/btmaps.xsl)* to produce [grid.svg](grid.svg).

Each map sheet rectangle in [grid.svg](grid.svg) is 720 x 480, the same dimensions used when [making an overlay](tm-overlay.md) for a 1:40,000 scale trench map. Also, each map sheet rectangle in the grid diagram is represented by an SVG *group* element that is translated to the correct position in the grid. This makes it possible to simply copy an SVG overlay into the SVG group that represents the relevant map sheet. A picture across multiple sheets can be built up in this way.

## KML

The British Trench Maps ontology can model the geometry of a map sheet, but the OWL file doesn't actually include the geometry data needed to display the sheet in a [GIS](https://en.wikipedia.org/wiki/Geographic_information_system). You can get the geometry of map sheets from [tMapper](https://www.tmapper.com/) though, which lets you locate the boundaries of a map sheet in the WGS84 coordinate system used in [KML](https://www.ogc.org/standard/kml/).

KML will draw polygons and overlay images on a map. You can take an [SVG Overlay](tm-overlay.md), convert it to a raster image, and position it using the *[GroundOverlay](https://developers.google.com/kml/documentation/kml_tut#ground-overlays)* element. For example, try importing [51b-overlay.kmz](../examples/51b-overlay.kmz) into Google Earth. This shows the red and blue dots from the 11<sup>th</sup> Brigade Intelligence reports (see the [overlay example](tm-overlay.md)) and the boundary of the 51b map sheet. See also [sheet-51b.kmz](../examples/sheet-51b.kmz), which has a 720 x 480 blue rectangle as the image, making it easier to see how the image lines up with the polygon drawn using the sheet geometry from tMapper.

In these examples, the image was lined up with the sheet geometry through manual tinkering.
This tinkering takes advantage of the fact that the displayed points are relatively close together to position them accurately.
Issues of projecting coordinates for a flat trench map on a globe in Google Earth would come into play if points were scattered widely across the 1:40,000 map.
A more thorough understanding of the coordinate systems and the available geometry data (and some maths<sup> [1]</sup>) would increase the accuracy of results.
A way to obviate these problems is to display an image that covers a smaller area, so has less distortion.
It's possible to make the SVG image in exactly the same way, then rasterize each quarter of it to cover the four 1:20,000 maps: 51b.NW, 51b.NE, 51b.SW and 51b.SE.
Going further, we can rasterize the area of a 1:10,000 map, or even a single 6,000 yard square.
The downside is that there is more work to do in calculating GroundOverlay parameters.

The tMapper application lets you convert Trench Maps coordinates directly to latitude and longitude. Overlaying the raster image as above is therefore just a visualization choice. An alternative would be to add simple simple KML *PlaceMark* elements at each lat/long corresponding to a trench map reference. It depends what you want to show and how you want to show it. Mixing and matching display options is, of course, also possible.

### Trench map tiles

The National Library of Scotland [Map Finder](https://maps.nls.uk/geo/explore/#zoom=10.0&lat=50.77378&lon=2.86670&layers=101724050&b=GoogleSatHyb&o=100)
lets you browse trench maps overlaid over modern terrain. It uses a _map tile server_ to do this, and you can use this same server to display trench map tiles in Google Earth: While browsing a map, click the *Overlay* button at the bottom the screen. This will give the the information you need and instructions on how to use it.
Add a _GroundOverlay_ to Google Earth and then save it as KML.

The map tile server does all the right things to position trench maps properly in Google Earth.
This makes it very useful as reference for finding the geometry of parts of a trench map in Google Earth.


## Linked Data

The British Trench Map ontology gives each map an identity that can be used to relate places and events. It includes a *currentLocationOf* property that can relate a current place to a map sheet, and a *wasLocationOf* property that relates a map to an event that happened within the area it covers. The OWL file for the ontology includes examples of both. In particular, it has each major action of World War I (from [DBpedia](https://www.dbpedia.org/about/)) linked to the relevant 1:40,000 map sheet.

## References

1. Deakin, R. E. "Coordinate Transformations for World War 1 Topographic Maps."  _Presented at the Victorian Regional Survey Conference: From the Bush to the Battlefield_  (2015).
