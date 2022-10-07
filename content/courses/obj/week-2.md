+++
title= "1. week 2"
weight= 3
+++

## Opdrachten Hoofdstuk 1-4

### 1.2.1

:heavy_check_mark:

### 1.2.2

:heavy_check_mark:

### 1.2.3

:heavy_check_mark:

### 1.2.4

:heavy_check_mark:

### 1.2.5

{{% task %}}
Welke voordelen biedt een klasse als Date ten opzichte van een datum steeds voor te stellen als drie aparte getallen? Zo is het vaak beter om bijvoorbeeld een positie of grootte niet steeds voor te stellen door twee getallen, maar door (heel eenvoudige) klassen of structures. Op die manier wordt code tevens duidelijker. Vergelijk de method `drawRect(int, int, int, int)` maar met `drawRect(Point, Point)` of `drawRect(Point, Size)`.

<br>

De verleiding is soms ook groot om allerlei gegevens op te slaan of door te geven als `std::string`. Bij gestructureerde gegevens, zoals een datum, is een klasse zoals Date vaak de betere oplossing. Kun je uitleggen waarom?

<br>

Sinds C++20 vind je in het `<chrono>` headerbestand klassen terug om een datum voor te stellen, analoog aan jouw `Date` klasse uit opdracht 1.2.4. Je vindt er zelfs klassen als `day` en `year`: wat is hun nut?

<br>

Ook in de Boost C++ Libraries vind je zulke klassen terug. Zoek deze eens op in de documentatie. Gebruik dergelijke libraries om het werk te verlichten!

{{% /task %}}

Door de klasse ´Date´ te maken kunnen er complexe methodes achtergehouden worden die controleren als de datum geldig is. Indien er geen klasse is moeten deze methodes altijd opnieuw geïmplementeerd worden en dit zal zorgen voor onduidelijke en moeilijke code.

Door ´Date´ op deze manier voor te stellen wordt de notatievolgorde niet meer belangrijk waardoor er geen rekenfouten gemaakt kunnen worden.

### 1.2.6

:clipboard:
Methode maken voor het controleren welke datum het grootste is