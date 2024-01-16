<?xml version="1.0"?>
<xsl:stylesheet xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="html">

<!-- 
	Input XHTML events, output event objects with text and mentioned entities
 -->
<xsl:output method="xml" encoding="UTF-8"/>

<xsl:template match="/">
<temporal>
<!-- 
	<xsl:apply-templates select="//html:p[html:span[@class = 'person' or @class='role']]"/>
 -->
	<xsl:apply-templates select="//html:td/html:p"/>
</temporal>
</xsl:template>

<xsl:template match="html:p">
<xsl:variable name="date" select="ancestor::html:tr[1]/html:td[1]/html:span[1]/@content"/>
<event uri="{concat('https://tigersmuseum.github.io/history/events/rhants/eventdiary.xhtml#', ancestor::html:tr[1]/@id)}" date="{$date}" fm="{$date}" to="{$date}">
	<text><xsl:apply-templates select="." mode="copy"/></text>
	<tag type="location"><xsl:value-of select="ancestor::html:tr[1]/html:td[@class = 'location'][1]"/></tag>
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

</xsl:stylesheet>
