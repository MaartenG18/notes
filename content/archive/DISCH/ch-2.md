+++
title= "2. Progammeerbare logica"
weight= 3
+++

## Table of contents

1. [Overzicht programmeerbare componenten](#overzicht-programmeerbare-componenten)
2. [FPGA-technologie](#fpga-technologie)


## Overzicht programmeerbare componenten

### Programmeerbare verbindingen

- **Fuse**:
	+ Gesloten verbinding, opent onder grote stroom
	+ OTP (One-Time Programmable)

- **Antifuse**:
	+ Open verbinding, sluit onder hoge spanning
	+ OTP

- **SRAM**-gebaseerde verbinding:
	+ Pass transistors gecontroleerd door SRAM
	+ Volledig CMOS gebaseerd

- **(E)EPROM**-gebaseerd:
	+ FAMOS EPROM technologie (UV- erasable)
	+ FLOTOX EEPROM technologie
	+ Flash technologie

### Programmeerbare componenten

- **(Simple) Programmable Logic Device ((S)PLD)**:
	+ Programmable Logic Array (PLA)
	+ Programmable Array Logic (PAL)
	+ Programmable Read Only Memory (PROM, EPROM, EEPROM)
- **Complex PLD (CPLD)**
- **Field Programmable Gate Array (FPGA)**

#### SPLD

- **Elke functie** kan geraliseerd worden in een **"Sum Of Products" (SOP)** vorm.
- Een **SOP** vorm kan **gerealiseerd worden door INV/AND/OR (of INV/NAND/NAND)**
- De **AND/OR gates zijn vooraf gemaakt**.
- **Programmeren** gebeurt door het **maken of verbreken van connecties tussen gates.**

![](/img/DISCH/ch-2/SPLD.png)

- **PLA**:
	+ Zowel AND als OR arrays zijn programmeerbaar
- **PAL**:
	+ AND array is programmeerbaar
	+ OR arry is vast
- **PROM**:
	+ Alle mogelijkheden zijn voorzien

#### PLA

- **Gemeenschappelijk gebruik van producttermen**
- Voorbeeld:
	+ F0 = A + B'C'
	+ F1 = AC' + AB
	+ F2 = B'C + AB
	+ F3 = B'C + A

![](/img/DISCH/ch-2/PLA-tabel.png)

- **Alle Mogelijke verbindingen zijn beschikbaar voor het programmeren:**

![](/img/DISCH/ch-2/PLA-clean.png)

- **De niet-gewenste verbindingen worden opgeblazen**

![](/img/DISCH/ch-2/PLA-ready.png)

{{% notice note %}}
Sommige technologieën maken verbindingen i.p.v. ze op te blazen.
{{% /notice %}}

- **Conventies PLA**
	+ Om het aantal lijnen te verminderen tekenen we de verschillende ingangen op 1 lijn.

	![](/img/DISCH/ch-2/PLA-conventie.png)

	+ Elke ingang wordt geïnverteerd zodat we zowel de niet-geïnverteerde ingang als de geïnverteerde ingang kunnen gebruiken.

- **Voorstelling PLA**
	+ PLA-voorstelling waarbij alle verbindingen gemaakt zijn.

	![](/img/DISCH/ch-2/PLA-all.png)
	
	+ PLA-voorstelling voor de implementatie:
		* F0 = AB + A'B'
		* F1 = CD' + C'D

	![](/img/DISCH/ch-2/PLA-voorbeeld.png)

#### Verschil tussen PLA en PAL

- **PAL: OR verbindingen zijn vast**
	+ De volgorde van de AND termen moeten zo gekozen worden dat ze overeenkomen met de verbindingen in de OR matrix.

	![](/img/DISCH/ch-2/PAL-clean.png)

	+ De AND termen zijn niet herbruikbaar.
		* Dit leidt tot een grotere matrix.
	+ Het aantal AND termen per OR is beperkt.
		* Niet alle functies zijn implementeeraar.
	+ Enkel het AND vlak moet geprogrammeerd worden.

- **PLA**:
	+ Zowel AND als OR verbindingen zijn programmeerbaar.
	+ De AND termen zijn herbruikbaar.
	+ Zowel het AND als het OR vlak moeten geprogrammeerd worden.

{{% task %}}

- Teken een PLA waarin de volgende functies geprogrammeerd zijn:
	+ Z1 = A xor B xor C
	+ Z2 = A and (B xnor C)
	+ 2-1 multiplexer
- Hoe ziet een PAL eruit waarin deze functies geprogrammeerd zijn?

{{% /task %}}

#### ROM als PLD

- In tegenstelling tot een PLA is een **ROM een structuur met een volledig gecodeerde AND array**.
- **Elke mogelijkheid tot het samen nemen van ingangen (adreslijnen) zit erin**.
![](/img/DISCH/ch-2/ROM-example.png)

{{% task %}}
Wat is de inhoud van een ROM-geheugen dat de volgende functies realiseert:
- Z1 = A xor B xor C
- Z2 = A and (B xnor C)
- 2-1 multiplexer
{{% /task %}}

#### CPLD

- **CPLD = Complex Programmable Logic Device**
- Een CPLD **bestaat uit verschillende logische blokken die elk equivalent zijn met een (S)PLD**.
- Deze **(S)PLDs worden met elkaar verbonden via een Programmable Interconnect Matrix (PIM)**.
- Op deze manier wordt het **Si-oppervlak nuttiger gebruikt in vergelijking met een grote PLD**.

Algemene structuur:

![](/img/DISCH/ch-2/CPLD.png)


## FPGA-technologie

- **FPGA = Field Programmable Gate Array**
- **Array van logische cellen die met elkaar en met de I/O cellen kunnen communiceren**
- Horizontale en verticale verbindingen.

### FPGA architectuur

![](/img/DISCH/ch-2/FPGA.png)

- **IOB**: Input/Output Block
- **CLB**: Configurable Logic Block
- **SM**: Switch Matrix

### Vergelijking CPLD en FPGA

- **CPLD**
	+ Continue interconnect
	+ Verbindingen hebben een vaste vertraging
- **FPGA**
	+ Gesegmenteerde verbindingen
	+ Verbindingen hebben een onvoorspelbare vertraging.

### Basisbouwblokken in een CLB

![](/img/DISCH/ch-2/CLB.png)

### Basisprincipe van een SM

![](/img/DISCH/ch-2/SM.png)

### Evolutie van Xilinx FPGA's

![](/img/DISCH/ch-2/Evolutie/evolution.png)

### Configuratie van FPGA's

- **Configuratiedata**: 
	+ bitstream
- **Configuratiegeheugen**:
	+ (Anti-)fuse: one-time programmable (OTP)
	+ Flash: niet-vluchtig
	+ SRAM: vluchtig
- **SRAM (vs. flash) configuratiegeheugen**:
	+ Hogere dichtheid
	+ Hoger vermogenverbruik
	+ On-board of on-chip niet-vluchtig geheugen nodig om de bitsream op te slaan tijdens power-off
	+ Hogere configuratiesnelheid
	
### Configuratie van een CLB

![](/img/DISCH/ch-2/CLB-configuratie.PNG)

### Configuratiebits

Waarom 16 configuratiebits voor een 4-naar-1 LUT?

- 2<sup>16</sup> mogelijke output functies:
	+ Z<sub>0</sub> = 0
	+ Z<sub>1</sub> = A'.B'.C'.D'
	+ Z<sub>2</sub> = A'.B'.C'.D
	+ Z<sub>3</sub> = A'.B'.C'
	+ ...
	+ Z<sub>65280</sub> = A
	+ ...
	+ Z<sub>65535</sub> = 1

| A | B | C | D | Z<sub>0</sub> | Z<sub>1</sub> | Z<sub>2</sub> | Z<sub>3</sub> | ... | Z<sub>65280</sub> | ... | Z<sub>65535</sub> |
|:-:|:-:|:-:|:-:|:-------------:|:-------------:|:-------------:|:-------------:|:---:|:-----------------:|:---:|:-----------------:|
| 0 | 0 | 0 | 0 | 0             | 1             | 0             | 1             |     | 0                 |     | 1                 |
| 0 | 0 | 0 | 1 | 0             | 0             | 1             | 1             |     | 0                 |     | 1                 |
| 0 | 0 | 1 | 0 | 0             | 0             | 0             | 0             |     | 0                 |     | 1                 |
| 0 | 0 | 1 | 1 | 0             | 0             | 0             | 0             |     | 0                 |     | 1                 |
| 0 | 1 | 0 | 0 | 0             | 0             | 0             | 0             |     | 0                 |     | 1                 |
| 0 | 1 | 0 | 1 | 0             | 0             | 0             | 0             |     | 0                 |     | 1                 |
| 0 | 1 | 1 | 0 | 0             | 0             | 0             | 0             |     | 0                 |     | 1                 |
| 0 | 1 | 1 | 1 | 0             | 0             | 0             | 0             |     | 0                 |     | 1                 |
| 1 | 0 | 0 | 0 | 0             | 0             | 0             | 0             |     | 1                 |     | 1                 |
| 1 | 0 | 0 | 1 | 0             | 0             | 0             | 0             |     | 1                 |     | 1                 |
| 1 | 0 | 1 | 0 | 0             | 0             | 0             | 0             |     | 1                 |     | 1                 |
| 1 | 0 | 1 | 1 | 0             | 0             | 0             | 0             |     | 1                 |     | 1                 |
| 1 | 1 | 0 | 0 | 0             | 0             | 0             | 0             |     | 1                 |     | 1                 |
| 1 | 1 | 0 | 1 | 0             | 0             | 0             | 0             |     | 1                 |     | 1                 |
| 1 | 1 | 1 | 0 | 0             | 0             | 0             | 0             |     | 1                 |     | 1                 |
| 1 | 1 | 1 | 1 | 0             | 0             | 0             | 0             |     | 1                 |     | 1                 |

### Configuratie van een SM

![](/img/DISCH/ch-2/SM-configuratie.PNG)

### Ontwerp van een digitaal systeem op FPGA

- **Beschrijving van het ontwerp**
	+ Schematische invoer
	+ Invoer via HDL (Hardware Description Language)
		* VHDL (VHSIC HDL)
			- VHSIC = Very High Speed Integrated Circuit
		* Verilog
- **Implementatie van het systeem**
	+ Bitsream met configuratie-gegevens
		* Na synthese en place & route
	+ Inladen van de bitstream
		* Via download kabel (parallel, USB) verbonden met PC
		* Vanuit on-board ROM
		
#### Ontwerp m.b.v. VHDL

- **Platform-onafhankelijke code**
	+ Bruikbaar voor alle FPGA's
	+ Bruikbaar voor ASIC standaardcel ontwerp
- **Platform-specifiek code**
	+ Geoptimaliseerd voor een specifiek FPGA
	+ Gebruikmakend van specifieke compenenten in een FPGA
		* Bv.: multiplexers, block RAM...
		
### FPGA vendors

- AMD (Xilinx) en Intel:
	+ SRAM-gebaseerde FPGA's
	+ Meer dan 2/3 van de FPGA markt
- Microchip (Microsemi):
	+ Flash-gebaseerde FPGA's
	+ Specifieke marktsector voor toepassingen met hoge betrouwbaarheid, databeveiliging, laag vermogenverbruik
- Lattice en Quicklogic:
	+ Laag vermogenverbruik
	+ Specifieke functionaliteit