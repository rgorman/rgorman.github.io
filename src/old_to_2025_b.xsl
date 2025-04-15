<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:template match="//l">
        
        <p>
           
                <xsl:choose>
                    <xsl:when test="./@rend = 'indent'">
                        
                        <xsl:attribute name="class">pentam</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- No output for this attribute -->
                    </xsl:otherwise>
                </xsl:choose>
            <xsl:attribute name="data-alpheios_tb_sent"><xsl:value-of select="../@data-alpheios_tb_sent"/></xsl:attribute>
            
            <xsl:value-of select="./node()"/>
            
            
        </p>
        
    </xsl:template>
    
    <xsl:template match="span"/>
    
    
    
</xsl:stylesheet>