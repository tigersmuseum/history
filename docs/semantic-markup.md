# Semantic markup

Semantic markup allows data that is both human and machine readable.
For example, you can use [XHTML with RDFa](https://www.w3.org/TR/rdfa-syntax/) to make a document with embedded linked data structure.
A human can read it in a web browser. A machine can pass it through an _RDFa extractor_ and get a linked data model.

This is all very well for describing things and their properties, but it becomes a bit more difficult when you want to describe the
relationship between things. It's generally possible to do, but the semantic markup gets more abstruse as the relationships
become more complex. Human readability isn't necessarily affected, but it becomes more time consuming and difficult to create the document.

We'd like documents to be _writeable_ as well as readable, which is to say there shouldn't be any significant skills or knowledge needed to create them.
We can make it simpler to produce the document at the cost of requiring more effort in making it machine readable.
This means creating and maintaining interpretation code.
If the document is plain natural language text, then potentially complex and difficult _natural language processing_ is needed to make a machine readable model from it.

Any sort of structure in the document makes the processing easier.
The game is to find the balance between semantic structure and follow-on processing that makes it 'easy' to write the documents, and
both 'possible' and 'economical' to process them. We can develop tools and techniques that help find and strike this balance.


At minimum we should start with XHTML documents. XHTML is HTML that is also valid XML, which means it is machine processable.
It's possible to generate XHTML from a word processor, or 'clean up' HTML to make it XHTML.

You can help the interpretation of a web page by using the [HTML Semantic elements](https://www.w3schools.com/html/html5_semantic_elements.asp).
These give the document a structure that is easier to interpret.
Semantic __markup__ then goes further by labelling spans of text according to some model.
There are various different systems for semantic markup, but we'll focus here on XHTML+RDFa.

The HTML _class_ attribute is used in web pages to style elements, and it may be that some semantic information can be inferred from class
attributes such as 'person' or 'place'. Alternatively, the type of entities in the text can be made explicit using the RDFa _typeof_ attribute.
This much is reasonably simple, as is using the RDFA _property_ entry to relate properties to entities and the _content_ attribute to specify
the standard form of a name when a variant is used in the text.

It's a lot of work to add semantic information about some entity every time it's mentioned.
You might add markup to just the first mention instead,
in which case it becomes incumbant on follow-on processing to find any other mentions.
This will typically happen through dictionary lookup. If your text identifies an entity, and identifies its preferred label and any alternative labels at least once, then that information can be used to build a dictionary and scan the rest of the text for further mentions.
Alternatively, make a reference document that's marked up in this way, and then express the names in the rest of your input using one of the forms in the reference. 
