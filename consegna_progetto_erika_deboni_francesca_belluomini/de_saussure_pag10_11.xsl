<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

        <html>
            <head>
                <link rel="stylesheet" href="reset.css" />
                <link rel="stylesheet" href="style.css" />
                <link rel="stylesheet" href="popup.css" />
            </head>
            <body>
                <div>
                    <xsl:apply-templates select="//tei:titleStmt"/>
                </div>

                <div>
                    <xsl:apply-templates select="//tei:sourceDesc" />
                </div>
                <div>
                    <xsl:apply-templates select="//tei:msContents"/>
                </div>

                <xsl:apply-templates select="//tei:physDesc"/>

                <div>
                    <xsl:apply-templates select="//tei:div[@type='autore']"/>
                </div>
                            <!-- sezione bottoni -->
                <div id="contenitore_bottoni">
                    <button id="bottone_pag10" class="bottone">Pagina 10</button>
                    <button id="bottone_pag11" class="bottone">Pagina 11</button>
                    <button id="bottone_terminologia" class="bottone">Terminologia</button>
                    <button id="bottone_varianti" class="bottone">Varianti</button>
                    <button id="bottone_legenda" class="bottone">Legenda</button>
                    <button id="bottone_entita" class="bottone">Entità nominate</button>
                </div>
                
                <table id="tabella_trascrizione_e_facsimile">
                    <tr>
                        <td>

                            <!-- trascrizione -->
                            <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='trascrizione']"/>

                        </td>
                        <td>

                            <!-- immagini con aree sensibili (dati provenienti da facsimile -->
                            <div id="sezione_immagini">
                                <xsl:apply-templates select="tei:TEI/tei:facsimile" />
                            </div>

                        </td>
                    </tr>    
                </table>
                

                <div id="contenitore_footer">

                    <!-- traduzione -->
                    <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='traduzione']"/>

                    <hr />

                    <footer>
                        <div>
                            <xsl:apply-templates select="//tei:editionStmt"/>
                        </div>
                    </footer>

                </div>

                <div class="hover_bkgr_fricc" id="popup_legenda">
                    <span class="helper"></span>
                    <div>
                       <div class="popupCloseButton" id="chiudi_legenda">&#215;</div>
                       <table id="legenda">
                          <tr>
                             <td class="legenda_term">termine tecnico &#60;term&#62;</td>
                          </tr>
                          <tr>
                             <td class="legenda_antroponimo">antroponimo &#60;name&#62;</td>
                          </tr>
                          <tr>
                             <td class="legenda_istituzione">istituzione &#60;orgName&#62;</td>
                          </tr>
                          <tr>
                             <td class="legenda_unclear">testo non chiaro &#60;unclear&#62;</td>
                          </tr>
                          <tr>
                            <td class="legenda_damage">testo danneggiato &#60;damage&#62;</td>
                         </tr>
                          <tr>
                             <td class="legenda_abbr">abbreviazione &#60;abbr&#62;</td>
                          </tr>
                          <tr>
                             <td class="legenda_expan">espansione &#60;expan&#62;</td>
                          </tr>
                          <tr>
                             <td class="legenda_add">testo aggiunto &#60;add&#62;</td>
                          </tr>
                          <tr>
                             <td class="legenda_del">testo cancellato &#60;del&#62;</td>
                          </tr>
                          <tr>
                             <td class="legenda_del_overwrite">sovrascrittura &#60;del&#62;</td>
                          </tr>
                          <tr>
                             <td class="legenda_am">titulus &#60;am&#62;</td>
                          </tr>
                          <tr>
                             <td class="legenda_pc">punteggiatura &#60;pc&#62;  </td>
                          </tr>
                          <tr>
                            <td class="legenda_sic">errore &#60;sic&#62;</td>
                         </tr>
                         <tr>
                            <td class="legenda_reg">regolare &#60;reg&#62;</td>
                         </tr>
                        </table>
                    </div>
                </div>
                
                <div class="hover_bkgr_fricc" id="popup_entita">
                    <span class="helper"></span>
                    <div>
                        <div class="popupCloseButton" id="chiudi_entita">&#215;</div>
                        <div class="contenitore_entita">
                            <div class="separatore_entita">Terminologia:</div>
                            <xsl:apply-templates select="//tei:list[@type='terminology']" />
                            <div class="separatore_entita">Istituzioni:</div>
                            <xsl:apply-templates select="//tei:listOrg" />
                            <div class="separatore_entita">Antroponimi:</div>
                            <xsl:apply-templates select="//tei:back/tei:listPerson" />
                        </div>
                    </div>
                </div>    

                <script src="codice.js"/>
            </body>
        </html>
    </xsl:template>


    <!-- estrazione della surface (gruppo di zone) dal nodo facsimile-->
    <xsl:template match="tei:facsimile">

        <div id="sez_img_pag10">
            <xsl:apply-templates select="tei:surface[@n='1']"/>
        </div>

        <div id="sez_img_pag11">
            <xsl:apply-templates select="tei:surface[@n='2']"/>
        </div>

    </xsl:template>

    <!-- estrazione della surface (gruppo di zone) -->
    <xsl:template match="tei:surface[@n='1']">

        <div id="facsimile_pag10" class="contenitore_facsimile">
            <img id="img_pagina10" src="pagina_10.png" usemap="#pag10_map" />
        </div>
        <map name="pag10_map" id="pag10_map">
            <xsl:apply-templates select="tei:zone" />
        </map>

    </xsl:template>

    <xsl:template match="tei:surface[@n='2']">

        <div id="facsimile_pag11" class="contenitore_facsimile">
            <img id="img_pagina11" src="pagina_11.png" usemap="#pag11_map" />
        </div>
        <map name="pag11_map" id="pag11_map">
            <xsl:apply-templates select="tei:zone" />
        </map>

    </xsl:template>

    <!-- estrazione delle zone -->
    <xsl:template match="//tei:zone">

        <xsl:element name="area">
            <xsl:attribute name="shape">rect</xsl:attribute>
            <xsl:attribute name="coords"><xsl:value-of select="./@ulx" />,<xsl:value-of select="./@uly" />,<xsl:value-of select="./@lrx" />,<xsl:value-of select="./@lry" /></xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="./@xml:id" /></xsl:attribute>
        </xsl:element>

    </xsl:template>

    <!-- zona titoli -->
    <xsl:template match="tei:titleStmt">

        <h1 class="titolo1">
            <xsl:value-of select="./tei:title[@type='main']" />
        </h1>

        <h2 class="titolo2">
            <xsl:value-of select="./tei:title[@type='sub']" /> di <xsl:value-of select="./tei:author"/>
        </h2>

        <h3 class="titolo3">
            <xsl:value-of select="./tei:respStmt/tei:resp" />&#160;<xsl:value-of select="./tei:respStmt/tei:name" />
        </h3>

        <div class="tei_publicationStmt">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="../tei:publicationStmt/tei:publisher/@ref" />
                </xsl:attribute>
                &#160;
                <xsl:value-of select="../tei:publicationStmt/tei:publisher " />
            </xsl:element>
        </div>

    </xsl:template>

    <!-- zona manoscritto -->
    <xsl:template match="tei:sourceDesc">
        <div class="tei_sourceDesc">
            Codice del manoscritto e luogo di deposito:
            <xsl:value-of select="./tei:msDesc/tei:msIdentifier/tei:settlement"/>
            <xsl:value-of select="./tei:msDesc/tei:msIdentifier/tei:idno"/>&#160;<xsl:value-of select="./tei:msDesc/tei:msIdentifier/tei:repository"/>
        </div>

    </xsl:template>

    <xsl:template match="tei:msContents">

        <div class="tei_msContents">
            Dall'opera originaria di
            <xsl:value-of select="./tei:msItem/tei:author/tei:persName"/>:
            &#34;<xsl:value-of select="./tei:msItem/tei:title"/>&#34;     <!-- &#34; sono le virgolette -->
            in lingua <xsl:value-of select="./tei:msItem/tei:textLang"/>.
        </div>
    </xsl:template>

    <xsl:template match="tei:physDesc">
        <div class="tei_physDesc">
            Condizioni del manoscritto:
            <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:support"/>
            <xsl:value-of select="./tei:objectDesc/tei:supportDesc/tei:condition"/>
            <xsl:value-of select="./tei:objectDesc/tei:layoutDesc/tei:layout/tei:p"/>
            <xsl:value-of select="./tei:handDesc"/>&#160;<xsl:value-of select="./tei:typeDesc/tei:p"/>
            <xsl:value-of select="../tei:history/tei:origin/tei:p"/>
            <xsl:value-of select="../tei:acquisition/tei:p"/>
        </div>
    </xsl:template>


    <xsl:template match="tei:listPerson">
        <div class="tei_listPerson">
            <xsl:value-of select="./tei:person/tei:persName"/>
            <xsl:value-of select="./tei:person/tei:birth"/>
            <xsl:value-of select="./tei:person/tei:death"/>

        </div>
    </xsl:template>

    <!-- zona edition con footer  -->
    <xsl:template match="tei:editionStmt">
        <footer class="footer">
            <xsl:value-of select="./tei:edition" />
            <xsl:value-of select="./tei:respStmt/tei:resp" />&#160;<xsl:value-of select="./tei:respStmt/tei:name[@xml:id='ED']" /> e
            <xsl:value-of select="./tei:respStmt/tei:name[@xml:id='FB']" />
        </footer>
    </xsl:template>

    <xsl:template match="tei:div[@type='trascrizione']">
        <div id="trascrizione">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="tei:div[@type='traduzione']">
        <div id="traduzione">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="tei:ab">
        <xsl:element name="p">
            <xsl:attribute name="n">
                <xsl:value-of select="./@n" />
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- va distinto il caso con facs da quello senza -->
    <xsl:template match="tei:add">
        <xsl:choose>
            <xsl:when test="./@facs">
                <xsl:element name="span">
                    <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
                    <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
                    <xsl:attribute name="class">tei_add</xsl:attribute>
                    <xsl:apply-templates />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <span class="tei_add">
                    <xsl:apply-templates />
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:del">
        <xsl:choose>
            <xsl:when test="./@facs">
                <xsl:if test=".[@rend='overwrite']">
                    <xsl:element name="span">
                        <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
                        <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
                        <xsl:attribute name="class">tei_del_overwrite</xsl:attribute>
                        <xsl:apply-templates />
                    </xsl:element>
                </xsl:if>
                <xsl:if test=".[@rend!='overwrite']">
                    <xsl:element name="span">
                        <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
                        <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
                        <xsl:attribute name="class">tei_del</xsl:attribute>
                        <xsl:apply-templates />
                    </xsl:element>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test=".[@rend='overwrite']">
                    <span class="tei_del_overwrite">
                        <xsl:value-of select="." />
                    </span>
                </xsl:if>
                <xsl:if test=".[@rend!='overwrite']">
                    <span class="tei_del">
                        <xsl:value-of select="." />
                    </span>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:orig">
        <span class="tei_orig">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <xsl:template match="tei:reg">
        <span class="tei_reg">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <xsl:template match="tei:abbr">
        <span class="tei_abbr">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <!-- va distinto il caso con facs da quello senza -->
    <xsl:template match="tei:expan">
        <xsl:choose>
            <xsl:when test="./@facs">
                <xsl:element name="span">
                    <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
                    <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
                    <xsl:attribute name="class">tei_expan</xsl:attribute>
                    <xsl:apply-templates />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <span class="tei_expan">
                    <xsl:apply-templates />
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:subst[@facs]">
        <xsl:element name="span">
            <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
            <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:unclear[@facs]">
        <xsl:element name="span">
            <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
            <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
            <xsl:attribute name="class">tei_unclear</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:choice[@facs]">
        <xsl:element name="span">
            <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
            <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:damage[@facs]">
        <xsl:element name="span">
            <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
            <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
            <xsl:attribute name="class">tei_damage</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:gap[@facs]">
        <xsl:element name="span">
            <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
            <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:lb">
        <br />
    </xsl:template>

    <xsl:template match="tei:pc">
        <!-- va distinto il caso con facs da quello senza -->
        <xsl:if test=".[text() = '-']">
            <xsl:choose>
                <xsl:when test="./@facs">
                    <xsl:element name="span">
                        <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
                        <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
                        <xsl:attribute name="class">tei_pc</xsl:attribute>
                        <xsl:apply-templates />
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <span class="tei_pc">
                        <xsl:apply-templates />
                    </span>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        <!-- va distinto il caso con facs da quello senza -->
        <xsl:if test=".[text() = '=']">
            <xsl:choose>
                <xsl:when test="./@facs">
                    <xsl:element name="span">
                        <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
                        <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
                        <xsl:attribute name="class">tei_pc_fds</xsl:attribute>
                        <xsl:apply-templates />
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <span class="tei_pc_fds">
                        <xsl:apply-templates />
                    </span>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <!-- va distinto il caso con facs da quello senza -->
    <xsl:template match="tei:hi[@rend='double underline']">
        <xsl:choose>
            <xsl:when test="./@facs">
                <xsl:element name="span">
                    <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
                    <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
                    <xsl:attribute name="class">tei_hi_double_underline</xsl:attribute>
                    <xsl:apply-templates />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <span class="tei_hi_double_underline">
                    <xsl:apply-templates />
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- va distinto il caso con facs da quello senza -->
    <xsl:template match="tei:hi[@rend='italic']">
        <xsl:choose>
            <xsl:when test="./@facs">
                <xsl:element name="span">
                    <xsl:attribute name="id">trascr_facs_<xsl:value-of select="./@facs" /></xsl:attribute>
                    <xsl:attribute name="n_traduzione"><xsl:value-of select="./@n" /></xsl:attribute>
                    <xsl:attribute name="class">tei_hi_italic</xsl:attribute>
                    <xsl:apply-templates />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <span class="tei_hi_italic">
                    <xsl:apply-templates />
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:name[@type='Antroponimo']">
        <span class="tei_antroponimo">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <xsl:template match="tei:term">
        <span class="tei_term">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <xsl:template match="tei:orgName[@type='institution']">
        <span class="tei_istituzione">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <xsl:template match="tei:sic">
        <span class="tei_sic">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <xsl:template match="tei:am">
        <span class="tei_am">
            <xsl:apply-templates />
        </span>
    </xsl:template>



    <xsl:template match="tei:list">
    <table class="tabella_entita">
        <xsl:apply-templates />
    </table>
    </xsl:template>

    <xsl:template match="tei:label">
    <tr class="titolo_entita">
        <td>fr: <xsl:value-of select="./tei:term[@xml:lang = 'fr']"/></td>
        <td>it: <xsl:value-of select="./tei:term[@xml:lang = 'it']"/></td>
    </tr>
    </xsl:template>

    <xsl:template match="tei:item">
    <tr class="descr_entita">
        <td colspan="2"><xsl:value-of select="./tei:gloss"/></td>
    </tr>
    </xsl:template>



    <xsl:template match="tei:listOrg">
    <table class="tabella_entita">
        <xsl:apply-templates />
    </table>
    </xsl:template>

    <xsl:template match="tei:name">
    <tr class="titolo_entita">
        <td><xsl:value-of select="."/></td>
    </tr>
    </xsl:template>

    <xsl:template match="tei:note">
    <tr class="descr_entita">
        <td><xsl:value-of select="."/></td>
    </tr>
    </xsl:template>



    <xsl:template match="tei:back/tei:listPerson">
    <table class="tabella_entita">
        <xsl:apply-templates select=".//tei:person"/>
    </table>
    </xsl:template>

    <xsl:template match="tei:back/tei:listPerson/tei:person">
    <tr class="titolo_entita">
        <td><xsl:value-of select="./tei:ab/tei:persName"/></td>
    </tr>
    <tr class="descr_entita">
        <td><xsl:value-of select="./tei:p"/></td>
    </tr>
    </xsl:template>

</xsl:stylesheet>
