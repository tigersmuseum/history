# Transcripts

Some notes on the producing useful transcripts of historical documents.

## Metadata

At minimum, your transcript should include the information that allows a researcher to find the original document.
You may also want to include information about authorship, ownership, licensing, copyright, etc. 
[The Dublin Core™ Metadata Initiative (DCMI)](https://www.dublincore.org/) goes into great detail about metadata. 
This is probably overkill for your needs, but it's worth perusing the [DCMI terms](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/)
to get a sense of the information that would be useful to researcher who want to use, as well as read, your transcript.

Add explanatory notes at the beginning or end of you transcript if you've made any judgements the reader should know about.
Explain how you've handle illegible phrases. Note where drawings or diagrams have been omitted.
Make it clear if stylistic information, such as underlining or coloured text, in your transcript is important to the sense of it.


## Format

Anything will do, but a useful end format to aim for is XHTML. This has advantages:

* It displays in a web browser, so is easy to distribute.
* It is machine readable as well as human readable. You (or someone else) can further enhance machine readability by adding semantic mark-up.
* DCMI terms can be added in *meta* elements. 

It's possible to create XHTML from Word processor documents, so you don't feel you have to use it - by all means
stick with what you know and let someone else make it machine readable. You can make that person's job a little easier though:

* Don't use tabs and spaces to reproduce columns in the source text, use a table instead.
* If the text naturally breaks into sections, do something consistent to mark the break between sections.

You need to  transcribe to a word processor document if you want to preserve as much of the layout of source text as possible.
If you're transcribing essentially tabular data, such as nominal roll, then the task is more data entry than transcription.
It makes sense to create a spreadsheet rather than a word processor document. Machine readability is now the point:

* Make sure your column format is suited to the data you're entering. Your word processor will make its best guess, but this might not be right.
For example, it will tend to think service numbers are integers and remove leading zeroes.
* Use date format columns for dates if you can. Always enter a year as four digits, even if the source just uses two.
* If there's a "name" column in source that contains rank, surname, initials etc., then consider splitting these out into separate columns.
Similarly, consider splitting mixed source columns such as "forenames or initials" into two in the spreadsheet.
* If there's a 'ditto' in the source, repeat the data rather than putting a ditto in the spreadsheet.
* Keep the rows simple. Avoid cells that cover more than one row. Repeat data if necessary.

