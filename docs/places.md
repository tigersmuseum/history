# Places

A place is often important because of what it is, not where it is; *place* is not always the same as *location*. For example, an important place to a military unit is its headquarters (HQ). Although it moves from time to time, there's really just one HQ for each unit. We can think about it as one place associated with many locations.

There are philosophical fun and games to be had in considering [the concept of place](https://www.oxfordbibliographies.com/display/document/obo-9780199874002/obo-9780199874002-0159.xml) and the various relationships places might have to each other. Here, we'll try not to get bogged down too soon.

Places are mentioned in historical texts. A simple first step is to consider the mention of a place as a *label* that names or describes it. This might be all we need in some circumstances, or it might be the first rung on the ladder to a more esoteric model of place. See, for example, the list of [WW1 places]() in this project.

The same place can have many labels. We need to collect the different labels for a place, choose one of them to be 'authoritative' (the one to display on a map) and perhaps attach a description. We need to have a data structure for this. Here, we'll use the [Simple Knowledge Organization System (SKOS)](https://www.w3.org/TR/skos-primer/).

## Geospatial data

Data about locations is *geospatial data*. The [Open Geospatial Consortium (OGC)](https://www.ogc.org/) promotes geospatial standards and data sharing. These include a standard for "expressing geographic annotation and visualization" called [KML](https://www.ogc.org/standard/kml/). See [Google's KML Tutorial](https://developers.google.com/kml/documentation/kml_tut).

## Locations

A location is what you need if you want to display a place on a map. if you push a pin into a map then the location is simply a *point*. A point has *coordinates* that position it on a map. There are various systems for geographic coordinates, but the most common (so most useful) is the [World Geodetic System (WGS84)](https://gisgeography.com/wgs84-world-geodetic-system/).

As well as points, You may want to show *lines* or *polygons* on a map, which means that a location has a *geometry*. Lines and polygons are constructed from multiple points. A general location is therefore a set of points and a geometry. 


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

We need place *names* or, more generally, place *labels*. The simplest structure is a list of labels. We can add more structure by grouping together labels for the same place, and then perhaps assign the place some coordinates. See, for example, the [Baleen gazetteer formats](https://github.com/dstl/baleen/wiki/Gazetteer-Formats). The next step is to give each place an *identity*. This means assigning a unique identifier that can be used by a knowledge base to refer to that place. Ideally, this identifier is something that can be agreed and shared amongst researchers. See, for example, the [WW1LOD](http://demo.seco.tkk.fi/ssaha/project/index.shtml?type=http%3A%2F%2Fldf.fi%2Fww1lod%2Fschema%23Municipality&model=ww1lod) dataset.


URI's allow different researchers to know when they're referring to the same thing, but they need to be agreed and managed. If you don't have a URI, then you can identify a place is by its name - but the name of a place might be ambiguous, and the same place might be referred to by different names in different contexts. You can identify a place by its location, if you can decide when two nearby points are the same, or two polygons are the same. 



As KML. As OWL/RDF linked data.

The advantage of using Geonames and RDF is that you get a URI that uniquely identifies the place, and that can be used to get more information about the place. Placemarks from Google Earth have id attributes. It's not clear if these can sensibly be used outside of Google Earth.

Blank nodes?

A place is defined by its associations and context. We can use SKOS to organize places by context, e.g. billets.
