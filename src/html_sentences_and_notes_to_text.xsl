<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="no"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//div[@class='grid-container']"/>
    </xsl:template>
    
    <xsl:template match="div[@class='grid-container']">
        <xsl:value-of select="div[@class='item1']"/>
        <xsl:text>. </xsl:text>
        <xsl:value-of select="div[@class='item2']"/>
        <xsl:text>&#x0a;</xsl:text>
        <xsl:apply-templates select="div[@class='item3']"/>
    </xsl:template>
    
    <xsl:template match="div[@class='item3']">
        <xsl:for-each select="ul/li">
            <xsl:text>     * </xsl:text>
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:text>&#x0a;</xsl:text>
        </xsl:for-each>
        <xsl:text>&#x0a;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>