# Service Records

These are the public sources used to create a [Soldiers](https://github.com/tigersmuseum/soldiers) database for the Royal Hampshire Regiment museum. We want to be able to cite references to source material when researching former soldiers, and to make it easy to trace those references back to the original documents. The links below describe how we do this for each source.

## The National Archive

* [Hospital Admission and Discharge registers](hospital-books.md)

## Commonwealth War Graves Commission (CWGC)
You can download results from the [Find War Dead](https://www.cwgc.org/find-records/find-war-dead/) tool as a CSV file. The **Id** field is CWGC's unique casualty identifier. You can append the casualty identifier to the URL:

  `https://www.cwgc.org/find-records/find-war-dead/casualty-details/`

to create a URL pointing to the results page for the casualty. We use this both as a web link in a HTML report, and as a URI to represent the CWGC record for the soldier.

## The Ogilby Muster
[The Ogilby Muster](https://www.theogilbymuster.com/) publishes archive material held by British Regimental and Corps Museums. Each record is an image of a source document, and has a unique Ogilby Muster record number.

An example, from the Royal Hampshire Regiment Museum, is the Hampshire Regiment *Casualty Register for 1917-1918*. This has been transcribed by the museum and used to populate the database. The Casualty Register is a book. Each casualty record is referred to by the museum accession register reference for the Casualty Register and the page number where it appears.

The Ogilby Muster publishes the Casualty Register as a sequence of images of double-page spreads, each with its own record number. We have updated our transcribed records to add the relevant Ogilby Muster identifier to each record. You can append the Ogilby Muster record number to the URL:

  `https://www.theogilbymuster.com/record/`

to create a URL pointing to image. We use this both as a web link in a HTML report, and as a URI to represent the source reference.
