<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <!--
    Dodicesimo Esercizio
    nome: Erika
    cognome: Deboni
    nome del file: 12_esercizio.xml   
    descrizione:
    modificare opportunamente il file template.xsl aggiornando variabili e parametri e call template
    -->
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="12esercizio.css" />
            </head>   
            
            <body> 
                <div>
                    <xsl:apply-templates select="//tei:titleStmt"/>
                </div>
                <div>
                <xsl:apply-templates select="//tei:editionStmt" />
                </div>
                <div>
                <xsl:apply-templates select="//tei:publicationStmt"/>
                </div> 
                <div>
                    <xsl:apply-templates select="//tei:msIdentifier"/>
                </div>  
                <div>
                    <xsl:apply-templates select="//tei:msContents"/>
                </div>  
                <div>
                    <xsl:apply-templates select="//tei:physDesc"/>
                </div>  
                <div>
                    <xsl:apply-templates select="//tei:profileDesc"/>
                </div>  
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="tei:titleStmt">
        <h1 class="titolo1"> 
            <xsl:value-of select="./tei:title" />
            <xsl:value-of select="./tei:author" />
            <xsl:value-of select="./tei:respStmt/tei:resp"/> 
            <xsl:value-of select="./tei:respStmt/tei:name"/>
        </h1>    
    </xsl:template>

    <xsl:template match="tei:editionStmt">
    <div>
        <xsl:value-of select="./tei:edition"/>
    </div>
    </xsl:template>  
    
    <xsl:template match="tei:publicationStmt">
    <div>
        <xsl:value-of select="./tei:publisher"/>
        <xsl:value-of select="./tei:pubPlace" />
    </div>
    </xsl:template>

    <xsl:template match="tei:msIdentifier">
        <div>
            <xsl:value-of select="./country"/>
            <xsl:value-of select="./settlement"/>
            <xsl:value-of select="./repository"/>
            <xsl:value-of select="./idno"/>
            <xsl:value-of select="./altIdentifier"/>
        </div>
    </xsl:template>  
    
    <xsl:template match="tei:msContents">
        <div>
            <xsl:value-of select="./tei:msItem/tei:author"/>
            <xsl:value-of select="./tei:msItem/tei:title"/>
            <xsl:value-of select="./tei:msItem/tei:textLang"/>
        </div>
    </xsl:template>

    <xsl:template match="tei:physDesc">
        <div>
            <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:support/tei:material"/>
            <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:support/tei:stamp"/>
            <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:support/tei:p"/>
            <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:condition"/>
            <xsl:value-of select="./tei:handDesc//tei:handNote"/>
        </div>
    </xsl:template>

    <xsl:template match="tei:profileDesc">

        <div>
            <xsl:value-of select="./tei:correspDesc/tei:correspAction[@type='sent']" />
            <xsl:value-of select="./tei:correspDesc/tei:correspAction[@type='received']/tei:persName"/>
            <xsl:value-of select="./tei:correspDesc/tei:correspAction[@type='received']/tei:placeName"/> 
            <xsl:value-of select="./tei:textClass/tei:keywords/tei:term" />
        </div>    
    </xsl:template>
    
</xsl:stylesheet>