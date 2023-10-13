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
	<!-- Get the alphabetical index -->
	<xsl:apply-templates select=".//html:a[@id = 'ALPHA_LIST']"/>
	<!-- Get the chronology -->
	<xsl:apply-templates select=".//html:a[@id = 'CHRONO_LIST']"/>
	<!--  move to page 425 -->
	<xsl:apply-templates select=".//html:a[@id = 'Page_425']"/>
	<!-- Casualties -->
	<casualties>
		<xsl:apply-templates select=".//html:p[starts-with(@class, 'cas')]" mode="casualties"/>
	</casualties>
</xsl:template>

<xsl:template match="html:a[@id = 'ALPHA_LIST']">
	<xsl:apply-templates select="following::html:div[1]" mode="index"/>
</xsl:template>

<xsl:template match="html:div" mode="index">
<index>
	<xsl:apply-templates select=".//html:tr[count(html:td) = 2]" mode="index"/>
</index>
</xsl:template>

<xsl:template match="html:a[@id = 'CHRONO_LIST']">
	<xsl:apply-templates select="following::html:div[1]" mode="chronology"/>
</xsl:template>

<xsl:template match="html:div" mode="chronology">
<chronology>
	<xsl:apply-templates select=".//html:tr[count(html:td) = 2]" mode="chronology"/>
</chronology>
</xsl:template>

<xsl:template match="html:tr" mode="index">
	<honour href="{html:td[2]/html:a/@href}"><xsl:value-of select="html:td[1]"/></honour>
</xsl:template>

<xsl:template match="html:tr" mode="chronology">
	<xsl:variable name="date">
		<xsl:apply-templates select="." mode="getdate" />
	</xsl:variable>
	<honour date="{$date}"><xsl:value-of select="html:td[2]"/></honour>
</xsl:template>

<xsl:template match="html:tr" mode="getdate">
	<xsl:variable name="text" select="html:td[1]/text()" />
	<xsl:choose>
		<xsl:when test="$text = '&quot;'">
			<xsl:apply-templates select="preceding-sibling::html:tr[1]" mode="getdate" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$text"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="html:a[@id = 'Page_425']">
	<!-- find battle honour lists before this page -->
	<xsl:apply-templates select="preceding::html:p[@class = 'bhlist']"/>
	<!-- The Ladysmith honours list regiments in footnotes rather than body text ... -->
	<entitlement>
		<title>Relief of Ladysmith.</title>
		<xsl:apply-templates select="following::html:p[html:a[@id = 'Footnote_32_32']]" mode="bhfootnote"/>
	</entitlement>
	<entitlement>
		<title>The Defence of Ladysmith, October 29, 1899, to February 27, 1900.</title>
		<xsl:apply-templates select="following::html:p[html:a[@id = 'Footnote_33_33']]" mode="bhfootnote"/>
	</entitlement>
</xsl:template>

<xsl:template match="html:p" mode="bhfootnote">
	<xsl:apply-templates select="following-sibling::html:p[1]/text()" mode="bhlist"/>
</xsl:template>

<xsl:template match="html:p[@class = 'bhlist']">
<entitlement>
	<xsl:apply-templates select="preceding::html:h4[1]"/>
	<xsl:apply-templates select="text()" mode="bhlist"/>
</entitlement>
</xsl:template>

<xsl:template match="html:h4">
	<title><xsl:value-of select="."/></title>
</xsl:template>

<xsl:template match="text()" mode="bhlist">
	<xsl:variable name="regiment" select="normalize-space(.)"/>
	<xsl:if test="string-length($regiment)">
		<regiment><xsl:value-of select="$regiment"/></regiment>
	</xsl:if>
</xsl:template>


<xsl:template match="html:p" mode="casualties">
	<list>
		<engagement><xsl:value-of select="normalize-space(.)"/></engagement>
		<xsl:apply-templates select="following::html:table[1]//html:tr[html:td[1]/@class = 'tdl']" mode="casualties"/>
	</list>
</xsl:template>

<xsl:template match="html:tr[contains(html:td[1] , 'Hamps')]" mode="casualties">
	<regiment ko="{html:td[2]}" wo="{html:td[3]}" km="{html:td[4]}" wm="{html:td[5]}"><xsl:value-of select="html:td[1]"/></regiment>
</xsl:template>

<xsl:template match="html:tr" mode="casualties"/>

</xsl:stylesheet>
