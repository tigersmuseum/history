<?xml version="1.0"?>
<xsl:stylesheet xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="html">

<!-- 
	Rowe: Input XHTML events, output event objects with text and mentioned entities
 -->

<xsl:output method="xml" encoding="UTF-8"/>

<xsl:param name="source" select="''"/>

<xsl:template match="/">
<data>
	<xsl:apply-templates select="//html:div"/>
</data>
</xsl:template>

<xsl:template match="html:div">
	<xsl:apply-templates select=".//html:p[not(@class = 'date')]"/>
</xsl:template>

<xsl:template match="html:p">
<xsl:variable name="id"><xsl:call-template name="getId"/></xsl:variable>
<event uri="{concat($source, '#', $id)}" date="{../html:p[1]//@content}">
	<text><xsl:apply-templates select="." mode="copy"/></text>
	<xsl:apply-templates select="html:span"/>
</event>
</xsl:template>


<xsl:template match="html:span">
<xsl:if test="not(preceding-sibling::html:span[. = current()])">
	<xsl:variable name="entity">
		<xsl:choose>
			<xsl:when test="@content"><xsl:value-of select="@content"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<entity type="{@class}"><xsl:value-of select="$entity"/></entity>
</xsl:if>
</xsl:template>

<xsl:template match="html:span[@class= 'ref']"/>
<xsl:template match="html:span[@class= 'date']"/>

 
<xsl:template match="*" mode="copy">
	<xsl:apply-templates select="text()|*" mode="copy"/>
</xsl:template>

<xsl:template match="text()" mode="copy">
	<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="html:span[@class = 'ref']" mode="copy"/>

<xsl:template name="getId">
	<xsl:choose>
		<xsl:when test="@id">
			<xsl:value-of select="@id"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="generate-id()"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
