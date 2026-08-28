# Semantic mark-up

Semantic mark-up is the annotation of text documents to make it easier to extract information.
It's purpose is to make text *machine readable* without altering how it appears to a human reader.
For example, you can use [XHTML with RDFa](https://www.w3.org/TR/rdfa-syntax/) to make a document with embedded linked data structure.
A human can read it in a web browser. A machine can pass it through an _RDFa extractor_ and get a linked data model.

This is all very well for describing things and their properties, but it becomes a bit more difficult when you want to describe the
relationship between things. It's generally possible to do, but the semantic mark-up gets more abstruse as the relationships
become more complex. Human readability isn't necessarily affected, but it becomes more time consuming and difficult to create the document.

We'd like documents to be *writeable* as well as readable, which is to say there shouldn't be any significant technical skills or knowledge needed to create them.
We can make it simpler to produce a document at the cost of requiring more effort to make it machine readable.

Any sort of structure in the document makes the processing easier.
If the document is plain natural language text, then potentially complex and difficult *natural language processing* is needed to make a machine readable model from it.
The game is to find the balance between semantic structure and follow-on processing that makes it 'easy' to write the documents, and
both 'possible' and 'economical' to process them. We can develop tools and techniques that help find and strike this balance.

At minimum we start with XHTML documents. XHTML is HTML that is also valid XML, which means it is machine processable.
It's possible to generate XHTML from a word processor, or 'clean up' HTML to make it XHTML.

You can help the interpretation of XHTML by using the [HTML Semantic elements](https://www.w3schools.com/html/html5_semantic_elements.asp).
These give the document a structure that is easier to interpret.
Semantic **mark-up** then goes further by labelling spans of text according to some model.

The HTML `class` attribute is used in web pages to style elements, and it may be that some semantic information can be inferred from class
attributes such as 'person' or 'place'. Alternatively, the type of entities in the text can be made explicit using the [RDFa](https://www.w3.org/TR/rdf-primer/) `typeof` attribute.
This much is reasonably simple, as is using the RDFa `property` attribute to relate properties to entities, and the `content` attribute to specify the standard form of a name when a variant is used in the text.

It's a lot of work to add semantic information about some entity every time it's mentioned.
You might add mark-up to just the first mention instead, in which case it's left to follow-on processing to find any other mentions.
This will typically happen through dictionary lookup. If your text identifies an entity, and identifies its preferred label and any alternative labels at least once, then that information can be used to build a dictionary and scan the rest of the text for further mentions.
Alternatively, you can make a reference document that's marked up in this way, and then express the names in the rest of your input using one of the forms in the reference. 

There are lots of options and no definitive right answers.
Semantic mark-up is something that's nice to have but not essential - so if in doubt, leave it out.
