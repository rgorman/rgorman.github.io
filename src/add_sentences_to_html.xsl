<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/treebank">
        <xsl:apply-templates select="sentence"/>
    </xsl:template>
    
    <xsl:template match="sentence">
        <div class="grid-container" role="group">
            <xsl:attribute name="data-alpheios_tb_sent">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="data-alpheios_tb_ref">
                <xsl:value-of select="concat('.', @id)"/>
            </xsl:attribute>
            <xsl:attribute name="aria-labelledby">
                <xsl:value-of select="concat('sentence-', @id)"/>
            </xsl:attribute>
            
            <div class="item1">
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('sentence-', @id)"/>
                </xsl:attribute>
                <xsl:value-of select="@id"/>
            </div>
            
            <div class="item2">
                <xsl:for-each select="word[not(@artificial='elliptic')]">
                    <xsl:value-of select="@form"/>
                    <xsl:if test="position() != last()">
                        <xsl:choose>
                            <xsl:when test="@lemma = 'punc1'">
                                <xsl:text> </xsl:text>
                            </xsl:when>
                            <xsl:when test="following-sibling::word[not(@artificial='elliptic')][1]/@lemma != 'punc1'">
                                <xsl:text> </xsl:text>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:if>
                </xsl:for-each>
            </div>
            
            <div class="item3">
                <xsl:text>&#10;                  NOTES&#10;                </xsl:text>
            </div>
        </div>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>