# World War I

## Chronology

This site holds two chronologies of the war:

* [Rowe, R P P. A Concise Chronicle of Events of the Great War.](https://tigersmuseum.github.io/history/events/ww1/rowe.xhtml)
* [Principle Events 1914-1918, compiled by The Historical Section of the Committee of Imperial Defence.](https://tigersmuseum.github.io/history/events/ww1/events-1914-15.xhtml)

These are XHTML documents, which means they are valid XML, so are readily processed in software. This "machine readability" is further aided by use of [semantic markup](https://en.wikipedia.org/wiki/Semantic_HTML). Currently, the date of each entry is easily recovered, and also some of the entities. The aim is to improve and extend the semantic markup over time in the light of lessons learned from trying to extract information from these chronologies.

## Trench Maps

See the *[How to read a British trench map](https://www.longlongtrail.co.uk/battlefields/how-to-read-a-british-trench-map/)* page at [The Long, Long Trail](https://www.longlongtrail.co.uk) for an introduction to trench maps and the coordinate system they used; and where trench maps can be found.

We might want to display information about events on maps. If we're using a modern mapping tool then this means converting trench map coordinates to latitudes and longitudes ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)). The [tMapper](https://www.tmapper.com/) tool is one way to do this. Alternatively, we might want to display information on a trench map instead of a modern map. This means converting trench map coordinates into X,Y offsets of an image of a trench map. See *[Overlaying WW1 trench maps](tm-overlay.html)* for a description of how this can be done. See *[Trench Maps](trench-maps.html)* for a technical description of mapping options.