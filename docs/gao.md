# Georgian Army Officers

The [Georgian Army Officers database](https://www.georgianarmyofficers.org/) holds service records extracted from Army Lists between 1790 and 1820.
It's the result of an organised transcription effort, followed by analysis to the identify individual officers and pull together the records that mention each of them.
This 'person matching' is much more difficult than it sounds, and the variability and quality of transcribed records complicate an already difficult problem.
These issues are discussed among links from the home page to background historical and technical information that are well worth exploring.

## Exploring the database

At the Royal Hampshire Regiment Museum, we're interested in two antecedent regiments: the 37th and 67th Regiments of Foot.
You can use the 'Person Search' page with just a unit specified. This gives a list of the officers of the regiment, with each entry linking to the corresponding service record.
The results are by no means perfect, but a vitally important point is that every record has a National Archive reference and page number linking it back to source.
Everything can be checked. If you find an error you can use the 'Report a problem' link to give feedback.

There's also a 'Record Search' page that lets you search for a name without involving the person matching algorithm. Again, this is instructive.
The results give you the fields used in person matching alongside any match made.
You see a 'link category' that gives you the algorithm's judgement of the match, and you can make you're own judgement from the data presented.

You can get a good feel for the strengths and weaknesses of the person matching from search results.
For example, the background discussion talks about difficulties such as use of initials, name abbreviations, and the "long S" problem in linking together records for a person.
These are nicely illustrated by the fact that 
[Fitz. Roy J. G. Maclean](https://www.georgianarmyofficers.org/person/99-41-10-002850_FITZWILLIA_---MACLEAN), 
[Fitz. J. Graston Maclean](https://www.georgianarmyofficers.org/person/99-48-22-000051_FITZWILLIA_---MACLEAN) and
[Sir Fitz Graston Maclean, Bt.](https://www.georgianarmyofficers.org/person/99-57-10-004357_---FITZROY_---MACLEAN)
are actually the same person: [Sir Fitzroy Jeffreys Grafton Maclean](https://en.wikipedia.org/wiki/Sir_Fitzroy_Maclean,_8th_Baronet).

## Data

Another really import and and useful feature of the database is that it provides mechanisms to download data and has a permissive license that lets you use it.

We used the 'Record Search' page with just each unit specified, and downloaded the results as CSV files.
The web site explains that the Army Lists are transcribed according to templates that differ slightly according to source document or section of source document.
It appears that templates differ in the number of fields they produce and the order of those fields.
Unfortunately, the downloaded CSV file is a simple concatenation of all the data, which means the columns don't line up between records produced using different templates.
This makes the downloaded data difficult to use. However, it turns out the whole dataset is available for download from the [Digital Humanities Institute data service](https://www.dhi.ac.uk/data/britisharmyofficers).
This does have consistent use of columns from all sources and includes a data dictionary.
It's ideal for further experimentation, the only downside being that the full dataset is dated March 2025 and records in the online database may have been amended since then.

## More than just a database 

The database improves the chances of pattern matching by adding 'regularised' fields for rank and regiment.
Adopting the same labels in other sources of data would make it easier to join that data with the Georgian Army Officers dataset.
We do much the same thing with ranks in our [Soldiers database](https://github.com/tigersmuseum/soldiers), and have published the [rank data](https://github.com/tigersmuseum/soldiers/tree/main/data) we use. 
It would be useful to find and advertise other sources of reference data that would improve the ability to join data across projects.
For example, [post-nominal letters](https://en.wikipedia.org/wiki/List_of_post-nominal_letters_(United_Kingdom%29).

Looking to the future, it would be nice if records in the Georgian Army Officers database and other research about the same people could be linked.
For example, the Napoleon Series website lists of [officers of the 37th Foot](https://www.napoleon-series.org/military-info/organization/Britain/Infantry/Regiments/c_37thFoot.html).
This list has quite good service histories for some officers but others have limited information that could be expanded.
[Edward Barwick](https://www.georgianarmyofficers.org/results?name=barwick&unit=37th%20Foot) is a case in point.
Linking data at any sort of scale will require software, which is helped if the resources at different sites are 'machine readable'.
A nice example of this is the entry for [Garrett Hugh Fitzgerald](https://doi.org/10.3318/dib.003144.v1) at the Dictionary of Irish Biography.
This includes a link to download the data as machine readable XML.
It also assigns a [Digital object identifier](https://en.wikipedia.org/wiki/Digital_object_identifier) to the biography, which will still find it if the web site changes.

The  Georgian Army Officers database feeds into a larger project, called [Data in the Archive](https://ahc.leeds.ac.uk/dir-record/research-projects/2093/data-in-the-archive),
that aims to work with the Galleries, Libraries, Archives, and Museums (GLAM) sector to develop best practice for collaborative collection, analysis and exploitation of archival records. There is an opportunity for regimental museums to use the Georgian Army Officers database to test such ideas.

