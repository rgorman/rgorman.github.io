<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" doctype-public="about:legacy-doctype" indent="yes"/>
    
   
    
    <xsl:template match="sentence">
        <div class="grid-container" role="group">
            <xsl:attribute name="aria-labelledby">
                <xsl:value-of select="concat('sentence-', position())"/>
            </xsl:attribute>
            
            <div class="item1">
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('sentence-', position())"/>
                </xsl:attribute>
                <xsl:value-of select="position()"/>
            </div>
            
            <div class="item2">
                <xsl:for-each select="word[not(@artificial)]">
                    <xsl:value-of select="@form"/>
                    <xsl:if test="position() != last() and not(starts-with(following-sibling::word[1]/@lemma, 'punc'))">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </div>
            
            <div class="item3">
                NOTES
            </div>
        </div>
    </xsl:template>
    
</xsl:stylesheet>