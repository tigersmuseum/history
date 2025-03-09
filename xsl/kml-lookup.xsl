<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:kml="http://www.opengis.net/kml/2.2" version="1.0">

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<map>
	<xsl:apply-templates select="//kml:name"/>
</map>
</xsl:template>

<xsl:template match="kml:name">
	<entry key="{.}" value="{.}"/>
</xsl:template>

</xsl:stylesheet>
