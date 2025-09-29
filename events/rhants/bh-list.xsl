<xsl:stylesheet version="1.0" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" encoding="UTF-8" />

<xsl:template match="/|*|@*|comment()|processing-instruction()|text()">
    <xsl:apply-templates select="*"/>
</xsl:template>

<xsl:template match="html:span[contains(@class, 'honour')]">
	<xsl:value-of select="."/>
	<xsl:text>&#13;</xsl:text>
</xsl:template>

</xsl:stylesheet>
