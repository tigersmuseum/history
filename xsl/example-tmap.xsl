<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg" version="1.0">

<!-- 
	This example creates SVG circles from the British trench map references in the input XML, located in a 720 x 480 grid.
	A few six thousand yard boxes (A,H and X) are also shown.
	
	The translation of map reference to coordinate is done by the named template 'getMapOffsets' in the imported 'tmap.xsl' stylesheet.
	This takes a map reference as input and returns X,Y coordinates. It is therefore independent of both the format of input data and how 
	the translated coordinate is used. The dependencies on input and output are instead absorbed into this stylesheet. 
 -->

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:include href="tmap.xsl"/>

<xsl:template match="/">
<svg viewBox="0 0 720 480" preserveAspectRatio="none">
<style>
.sixThousand rect {
	fill:lavender;
}
.oneThousand rect {
	fill:gold;
}
.fiveHundred rect {
	fill:lightgrey;
}
.marker {
	stroke-width:0;
	fill:green;
}
</style>

<g id="A" class="sixThousand">
<rect width="120" height="120"/>
<text x="60" y="65" style="text-anchor:middle">A</text>
</g>

<g id="H" transform="translate(120,120)" class="sixThousand">
<rect width="120" height="120"/>
<text x="60" y="65" style="text-anchor:middle">H</text>
</g>


<g id="X" transform="translate(600,360)" class="sixThousand">
<rect width="120" height="120"/>
<text x="60" y="65" style="text-anchor:middle">X</text>
</g>

<xsl:apply-templates select="//mapref"/>

</svg>
</xsl:template>


<xsl:template match="mapref">

	<xsl:variable name="offsets">
		<xsl:call-template name="getMapOffsets">
			<xsl:with-param name="mapref" select="@content"/>
		</xsl:call-template>
	</xsl:variable>

<circle cx="{substring-before($offsets, ',')}" cy="{substring-after($offsets, ',')}" r="2" class="{@class}" content="{@content}"/>

</xsl:template>


</xsl:stylesheet>
