<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="div[@class='grid-container']">
        <div class="grid-container">
            <div class="item1"><xsl:number format="1"></xsl:number> </div>
            <div class="item2"><xsl:value-of select="text()"/></div>
            <div class="item3">xxx</div>
            
        
        
        </div>
        
    </xsl:template>
    
    
</xsl:stylesheet>