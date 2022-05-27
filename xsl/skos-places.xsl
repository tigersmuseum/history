<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" version="1.0">

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="kml:Document">
<rdf:RDF>
    <xsl:apply-templates select=".//kml:Placemark"/>
</rdf:RDF>
</xsl:template>

<xsl:template match="kml:Placemark">
<skos:Concept>
	<skos:prefLabel><xsl:value-of select="kml:name"/></skos:prefLabel>
	<geo:Point>
		<geo:lat><xsl:value-of select="substring-before(substring-after(kml:Point/kml:coordinates, ','), ',')"/></geo:lat>
		<geo:long><xsl:value-of select="substring-before(kml:Point/kml:coordinates, ',')"/></geo:long>
	</geo:Point>
</skos:Concept>
</xsl:template>

</xsl:stylesheet>
