<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" version="1.0">

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="kml:Document">
<DOC>
    <xsl:apply-templates select=".//kml:Placemark"/>
</DOC>
</xsl:template>

<xsl:template match="kml:Placemark">
<ITEM>
<name><xsl:value-of select="kml:name"/></name>
<latitude><xsl:value-of select="kml:LookAt/kml:latitude"/></latitude>
<longitude><xsl:value-of select="kml:LookAt/kml:longitude"/></longitude>
</ITEM>
</xsl:template>

</xsl:stylesheet>
