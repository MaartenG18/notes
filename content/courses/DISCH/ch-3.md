+++
title= "3. Geheugens"
weight= 3
+++

## Table of contents

1. [RAM-geheugens](#ram-geheugens)
2. [ROM-geheugens](#rom-geheugens)

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

### Opbouw van een SRAM-cel

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

### SRAM-geheugenstructuur

![](/img/DISCH/ch-3/SRAM-geheugenstructuur.PNG)

## ROM-geheugens


