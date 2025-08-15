<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" doctype-public="about:legacy-doctype" indent="yes"/>
    
    <xsl:template match="/doc">
        <html>
            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/alpheios-components@latest/dist/style/style-components.min.css" />
                
                <title>Latin 101, Fall 2023, Sentences 1</title>
                <style>
                    .alpheios-morph-data__morphdata {
                    display: none;
                    }
                    .alpheios-inflections-list__inflections {
                    display: none;
                    }
                    
                    /* Main container for all sentences */
                    .sentences-container {
                    display: flex;
                    flex-direction: column;
                    gap: 20px;
                    padding: 10px;
                    }
                    
                    /* Responsive Grid Layout for each sentence and its notes */
                    .grid-container {
                    display: grid;
                    grid-template-areas:
                    "number main notes";
                    grid-template-columns: 50px 2fr 1fr; /* Set column widths for a balanced layout */
                    grid-gap: 10px;
                    background-color: #ebf5fb; /* Lighter background for the entire row */
                    padding: 15px;
                    border-radius: 8px;
                    border: 1px solid #cce6f2; /* Light border for visual separation */
                    }
                    
                    /* Styling for the sentence number */
                    .item1 {
                    grid-area: number;
                    font-size: 1.5em;
                    font-weight: bold;
                    color: #006400; /* Dark green for prominence */
                    }
                    
                    /* Styling for the Latin sentence */
                    .item2 {
                    grid-area: main;
                    font-size: 1.2em;
                    font-family: 'Times New Roman', serif;
                    color: black;
                    line-height: 1.5;
                    }
                    
                    /* Styling for the notes section */
                    .item3 {
                    grid-area: notes;
                    padding-left: 20px;
                    border-left: 1px dashed #cccccc; /* Separator for the notes section */
                    }
                    
                    .item3 ul {
                    /* list-style-type: none; Removed to restore bullet points */
                    padding-left: 20px;
                    margin: 0;
                    font-size: 0.9em;
                    line-height: 1.4;
                    color: #333333;
                    }
                    
                    .item3 ul li {
                    margin-bottom: 5px;
                    }
                </style>
            </head>
            <body>
                <h1>Sentences 1</h1>
                <h2>Translate these sentences into English and be ready to explain your work.</h2>
                
                <div class="alpheios-enabled sentences-container" lang="lat">
                    <xsl:apply-templates select="sentence"/>
                </div>
                
                <script type="text/javascript">
                    document.addEventListener("DOMContentLoaded", function (event) {
                    import ("https://cdn.jsdelivr.net/npm/alpheios-embedded@latest/dist/alpheios-embedded.min.js").then(embedLib => {
                    window.AlpheiosEmbed.importDependencies({
                    mode: 'cdn'
                    }).then(Embedded => {
                    new Embedded({
                    clientId: 'https://rgorman.github.io/Latin_101/Fall_2021/alph_test_Latin_101_sentences-2.html'
                    }).activate();
                    }).catch (e => {
                    console.error(`Import of Alpheios embedded library dependencies failed: ${e}`)
                    })
                    }).catch (e => {
                    console.error(`Import of Alpheios Embedded library failed: ${e}`)
                    })
                    });
                </script>
            </body>
        </html>
    </xsl:template>
    
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