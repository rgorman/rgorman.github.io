<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="//div[@class = 'item2']">
        
            
            <div class="item2">
                <xsl:attribute name="data-alpheios_tb_sent">
                    <xsl:value-of select="../div[@class = 'item1']"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/></div>
            
            
        
        
        
        
    </xsl:template>
    
    
</xsl:stylesheet>