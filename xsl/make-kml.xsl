<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" version="1.0">

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="rdf:RDF">
<kml:kml>
	<kml:Document>
		<kml:Style id="defaultIcon">
			<kml:IconStyle>
				<kml:Icon>
					<kml:href>http://maps.google.com/mapfiles/kml/paddle/orange-blank.png</kml:href>
				</kml:Icon>
			</kml:IconStyle>
		</kml:Style>
		<kml:name>Testing</kml:name>
	    <xsl:apply-templates select=".//geo:Point"/>
	</kml:Document>
</kml:kml>
</xsl:template>

<xsl:template match="geo:Point">
	<kml:Placemark>
		<kml:name><xsl:value-of select="../skos:prefLabel"/></kml:name>
		<styleUrl>#defaultIcon</styleUrl>
		<kml:Point>
			<kml:coordinates><xsl:value-of select="concat(geo:long, ',',geo:lat, ',0')"/></kml:coordinates>
		</kml:Point>
	</kml:Placemark>
</xsl:template>

</xsl:stylesheet>
