# Places

A place is often important because of what it is, not where it is; *place* is not always the same as *location*. For example, an important place to a Field Ambulance is its Main Dressing Station (MDS). Although it moves from time to time, there's really just one MDS for each Field Ambulance. We can think about it as one place associated with many locations.

There are philosophical fun and games to be had in considering [the concept of place](https://www.oxfordbibliographies.com/display/document/obo-9780199874002/obo-9780199874002-0159.xml) and the various relationships places might have to each other. However, we'll try here not to get bogged down too soon.

Places are mentioned in historical texts. A simple first step is to consider the mention of a place as a *label* that names or describes it. This might be all we need in some circumstances, or it might be the first rung on the ladder to a more esoteric model of place.  

## Locations

A location is what you need if you want to display a place on a map. if you push a pin into a map then the location is simply a *point*. A point has *coordinates* that position it on a map. There are various systems for geographic coordinates, but the most common (so most useful) is the [World Geodetic System (WGS84)](https://gisgeography.com/wgs84-world-geodetic-system/).

As well as points, You may want to show *lines* or *polygons* on a map. The location has a *geometry*. Lines and polygons are constructed from multiple points. A general location is therefore a set of points and a geometry. 


### Locations from Google Earth

[Google Earth](https://earth.google.com/).

* Click the *Projects* icon, select *Create a new Project*, then *Create KML file*. Give it a name and description.
* Search for places names. Click *Add to project* button at the bottom of the pop-up description pane for any that you want to keep.
* You can use the *Add placemark* icon at the bottom-left of the map to add any places that aren't in the search index.
* When you're happy, you can open the *Projects* pane and select *Export as KML file*.
* Later, you can pick up where you left off by using the *Import KML file from computer* option and adding new placemarks as above.

### Locations from GeoNames

[GeoNames](https://www.geonames.org/)

## Trench Maps

[The Long, Long Trail](https://www.longlongtrail.co.uk) has information on [how to read a British trench map](https://www.longlongtrail.co.uk/battlefields/how-to-read-a-british-trench-map/), together with links to trench map sources.


## Data

As KML. As OWL/RDF linked data.

The advantage of using Geonames and RDF is that you get a URI that uniquely identifies the place, and that can be used to get more information about the place. Placemarks from Google Earth have id attributes. It's not clear if these can sensibly be used outside of Google Earth.

Blank nodes?

A place is defined by its associations and context. We can use SKOS to organize places by context, e.g. billets.
