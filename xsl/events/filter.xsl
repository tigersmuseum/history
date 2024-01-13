<?xml version="1.0"?>
<xsl:stylesheet xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="html">
<xsl:output method="xml" encoding="UTF-8"/>

<xsl:import href="html-source.xsl"/>

<xsl:template match="html:p[.//html:span[@class = 'op']]">
<xsl:apply-imports/>
</xsl:template>

<xsl:template match="html:p"/>

<xsl:template match="html:span[@class = 'op']">
<xsl:apply-imports/>
</xsl:template>

<xsl:template match="html:span"/>

</xsl:stylesheet>
