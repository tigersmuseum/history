<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/2000/svg" xmlns:btmaps="http://rdf.muninn-project.org/ontologies/btmaps#" xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="foaf owl">

<!-- 
	Generate an SVG diagram of the Western Front Trench Map grid described in the British Trench Maps (BTMAPS) Ontology Specification.
	See: https://rdf.muninn-project.org/ontologies/btmaps-en.html
	
	The input is the BTMAPS OWL file.
	
	The approach is to start in the bottom right-hand corner of the grid, sheet 70c: Draw a rectangle for this sheet, and move north, drawing each sheet
	in the column. Next, step west and draw the next column; and so on, until all are drawn.
 -->

<xsl:output method="xml" encoding="UTF-8" indent="yes" />

<xsl:param name="x70c" select="3000"/>
<xsl:param name="y70c" select="5000"/>
<xsl:param name="sheetWidth" select="720"/>
<xsl:param name="sheetHeight" select="480"/>

<xsl:template match="/">
<svg viewBox="0 0 4000 5600" width="100%" preserveAspectRatio="xMidYMid meet">
	<xsl:apply-templates select="//btmaps:GridSquare[foaf:name = '70c']" mode="stepWest">
		<xsl:with-param name="x" select="$x70c"/>
		<xsl:with-param name="y" select="$y70c"/>
	</xsl:apply-templates>
</svg>
</xsl:template>


<xsl:template match="btmaps:GridSquare" mode="stepNorth">
	<xsl:param name="x"/>
	<xsl:param name="y"/>
	<!-- Draw a rectangle representing this sheet -->
	<g transform="translate({$x}, {$y})" rdf:about="{concat('btmaps:', translate(@rdf:about, '#', ''))}">
		<rect x="0" y="0" width="{$sheetWidth}" height="{$sheetHeight}" style="stroke:blue; fill:none"/>
		<text x="{$sheetWidth div 2}" y="{$sheetHeight div 2}" style="font-size:{$sheetWidth div 10}px; text-anchor:middle"><xsl:value-of select="./foaf:name"/></text>
	</g>
	<!-- Apply this same template to the sheet north of this one -->
	<xsl:apply-templates select="//btmaps:GridSquare[./@rdf:about = current()/btmaps:isSouthOf/@rdf:resource]" mode="stepNorth">
		<xsl:with-param name="x" select="$x"/>
		<xsl:with-param name="y" select="$y - $sheetHeight"/>
	</xsl:apply-templates>
</xsl:template>


<xsl:template match="btmaps:GridSquare" mode="stepWest">
	<xsl:param name="x"/>
	<xsl:param name="y"/>
		<!--  Draw this column -->
		<xsl:apply-templates select="." mode="stepNorth">
			<xsl:with-param name="x" select="$x"/>
			<xsl:with-param name="y" select="$y"/>
		</xsl:apply-templates>
		<!--  Apply this same template to the sheet west of this one -->
		<xsl:apply-templates select="//btmaps:GridSquare[./btmaps:isWestOf/@rdf:resource = current()/@rdf:about]" mode="stepWest">
			<xsl:with-param name="x" select="$x - $sheetWidth"/>
			<xsl:with-param name="y" select="$y"/>
		</xsl:apply-templates>
</xsl:template>

</xsl:stylesheet>
