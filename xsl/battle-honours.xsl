<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="html" version="1.0">

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
	<xsl:apply-templates select="//doc"/>
</xsl:template>

<xsl:template match="doc">
<doc>
	<xsl:apply-templates select="document(@url)/html:html"/>
</doc>
</xsl:template>

<xsl:template match="html:html">
	<xsl:apply-templates select=".//html:p[@class = 'bhlist']"/>
</xsl:template>

<xsl:template match="html:p[@class = 'bhlist']">
<battle>
	<xsl:apply-templates select="preceding::html:h4[1]"/>
	<xsl:apply-templates select="text()" mode="bhlist"/>
</battle>
</xsl:template>

<xsl:template match="html:h4">
	<title><xsl:value-of select="."/></title>
</xsl:template>

<xsl:template match="text()" mode="bhlist">
	<regiment><xsl:value-of select="normalize-space(.)"/></regiment>
</xsl:template>

</xsl:stylesheet>
