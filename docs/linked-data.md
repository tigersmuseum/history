# Linked Data

See [World War I as Linked Open Data](https://www.ldf.fi/dataset/ww1lod/). This dataset can be browsed online, or it can be queried using [SPARQL](https://www.w3.org/2009/Talks/0615-qbe/).

	PREFIX crm: <http://www.cidoc-crm.org/cidoc-crm/>
	PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
	PREFIX owl: <http://www.w3.org/2002/07/owl#>
	SELECT * WHERE {
	  ?sub crm:P10_falls_within <http://ldf.fi/ww1lod/97f2dc39> .
	  ?sub skos:prefLabel ?name .
	  FILTER( LANGMATCHES(LANG(?name), "en") ).
	  OPTIONAL {
	    ?sub owl:sameAs ?same.
	  }
	} 

[query](https://api.triplydb.com/s/fxSeOmaD4)


	DESCRIBE <http://ldf.fi/ww1lod/eda57b6b>


[Munnin Project](https://blog.muninn-project.org/)

Munnin RDF server: https://rdf.muninn-project.org/

[British Trench Map Ontology](https://rdf.muninn-project.org/ontologies/btmaps-en.html)

[IES4](https://github.com/dstl/IES4/tree/master)


Reuse wherever possible. Keep it simple. 

It's about sharing information that other's might find useful. We don't know how they might use it, and we should assume it's not quite the way we do.

If you seed data with some structure then you're providing foundations for others to build more.

Reasoners and tools.

Mix and match.

Transformation...

Human readable - RDFa. 

We should be able to express information as text and diagrams. If text is HTML and diagrams are SVG, then we can use [RDFa](https://www.w3.org/TR/rdfa-primer/) semantic mark-up.

## Date and Time
See the [OWL-Time](https://www.w3.org/TR/owl-time/) ontology.

## Entities and Relationships

See the [Information Exchange Standard (IES4)](https://github.com/dstl/IES4/blob/master/ies.md)
