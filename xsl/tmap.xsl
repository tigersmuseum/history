<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg" version="1.0">

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<svg viewBox="0 0 720 480" preserveAspectRatio="none">
<style>
.sixThousand rect {
	fill:pink;
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


<xsl:template name="getMapOffsets">

	<xsl:param name="mapref"/>
	
	<!-- Parse the map reference  -->
	<xsl:variable name="sixThousand" select="substring-before($mapref, '.')"/>
	<xsl:variable name="oneThousand" select="substring-before(substring-after($mapref, concat($sixThousand, '.')), '.')"/>
	<xsl:variable name="fiveHundred" select="substring-before(substring-after($mapref, concat($sixThousand, '.', $oneThousand, '.')), '.')"/>
	<xsl:variable name="easting"     select="substring-before(substring-after($mapref, concat($sixThousand, '.', $oneThousand, '.', $fiveHundred, '.')), '.')"/>
	<xsl:variable name="northing"    select="substring-after(substring-after($mapref, concat($sixThousand, '.', $oneThousand, '.', $fiveHundred, '.')), '.')"/>

	<xsl:message><xsl:value-of select="$sixThousand"/></xsl:message>
	<xsl:message><xsl:value-of select="$oneThousand"/></xsl:message>
	<xsl:message><xsl:value-of select="$fiveHundred"/></xsl:message>
	<xsl:message><xsl:value-of select="$easting"/></xsl:message>
	<xsl:message><xsl:value-of select="$northing"/></xsl:message>
	
	<!--  scaling factor to cope with easting and northing being 5 yard (vice 50 yard) boxes -->
	<xsl:variable name="scale">
		<xsl:choose>
			<xsl:when test="string-length($easting) = 2">
				<xsl:value-of select="number(0.1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="number(1.0)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<!-- Calculate offsets of boxes in a 1:40000 scale map (6 x 4 six thousand yard boxes) at 720 x 480 pixels -->	
	<xsl:variable name="sixThousandX" select="string-length(substring-before('ABCDEFGHIJKLMNOPQRSTUVWX', $sixThousand)) mod 6"/>
	<xsl:variable name="sixThousandY" select="floor(string-length(substring-before('ABCDEFGHIJKLMNOPQRSTUVWX', $sixThousand)) div 6)"/>
	<xsl:variable name="oneThousandX" select="($oneThousand - 1) mod 6"/>
	<xsl:variable name="oneThousandY" select="floor(($oneThousand - 1) div 6)"/>
	<xsl:variable name="fiveHundredX" select="string-length(substring-before('abcd', $fiveHundred)) mod 2"/>
	<xsl:variable name="fiveHundredY" select="floor(string-length(substring-before('abcd', $fiveHundred)) div 2)"/>
	
	<xsl:message>6K: <xsl:value-of select="$sixThousandX"/>,<xsl:value-of select="$sixThousandY"/></xsl:message>
	<xsl:message>1K: <xsl:value-of select="$oneThousandX"/>,<xsl:value-of select="$oneThousandY"/></xsl:message>
	<xsl:message>5H: <xsl:value-of select="$fiveHundredX"/>,<xsl:value-of select="$fiveHundredY"/></xsl:message>
	
	<!-- Add offsets to get the offset of the (50 x 50 yard) map reference -->	
	<xsl:variable name="offsetX" select="$sixThousandX*120 + $oneThousandX*20 + $fiveHundredX*10 + $easting*$scale"/>
	<xsl:variable name="offsetY" select="$sixThousandY*120 + $oneThousandY*20 + $fiveHundredY*10 + 10 - $northing*$scale"/>
	
	<xsl:message>offset: <xsl:value-of select="$offsetX"/>,<xsl:value-of select="$offsetX"/></xsl:message>
	
	<xsl:value-of select="concat($offsetX,',',$offsetY)"/>
	
</xsl:template>

</xsl:stylesheet>
