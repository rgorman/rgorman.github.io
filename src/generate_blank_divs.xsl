<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <root>
            <xsl:for-each select="1 to 60">
                <div class="=grid-container">
                    <div class="item1">
                        <xsl:value-of select="."/>
                    </div>
                    <div class="item2">text</div>
                    <div class="item3">xxx</div>
                </div>
            </xsl:for-each>
        </root>
    </xsl:template>
    
   
    
    
    
</xsl:stylesheet>