<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg" version="1.0">

<xsl:template name="getMapOffsets">

	<!-- 
		Convert a WW1 British trench map coordinate to an X,Y coordinate. Each 50 yd box in the trench map is translated to a point in
		a 720 x 480 grid. The map reference must be supplied as the "mapref" parameter.
		
		Programming by contract: There is no error checking in this template. The map reference must be presented with the 6 thousand yard box as an upper case 
		letter (A-X) and the 500 yard box as a lower case letter (a-d). Each part of the reference must be separated by a full stop. The easting and northing 
		must either both be a single digit (0-9), or both be a double digit (00-99). For example,
		
			I.31.b.9.4
			I.31.b.95.35
	 -->

	<xsl:param name="mapref"/>
	
	<!-- Parse the map reference  -->
	<xsl:variable name="sixThousand" select="substring-before($mapref, '.')"/>
	<xsl:variable name="oneThousand" select="substring-before(substring-after($mapref, concat($sixThousand, '.')), '.')"/>
	<xsl:variable name="fiveHundred" select="substring-before(substring-after($mapref, concat($sixThousand, '.', $oneThousand, '.')), '.')"/>
	<xsl:variable name="easting"     select="substring-before(substring-after($mapref, concat($sixThousand, '.', $oneThousand, '.', $fiveHundred, '.')), '.')"/>
	<xsl:variable name="northing"    select="substring-after(substring-after($mapref, concat($sixThousand, '.', $oneThousand, '.', $fiveHundred, '.')), '.')"/>
	
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
	
	<!-- Add offsets to get the offset of the (50 x 50 yard) map reference -->	
	<xsl:variable name="offsetX" select="$sixThousandX*120 + $oneThousandX*20 + $fiveHundredX*10 + $easting*$scale"/>
	<xsl:variable name="offsetY" select="$sixThousandY*120 + $oneThousandY*20 + $fiveHundredY*10 + 10 - $northing*$scale"/>
	
	<xsl:value-of select="concat($offsetX,',',$offsetY)"/>
	
</xsl:template>

</xsl:stylesheet>
