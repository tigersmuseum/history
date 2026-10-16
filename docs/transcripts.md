# Transcripts

Some notes on the producing useful transcripts of historical documents.

## Metadata

At minimum, your transcript should include the information that allows a researcher to find the original document.
You may also want to include information about authorship, ownership, licensing, copyright, etc. 
[The Dublin Core™ Metadata Initiative (DCMI)](https://www.dublincore.org/) goes into great detail about metadata. 
This is probably overkill for your needs, but it's worth perusing the [DCMI terms](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/)
to get a sense of the information that would be useful to a researcher who wants to use, as well as read, your transcript.

Add explanatory notes at the beginning or end of you transcript if you've made any judgements the reader should know about.
Explain how you've handle illegible phrases. Note where drawings or diagrams have been omitted.
Make it clear if stylistic information, such as underlining or coloured text, in your transcript is important to the sense of it.

## Format

Anything will do, but a useful end format to aim for is XHTML. This has advantages:

* It displays in a web browser, so is easy to distribute.
* It is machine readable as well as human readable. You (or someone else) can further enhance machine readability by adding [semantic mark-up](semantic-markup.md).
* DCMI terms can be added in *meta* elements. 

It's possible to create XHTML from Word processor documents, so you don't feel you have to use it - by all means
stick with what you know and let someone else make it machine readable. You can make that person's job a little easier though:

* Don't use tabs and spaces to reproduce columns in the source text, use a table instead.
* If the text naturally breaks into sections, do something consistent to mark the break between sections.

You need to  transcribe to a word processor document if you want to preserve as much of the layout of source text as possible.
If you're transcribing essentially tabular data, such as a nominal roll, then the task is more data entry than transcription.
It makes sense to create a spreadsheet rather than a word processor document. Machine readability is now the point:

* Make sure your column format is suited to the data you're entering. Your spreadsheet will make its best guess, but this might not be right.
For example, it may think service numbers are integers and remove leading zeroes.
* Use date format columns for dates if you can. Always enter a year as four digits, even if the source just uses two.
* If there's a "name" column in source that contains rank, surname, initials etc., then consider splitting these out into separate columns.
Similarly, consider splitting mixed source columns such as "forenames or initials" into two in the spreadsheet.
* If there's a 'ditto' in the source, repeat the data rather than putting a ditto in the spreadsheet.
* Keep the rows simple. Avoid cells that cover more than one row or column. Repeat data if necessary.

## HTML

Inside an XHTML document, HTML tags can be used to structure the document and label data.
This section describes some conventional uses of HTML mark-up that can make it easier to extract information.

### Chronology

War diaries, digest of services, etc. list events in time order. They are chronologies.
Each entry is associated with a period of time. It might cover a day or a month for example.
Entries may be grouped: days into months, months into years.

It's helpful if there is some way of delimiting entries in the underlying HTML, such as `p`, `row`, `div`, `article`.
If periods of time are grouped into larger periods of time in the source text then this should be reflected in the HTML structure.
This means that entries for days should be nested inside a containing element for a month, and months similarly contained inside years.
Where a date appears, it should be inside a HTML `time` element with the `datetime` attribute set accordingly.

It's then simple to extract text from the HTML associated with a particular date.
Any events described in the text can be assumed to relate to that date.

### Class attributes

A class attribute can be used as a semantic label.
If, for example, the source document uses bold text for mentioning people, and you want to reproduce this in your transcript, you'll need to enclose the name in a `span` element and give it a 'class` attribute, with some corresponding CSS styling.
You might as well make the class label meaningful, such as "person", which then lets follow-on processing easily find spans of text that are people.

It's useful to use `span` and `class` like this even if there is no different CSS style required.
One beneficial side-effect is that it lets you later (and temporarily) assign styles to hilight mark-up entities.
 
