# Places

A *place* is not always the same as *location*. For example, an important place to a military unit is its headquarters (HQ). Although it moves from time to time, there's really just one HQ for each unit. We can think about it as one place associated with many locations. There are philosophical fun and games to be had in considering [the concept of place](https://www.oxfordbibliographies.com/display/document/obo-9780199874002/obo-9780199874002-0159.xml) and the various relationships places might have to each other. Here, we'll try not to get bogged down too soon.

Places are mentioned in historical texts. A simple first step is to consider the mention of a place as a *label* that names or describes it. See, for example, the list of [WW1 places](../lists/ww1-places.txt) in this project. This might be all we need in some circumstances, or it might be the first rung on the ladder to a more esoteric model of place.

The same place can have many labels. We need to collect the different labels for a place, choose one of them to be 'authoritative' (the one to display on a map) and perhaps attach a description. We need to have a data structure for this. Here, we'll use the [Simple Knowledge Organization System (SKOS)](https://www.w3.org/TR/skos-primer/).

## Geospatial data

Data about locations is *geospatial data*. The [Open Geospatial Consortium (OGC)](https://www.ogc.org/) promotes geospatial standards and data sharing. These include a standard for "expressing geographic annotation and visualization" called [KML](https://www.ogc.org/standard/kml/). See [Google's KML Tutorial](https://developers.google.com/kml/documentation/kml_tut) for details.

## Locations

A location is what you need if you want to display a place on a map. If you push a pin into a map then the location is simply a *point*. A point has *coordinates* that position it on a map. There are various systems for geographic coordinates, but the most common is the [World Geodetic System (WGS84)](https://gisgeography.com/wgs84-world-geodetic-system/).

As well as points, You may want to show *lines* or *polygons* on a map, which means that a location has a *geometry*. Lines and polygons are constructed from multiple points. A general location is therefore a set of points and a geometry. 

### Locations from Google Earth

To collect locations from [Google Earth](https://earth.google.com/):

* Click the *Projects* icon, select *Create a new Project*, then *Create KML file*. Give it a name and description.
* Search for places names. Click *Add to project* button at the bottom of the pop-up description pane for any that you want to keep.
* You can use the *Add placemark* icon at the bottom-left of the map to add any places that aren't in the search index.
* When you're happy, you can open the *Projects* pane and select *Export as KML file*.
* Later, you can pick up where you left off by using the *Import KML file from computer* option and add new placemarks as above.

### Locations from GeoNames

To collect locations from [GeoNames](https://www.geonames.org/):

* Search for the location.
* Click *.rdf* to download the [RDF](https://www.w3schools.com/XML/xml_rdf.asp) linked data, or *.kml* to download KML. The RDF will give you extra information over and above labelled coordinates.

## Trench Maps

[The Long, Long Trail](https://www.longlongtrail.co.uk) has information on [how to read a British trench map](https://www.longlongtrail.co.uk/battlefields/how-to-read-a-british-trench-map/), together with links to trench map sources. Another useful resource is [tMapper](https://www.tmapper.com/), which also lets you convert trench map references to latitudes and longitudes. The [British Trench Map Ontology](https://rdf.muninn-project.org/ontologies/btmaps-en.html) models trench maps and their relationships to WGS84.

## Data

We need place names or, more generally, place labels. The simplest data structure is a list of labels. We can add more structure to our data by grouping together labels for the same place, and then perhaps providing coordinates. See, for example, the [Baleen gazetteer formats](https://github.com/dstl/baleen/wiki/Gazetteer-Formats).

The next step is to give each place an *identity*. This means assigning a unique identifier that can be used by a knowledge base to refer to that place. Ideally, this identifier is something that can be agreed and shared amongst researchers. See, for example, the [WW1LOD municipilaties](http://demo.seco.tkk.fi/ssaha/project/index.shtml?type=http%3A%2F%2Fldf.fi%2Fww1lod%2Fschema%23Municipality&model=ww1lod) in the WW1LOD dataset from [World War I as Linked Open Data](https://www.ldf.fi/dataset/ww1lod/). These assign a unique [Uniform Resource Identifier (URI)](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier) to places, among other things, that can be used to discover more information about those places. Sources such as GeoNames and DBpedia use their own URI's as identifiers, but will reference other equivalent URI's they know about (often each others). 

URI's allow different researchers to know when they're referring to the same thing, but we won't always have them. If we can't share identity through a common unique identifier, and a place name is ambiguous, then we must use a place's associations and context as well its name to identify it. We can use SKOS to organise this contextual information.

We don't need to get to a finished model of places in one go. We can gradually piece things together. Uncertain and loose associations may be useful in building a model, even if they aren't correct. Models should be validated and tested as they are built. Discovering a mistake often means discovering something new and useful about the model.

