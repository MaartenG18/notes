+++
title= "3. Geheugens"
weight= 3
+++

## Table of contents

1. [RAM-geheugens](#ram-geheugens)
2. [ROM-geheugens](#rom-geheugens)
2. [Geheugenuitbreiding](#geheugenuitbreiding)

## RAM-geheugens

### Situering RAM

![](/img/DISCH/ch-3/RAM-situering.PNG)

### Indeling RAM

- **SRAM (Statische RAM)**
	+ Eigenschappen:
		* Snel toegangelijk
		* Veel oppervlakte
	+ Gebruiksgebied:
		* Cachegeheugen
- **DRAM (Dynamische RAM)**
	+ Eigenschappen:
		* Hoge densiteit
		* Relatief trage uitlezing
	+ Gebruiksgebied:
		* Hoofdgeheugen
		* Massageheugen
		
### SRAM

#### Opbouw van een SRAM-cel

- **Het basis geheugenelement is een lus van invertoren.**

![](/img/DISCH/ch-3/SRAM-basis.PNG)
	
- Deze **lus moet onderbroken worden om te schrijven** (8 transistors nodig).

![](/img/DISCH/ch-3/SRAM-onderbroken.PNG)

- We kunnen deze **onderbreking weglaten als de transistors die schrijven meer stroom leveren dan de transistores in de geheugencel**. Dit geeft een stroompad tussen voeding en grond, wat zorgt voor een belangrijke opwarming.
- Gebruik ban **transistors met minimale dimensies**
- **nMOS heeft een betere geleidbaarheid da pMOS**

![](/img/DISCH/ch-3/SRAM-niet-onderbroken.PNG)

- **Dubbel gebruik**
	+ Schrijven
		* Beide lijnen sturen
		* 1 lijn trekt stroom
	+ Uitlezen
	
![](/img/DISCH/ch-3/SRAM-finaal.PNG)

#### SRAM-geheugenstructuur

![](/img/DISCH/ch-3/SRAM-geheugenstructuur.PNG)

#### SRAM adresdecoder

- Om een **woordlijn te selecteren**, gaan we:
	+ Niet alle woordlijnen extern doorgeven
	+ Wel het nummer van de woordlijn
- Bv.:
	+ 64 woordlijnen
	+ Adres is een 6-bit getal
	+ 6 adreslijnen nodig
- De **omzetting van het adres naar de overeenstemmende woordlijnen gebeurt in de adresdecoder**, hoe meer bits het adres bevat:
	+ Hoe groter de decoder
	+ Hoe trager de decoder
		
![](/img/DISCH/ch-3/SRAM-adresdecoder.PNG)

#### SRAM-organisatie

In- en uitgangen:

- **CS** = Chip Select (actief laag)
- **WE** = Write Enable (actief laag)
- **10 adreslijnen**
- **4 bi-directionele datalijnen**

![](/img/DISCH/ch-3/SRAM-organisatie.PNG)

#### SRAM-timing

Vereenvoudigde read timing:

![](/img/DISCH/ch-3/SRAM-read-timing.PNG)

Vereenvoudigde write timing:

![](/img/DISCH/ch-3/SRAM-write-timing.PNG)

#### Battery back-up

**RAM is per definite vluchtig**

- Zodra de spanning wegvalt, gaat de inhoud van het geheugen verloren.
- Batterij kan ervoor zorgen dat de inhoud toch niet verloren gaat.
	+ De batterij kan zelfs ingebouwd worden in de IC-behuizing.

## ROM-geheugens

### Opbouw van een DRAM-cel

- **Geheugenelement = 1 tranistor (+ capiciteit)**
	+ Lezen: laad bitlijn vooraf op tot vaste spanning, stuur woordlijn, meet bitlijn
	+ Schrijven: stuur bitlijn, stuur woordlijn
- **Read-out is destructief**
- **Refresh cyclus** nodig, want opslag verdwijnt op minder dan een ms.
	+ Een intern circuit leest het woord en schrijft het terug.
	
### Situering ROM

![](/img/DISCH/ch-3/ROM-situering.PNG)

### Masker ROM met diodes

- Er worden overal diodes geplaatst
- Het masker bepaalt welke diodes verbonden worden

![](/img/DISCH/ch-3/ROM-masker-diodes.PNG)

Dit is veruit de meest eenvoudige wijze om een masker ROM te maken. Alle data lijnen zijn via een weerstand met de voeding verbonden en de uitgangen van de decoder zijn in rust ook verbonden met de voedingsspanning. Het zijn actief lage signalen, zoals aangegeven door het driehoekje aan de uitgang. Over de diodes staat geen spanning en er loopt ook geen stroom. Wanneer er een adres aangelegd wordt aan de ingang van de decoder, zal de overeenkomstige woordlijn laag worden (0V). Als gevolg hiervan gaan de diodes die met deze woordlijn verbonden zijn geleiden, waarbij de stroom niet bepaald wordt door de diode maar door de weerstand die ermee in serie staat. Aan de uitgangen (D3…D0) hebben we dus typisch 0,7V of VCC, afhankelijk van het feit of er al dan niet een diode aanwezig is. Deze 0,7V ligt onder de drempelspanning van het hierop volgende circuit zodat ze als een digitale 0 herkend wordt. De diodes staan dus op de plaatsen waar er een 0 aanwezig moet zijn in het geheugen. Dit schema geeft een zeer compact ROM geheugen. 

Het is belangrijk op te merken dat er een DC stroom vloeit tussen de voedingsspanning en de uitgangen van de decoder, waardoor de decoder zwaar belast wordt. Een ROM geheugen dat op deze manier geïmplementeerd is, zal dus veel vermogen verbruiken.

### Masker ROM met transistors

- Een masker ROM kan ook met transistors worden uitgevoerd
- De decoder wordt hierdoor niet belast.

![](/img/DISCH/ch-3/ROM-masker-transistor.PNG)

We kunnen in de voorgaande schakeling de diodes vervangen door transistors. Hierdoor moet de decoder niet meer die belangrijke stroom leveren. De stroom van de decoder is beperkt tot de laadstroom van de gate capaciteiten van de transistors. Er blijft nog steeds een DC-stroom lopen, maar deze loopt van de voeding naar de grond via de transistors.

Merk op dat de uitgang van de decoder in deze schakeling actief hoog is.

### Masker ROM met precharge

- De precharge zorgt ervoor dat er geen DC-stroom door de bitlijnen loopt.
- De bitlijnen worden telkens geprecharged vooraleer de decoder wordt uitgelezen.

![](/img/DISCH/ch-3/ROM-masker-precharge.PNG)

### PROM

- **PROM = Programmable ROM**
- Het geheugen kan geprogrammeerd worden door bepaalde fuses/antifuses op te blazen.
- Er is geen specifiek masker nodig bij de productie.
- Programmeren gebeurt door hoge spanningspulsen aan te leggen (hogere spanning bij normale werking).

![](/img/DISCH/ch-3/PROM.PNG)

### EPROM FAMOS technologie

- **Erasable Programmable ROM**
- **FAMOS = FLoating gate Avalanche injection MOS transistor**
- **UV-wisbaar**

![](/img/DISCH/ch-3/EPROM-FAMOS.PNG)

Een FAMOS transistor is uitgevoerd met een dubbele gate. De bovenste gate is verbonden met de woordlijn. De onderste gate is echter met niets verbonden en is dus zwevend. In normale omstandigheden is er geen lading aanwezig op de onderste gate. Wanneer er echter, door het aanleggen van een hogere voedingsspanning aan de gate, langdurig een zeer grote stroom tussen source en drain getrokken wordt, gaan er elektronen zijn die door botsingen een voldoende grote energie bekomen om in staat te zijn over het oxide heen te vliegen (lawine-effect). In dit geval wordt de zwevende gate opgeladen met elektronen.

Tijdens de normale werking van deze nMOS transistor in FAMOS technologie leggen we een positieve spanning aan aan de bovenste gate. Dit zorgt voor een positieve lading op de bovenste gate en een kanaal van elektronen onder de gates waardoor de transistor geleidt. Wanneer de zwevende gate echter is opgeladen met elektronen zal de positieve lading op de bovenste gate gecompenseerd worden door de elektronenlading op de zwevende gate en bekomen we geen elektronen meer in het kanaal tussen source en drain. De transistor zal dus niet geleiden.

De lading van de zwevende gate kan verdwijnen als de ladingsdragers voldoende energie krijgen. Dit kan m.b.v. UV-licht.

### EPROM

Het programmeren van het geheugen gebeurt in een speciale EPROM-programmer. Het wissen gebeurt a.d.h.v. UV-licht.

![](/img/DISCH/ch-3/EPROM.PNG)

In een EPROM geheugen is er een FAMOS transistor aanwezig op elke positie. Door het aanleggen van een hogere voedingsspanning kan er gekozen worden welke transistors niet mogen geleiden. Het hele geheugen kan gewist worden m.b.v. UV-licht. Het is niet mogelijk om enkel specifieke geheugenplaatsen te wissen.

### FLOTOX EEPROM technologie

- **EEPROM = Electrically Erasable Programmable ROM**
- **FLOTOX = Floating gate Tunnel Oxide**
- Er wordt gebruik gemaakt van een dun oxide.
- Op die manier is er geen UV-licht nodig om te wissen, het wissen gebeurt elektrisch (in-circuit programming).

![](/img/DISCH/ch-3/EEPROM.PNG)

Een EEPROM maakt gebruik van het doortunneleffect om een zwevende gate op te laden. Er is een dun oxide voorzien boven de drain van de transistor. De elektronen gaan doortunnelen naar de zwevende gate wanneer er een voldoende hoge spanning wordt aangelegd aan de bovenste gate.

Een belangrijk voordeel van het opladen van de zwevende gate door doortunnelen, is dat dit principe ook omkeerbaar is, zodat een EEPROM elektrisch kan gewist worden. Het wissen gebeurt door een spanning aan te leggen tussen drain en source zonder de bovenste gate op te laden. De elektronen tunnelen dan terug door het dunne oxide. Het gevolg hiervan is wel dat tijdens het gebruik van het geheugen de bovenste gate steeds moet verbonden zijn met de voedingsspanning om ervoor te zorgen dat de elektronen niet terug doortunnelen naar de drain. De woordlijntransistor en de programmeertransistor kunnen dus niet meer dezelfde zijn. Daarom hebben we voor een EEPROM geheugen een tweede transistor nodig per geheugenelement.

### FLASH geheugen

- Vergelijkbaar met EEPROM
- Veel sneller en compacter dan EEPROM, omdat het wissen en herprogrammeren in grote blokken gebeurt.

### Niet-vluchtig RAM

- Combinatie van
	+ SRAM (snel)
	+ EEPROM (traag)
- Onder normale werking: SRAM
- Een "store"-bevel slaat alles op in de EEPROM
- Een "recall"-bevel haalt alles uit de EEPROM
- Wanneer de voedingsspanning wegvalt, kan een "power failure" schakelingen dit selecteren en tijdig een "store"-bevel geven.

## Geheugenuitbreiding

Het principe van geheugenuitbreiding is van toepassing op zowel ROM- als RAM-geheugens

- Uitbreiding van de woordbreedte:
	+ Het aantal bereikbare adressen blijft gelijk
	+ Het aantal bits per adres wordt uitgebreid
- Uitbreiding van het adresbereik:
	+ Het aantal bits per adres blijven gelijk
	+ Het aantal bereikbare adressen worden uitgebreid
	
### Uitbreiding van de woordbreedte (voorbeeld)

- We vertrekken van twee ROM IC's met een adres van 10 bits (dus een adresbereik van 2<sup>10</sup> adressen) en een woordbreedte van 4 bits.
- Beide IC's krijgen hetzelfde adres.
- Beide IC's produceren 4 bits van de data.
- In totaal zijn er 8 databits beschikbaar.

### Uitbreiding van het adresbereik (voorbeeld)

- We vertrekken van dezelfde 2 IC's.
- Beide IC's krijgen de 10 minst beduidende adreslijnen.
- De 11de adreslijn wordt gebruikt voor de "chip select".
- De 4 data bits komen van 1 van de 2 chips.

### Geheugenmodules

- Per module staan een aantal IC's georganiseerd volgens het principe van het uitbreiden van de woordbreedte.
- Indien de woordbreedte van de module kleiner is dan de breedte van de databus, moeten meerdere modules gelijktijdig gebruikt worden zodat de woordbreedte kan worden uitgebreid tot de breedte van een databus. Deze combinatie noemen we een geheugenbank.
- Meerdere geheugenbanken kunnen gecombineerd worden voor het uitbreiden van het adresbereik.
- Moderne geheugenmodules hebben een woordbreedte die overeenstemt met de breedt van de databus.

{{% task %}}

Startende van geheugenblokken met een woordbreedte van 64 bits en een diepte van 128 woorden:

1. Teken het schema van een geheugen met een woordbreedte van 256 bits en een diepte van 128 woorden.
2. Teken het schema van een geheugen met een woordbreedte van 64 bits en een diepte van 256 woorden.
3. Teken het schema van een geheugen met een woordbreedte van 256 bits en een diepte van 512 woorden.


{{% /task %}}