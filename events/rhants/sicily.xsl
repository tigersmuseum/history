<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--
	Filtering events before building graph ...
 -->

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>


<xsl:template match="/|*|@*|comment()|processing-instruction()|text()">
	<xsl:copy>
		<xsl:apply-templates select="*|@*|comment()|processing-instruction()|text()"/>
	</xsl:copy>
</xsl:template>

 
 <xsl:template match="event[interval/@fm &gt;= 19430701 and interval/@to &lt;= 19430817]">
 	<!-- Only consider events in this data range -->
 	<xsl:apply-templates select="." mode="choose" />
 </xsl:template>

 <xsl:template match="event[entity[@type = 'unit'] = '1 Bn']" mode="choose">
 	<xsl:copy-of select="." />
 </xsl:template>

 <xsl:template match="event[entity[@type = 'unit'] = '2/4 Bn']" mode="choose">
 	<xsl:copy-of select="." />
 </xsl:template>

 <xsl:template match="event"/>
 <xsl:template match="event" mode="choose"/>

</xsl:stylesheet>