//si ottengono i riferimenti ai bottoni per poter agganciare eventi onclick
var bottone_pag10 = document.getElementById("bottone_pag10");
var bottone_pag11 = document.getElementById("bottone_pag11");
var bottone_terminologia = document.getElementById("bottone_terminologia");
var bottone_varianti = document.getElementById("bottone_varianti");

//variabile che mantiene lo stato attuale della pagina visualizzata
var paginaVisualizzata = 10;

//aggancio eventi dei bottoni di cambio pagina
bottone_pag10.onclick = function()
{
    visualizzaPagina(10);
    paginaVisualizzata = 10;

    //si aggiorna la dimensione del testo della trascrizione
    aggiornaDimTestoTrascrizione();
}

bottone_pag11.onclick = function()
{
    visualizzaPagina(11);
    paginaVisualizzata = 11;

    //si aggiorna la dimensione del testo della trascrizione
    aggiornaDimTestoTrascrizione();
}

//variabile che mantiene lo stato attuale della modalita "visualizza varianti"
var visualizzaVarianti = false;

//aggancio eventi click su visualizza varianti
bottone_varianti.onclick = function()
{
    visualizzaVarianti = !visualizzaVarianti;

    if(visualizzaVarianti == true)
    {
        document.documentElement.style.setProperty("--visualizza-varianti", "visible");
        document.documentElement.style.setProperty("--colore-add", "green");
        document.documentElement.style.setProperty("--colore-expan", "darkolivegreen");
        document.documentElement.style.setProperty("--colore-unclear", "orange");
        document.documentElement.style.setProperty("--colore-pc", "rgb(31, 16, 245)");
        document.documentElement.style.setProperty("--background-damage", "greenyellow");
    }
    else
    {
        document.documentElement.style.setProperty("--visualizza-varianti", "none");
        document.documentElement.style.setProperty("--colore-add", "brown");
        document.documentElement.style.setProperty("--colore-expan", "brown");
        document.documentElement.style.setProperty("--colore-unclear", "transparent");
        document.documentElement.style.setProperty("--colore-pc", "brown");
        document.documentElement.style.setProperty("--background-damage", "transparent");
    }

    //in ogni caso si aggiorna la dimensione del testo della trascrizione
    aggiornaDimTestoTrascrizione();
}

//funzione per aggiornare la dimensione del font della trascrizione a seconda 
//della modalità (pagina 10/11 e visualizzazione varianti)
function aggiornaDimTestoTrascrizione()
{
    // dimensioni testo della trascrizione:
    // - pagina 10 senza varianti = 1.45em - default
    // - pagina 10 con varianti = 1.3em
    // - pagina 11 senza varianti = 1.11em
    // - pagina 11 con varianti = 1em

    var dimensioneTesto = "1.2em";

    if(paginaVisualizzata == 10)
    {
        if(visualizzaVarianti == false)
        {
            dimensioneTesto = "1.2em"; //pagina 10 senza varianti
        }
        else
        {
            dimensioneTesto = "1.15em"; //pagina 10 con varianti
        }
    }
    else //pagina 11
    {
        if(visualizzaVarianti == false)
        {
            dimensioneTesto = "1.11em"; // pagina 11 senza varianti
        }
        else
        {
            dimensioneTesto = "1em"; // paigna 11 con varianti     
        } 
    }

    //aggiorno variabile css
    document.documentElement.style.setProperty("--dim-testo-trascrizione", dimensioneTesto);
}

//variabile che mantiene lo stato attuale della modalita "visualizza terminologie"
var visualizzaTerminologie = false;

//aggancio eventi click su visualizza terminologie
bottone_terminologia.onclick = function()
{
    visualizzaTerminologie = !visualizzaTerminologie;

    if(visualizzaTerminologie == true)
    {
        document.documentElement.style.setProperty("--colore-antroponimo", "rgb(255, 0, 221)");
        document.documentElement.style.setProperty("--colore-termine", "rgb(122, 36, 122)");
        document.documentElement.style.setProperty("--colore-termine-background", "rgb(255, 230, 0)");
        document.documentElement.style.setProperty("--colore-istituzione", "rgb(222, 113, 255)");
    }
    else
    {
        document.documentElement.style.setProperty("--colore-antroponimo", "transparent");
        document.documentElement.style.setProperty("--colore-termine", "brown");
        document.documentElement.style.setProperty("--colore-termine-background", "transparent");
        document.documentElement.style.setProperty("--colore-istituzione", "transparent");
    }
}

//funzione cambio pagina
function visualizzaPagina(pagina)
{
    var pag10 = document.getElementById("sez_img_pag10");
    var pag11 = document.getElementById("sez_img_pag11");

    if(pagina == 10)
    {
        
        pag10.style.display = "";
        pag11.style.display = "none";

        var elementiP = document.getElementsByTagName("p");

        for(var indice = 0; indice < elementiP.length; indice++)
        {
            var p = elementiP[indice];

            //si ottiene l'attributo n del paragrafo (convertito in valore intero)
            var n = parseInt(p.getAttribute("n"));

            if(n >= 1 && n <= 4 ) p.style.display = "";
            else if(n >= 20 && n <= 23 ) p.style.display = "";
            else p.style.display = "none";
        }
    }
    else if(pagina == 11)
    {
        pag10.style.display = "none";
        pag11.style.display = "";

        var elementiP = document.getElementsByTagName("p");

        for(var indice = 0; indice < elementiP.length; indice++)
        {
            var p = elementiP[indice];

            //si ottiene l'attributo n del paragrafo (convertito in valore intero)
            var n = parseInt(p.getAttribute("n"));

            if(n >= 1 && n <= 4 ) p.style.display = "none";
            else if(n >= 20 && n <= 23 ) p.style.display = "none";
            else p.style.display = "";
        }
    }
}

//di default visualizza pagina 10
visualizzaPagina(10);

//funzione per aggiornare la visualizzazione degli elementi traduzione quando selezionati
function aggiornaElementiTraduzione(nTraduzione)
{
    //si accende il relativo elemento sulla traduzione
    var elementiTraduzione = document.getElementById("traduzione").children;
    for(var indice = 0; indice < elementiTraduzione.length; indice++)
    {
        var elementoTraduzione = elementiTraduzione[indice];
        if(elementoTraduzione.getAttribute("n") == nTraduzione)
        {
            elementoTraduzione.style.color = "white";
        }
        else
        {
            elementoTraduzione.style.color = "black";
        }
    }
}

//funzione per resettare la visualizzazione degli elementi traduzione quando deselezionati
function resettaElementiTraduzione()
{
    var elementiTraduzione = document.getElementById("traduzione").children;
    for(var indice = 0; indice < elementiTraduzione.length; indice++)
    {
        var elementoTraduzione = elementiTraduzione[indice];
        elementoTraduzione.style.color = "black";
    }
}

//funzione che crea i rettangoli da visualizzare 
//in sovra-impressione all'immagine facsimile,
//in modo da rendere visibili le zone
function creaRettangoliFacsimile(idMappa, idContenitoreRettangoli, idImmagine)
{
    //si ottiene il <map> che ha id = idMappa
    var mappa = document.getElementById(idMappa);

    //si ottiene l'immagine, per estrarne la dimensione in pixel 
    //dell'immagine originale (attributi naturalWidth e naturalHeight)
    //serve per calcolare le dimensioni dei rettangoli in percentuale (dopo)
    var img = document.getElementById(idImmagine);
    var imgWidth = img.naturalWidth;
    var imgHeight = img.naturalHeight;


    //si ottengono gli oggetti <area> della <map> (nel nostro caso sono tutti i suoi figli, non ci sono figli di altro tipo)
    var aree = mappa.children;

    //si ottiene il contenitore (un <div>) che ospiterà i rettangoli (per rendere visibili le zone del facsimile)
    var contenitoreRettangoli = document.getElementById(idContenitoreRettangoli);
    
    //per ogni area
    for (var indice = 0; indice < aree.length; indice++) 
    {
        //si ottiene l'area
        var area = aree[indice];

        //si ottiene il valore dell'attributo coords, una stringa di 4 numeri interi separati da virgole
        //nel formato : "ulx,uly,lrx,lry"
        var coordinate = area.getAttribute("coords");
        
        //si separano i 4 valori (separatore la virgola) e si convertono in numeri interi
        var coordinateSep = coordinate.split(",");
        var ulx = parseInt(coordinateSep[0]);
        var uly = parseInt(coordinateSep[1]);
        var lrx = parseInt(coordinateSep[2]);
        var lry = parseInt(coordinateSep[3]);

        //si ottengono i valori da inserire in left, top, width, height nello stile del rettangolo
        //left e top sono rispettivamente ulx, e uly
        //width è lrx - ulx, mentre e height è lry - uly
        var left = ulx;
        var top = uly;
        var width = lrx - ulx;
        var height = lry - uly;

        //si crea un rettangolo e vi si applica lo stile di base e si setta un id univoco relativo all'area
        var rettangolo = document.createElement("div");
        rettangolo.className = "rettangolo_zona";
        rettangolo.id = "rettangolo_" + area.id;

        //si applica lo stile (posizione e dimensione), espresso in percentuale
        //per adattarsi allo stile del div contenitore
        rettangolo.style.left = (left / imgWidth * 100) + "%";
        rettangolo.style.top = (top / imgHeight * 100) + "%";
        rettangolo.style.width = (width / imgWidth * 100) + "%";
        rettangolo.style.height = (height / imgHeight * 100) + "%";
        
        //e si rende visibile ma non selezionato.
        rettangolo.style.opacity = 0.25;

        //si inserisce il rettangolo nel contenitore
        contenitoreRettangoli.appendChild(rettangolo);

        //si collegano gli eventi di passaggio del mouse alle aree della map
        rettangolo.onmouseenter = function(evento) 
        {
            console.log("onmouseenter", evento);

            //si ottiene il rettangolo
            var rettangolo = evento.target;

            //si rende selezionato il rettangolo relativo all'area della mappa su cui è il mouse 
            rettangolo.style.opacity = 1;

            //si accende il relativo elemento sulla trascrizione
            //prima si deve creare l'id a partire da quello del rettangolo
            var id = rettangolo.id.split("rettangolo_")[1];
            var elementoTrascrizione = document.getElementById("trascr_facs_#" + id);
            console.log(elementoTrascrizione);
            if(elementoTrascrizione != null)
            {
                elementoTrascrizione.classList.add("facs_selezionato");
            }

            //si accende il relativo elemento sulla traduzione
            var nTraduzione = elementoTrascrizione.getAttribute("n_traduzione");
            aggiornaElementiTraduzione(nTraduzione);
        }

        rettangolo.onmouseleave = function(evento) {

            console.log("onmouseleave", evento);

        ///si ottiene il rettangolo
        var rettangolo = evento.target;

        //si rende visibile il rettangolo relativo all'area della mappa su cui è il mouse 
        rettangolo.style.opacity = 0.25;

        //si spegne il relativo elemento sulla trascrizione
        //prima si deve creare l'id a partire da quello del rettangolo
        var id = rettangolo.id.split("rettangolo_")[1];
        var elementoTrascrizione = document.getElementById("trascr_facs_#" + id);
        if(elementoTrascrizione != null)
        {
            elementoTrascrizione.classList.remove("facs_selezionato");
        }

        //si spegne il relativo elemento sulla traduzione
        resettaElementiTraduzione();

        }

    }
}

//creazione rettangoli
creaRettangoliFacsimile("pag10_map", "facsimile_pag10", "img_pagina10");
creaRettangoliFacsimile("pag11_map", "facsimile_pag11", "img_pagina11");

//preparazione eventi passaggio del mouse sugli elementi della trascrizione 
//collegati al facsimile:

//si ottengono tutti gli elementi (span)
var elementiSpan = document.getElementsByTagName("span");
for(var indice = 0; indice < elementiSpan.length; indice++)
{
    var el = elementiSpan[indice];

    //tra questi, per i soli elementi relativi a un rettangolo nel facsimile
    //cioè che hanno id che inizia con "trascr_facs_"
    if(el.id.startsWith("trascr_facs_"))
    {
        console.log(el);

        //si collegano gli eventi per gestire il passaggio del mouse
        el.onmouseenter = function(evento) {
    
            //si ottiene l'elemento della trascrizione dall'evento
            var elementoTrascrizione = evento.target;

            elementoTrascrizione.classList.add("facs_selezionato");
    
            var idZona = elementoTrascrizione.id.split("#")[1];

            //si ottiene il rettangolo
            var idRettangolo = "rettangolo_" + idZona
            var rettangolo = document.getElementById(idRettangolo);
    
            //si rende visibile il rettangolo relativo all'area della mappa su cui è il mouse 
            rettangolo.style.opacity = 1;

            //si accende il relativo elemento sulla traduzione
            var nTraduzione = elementoTrascrizione.getAttribute("n_traduzione");
            aggiornaElementiTraduzione(nTraduzione);
    
        };

        el.onmouseleave = function(evento) {
    
            //si ottiene l'elemento della trascrizione dall'evento
            var elementoTrascrizione = evento.target;

            elementoTrascrizione.classList.remove("facs_selezionato");
    
            var idZona = elementoTrascrizione.id.split("#")[1];
            //si ottiene il rettangolo
            var idRettangolo = "rettangolo_" + idZona
            var rettangolo = document.getElementById(idRettangolo);
    
            //si rende visibile il rettangolo relativo all'area della mappa su cui è il mouse 
            rettangolo.style.opacity = 0.25;

            //si spegne il relativo elemento sulla traduzione
            resettaElementiTraduzione();
    
        }
    }
}

//aggancio degli eventi di scroll all'elemento traduzione,
//è necessario per far apparire la traduzione scorrendo la pagina web in basso
var elemTraduzione = document.getElementById("traduzione");
window.addEventListener("scroll", function() 
{
    var y = window.scrollY;
    console.log(y)
    if (y >= 400) {
        elemTraduzione.style.display = "";
    } else {
        elemTraduzione.style.display = "none";
    }
});

//all'inizio la traduzione è impostata come invisibile
elemTraduzione.style.display = "none";

//collegamento eventi per aprire il popup della legenda
var bottoneApriLegenda = document.getElementById("bottone_legenda");
var popupLegenda = document.getElementById("popup_legenda");
var bottoneChiudiLegenda = document.getElementById("chiudi_legenda");

popupLegenda.style.display = "none";

bottoneApriLegenda.onclick = function () {
    popupLegenda.style.display = "";
}

popupLegenda.onclick = function () {
    popupLegenda.style.display = "none";
}

bottoneChiudiLegenda.onclick = function () {
    popupLegenda.style.display = "none";
}

//collegamento eventi per aprire il popup delle entità nominate
var bottoneApriEntita = document.getElementById("bottone_entita");
var popupEntita = document.getElementById("popup_entita");
var bottoneChiudiEntita = document.getElementById("chiudi_entita");

popupEntita.style.display = "none";

bottoneApriEntita.onclick = function () {
    popupEntita.style.display = "";
}

popupEntita.onclick = function () {
    popupEntita.style.display = "none";
}

bottoneChiudiEntita.onclick = function () {
    popupEntita.style.display = "none";
}