<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:time="http://www.w3.org/2006/time#" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:wb="urn:schemas-microsoft-com:office:spreadsheet" exclude-result-prefixes="html" version="1.0">

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html:html xmlns="http://www.w3.org/1999/xhtml">
	<html:head><html:title>Hospital Books</html:title></html:head>
	<html:body>
	<xsl:apply-templates select="//rdf:Bag"/>
	</html:body>
</html:html>
</xsl:template>

<xsl:template match="rdf:Bag">
	<html:h3><xsl:value-of select="skos:prefLabel"/></html:h3>
	<html:table>
	<html:tr><html:th>Reference</html:th><html:th>From</html:th><html:th>To</html:th></html:tr>
	<xsl:apply-templates select="rdfs:member" mode="table"/>
	</html:table>
</xsl:template>

<xsl:template match="rdfs:member" mode="table">
<html:tr>
	<html:td><html:a href="{@resource}"><xsl:value-of select="//skos:Concept[./@about = current()/@resource]/skos:notation"/></html:a></html:td>
	<html:td><xsl:value-of select="//time:ProperInterval[./@about = current()/@resource]/time:hasBeginning/time:Instant/time:inXSDDate"/></html:td>
	<html:td><xsl:value-of select="//time:ProperInterval[./@about = current()/@resource]/time:hasEnd/time:Instant/time:inXSDDate"/></html:td>
</html:tr>
</xsl:template>

</xsl:stylesheet>
