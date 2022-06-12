+++
title= "1. Inleiding"
weight= 3
+++

## Table of contents

1. [Herhaling implementatieplatformen](#herhaling-implementatieplatformen)
2. [FPGA vs. microprocessor](#fpga-vs-microprocessor)
3. [Codevoorbeeld](#codevoorbeeld)

## Herhaling implementatieplatformen

**Discrete logica**: digitale schakelingen opgebouwd met bijvoorbeeld chips uit de 74-reeks.

![](/img/DISCH/ch-1/Discrete-logica.png)

**Microprocessor**: vaste hardware waarop software wordt uitgevoerd, zoals bijvoorbeeld de ATmega328-processor op het Arduino Uno-bord.

![](/img/DISCH/ch-1/Microprocessor.png)

**ASIC (Application Specific Integrated Circuit)**: vaste hardware met een specifieke functie.

![](/img/DISCH/ch-1/ASIC.png)

**FPGA (Field-Programmable Gate Array)**: configureerbare hardware met een regelmatige structuur, waarop specifieke functies geïmplementeerd kunnen worden.

## FPGA vs. microprocessor

### FPGA

#### Bouwblokken van de FPGA

![](/img/DISCH/ch-1/FPGA.png)

- **CLB**: Configurable Logic Block
- **SM**: Switch Matrix
- **IOB**: Input/Output Block

#### Basisblokken van een CLB

![](/img/DISCH/ch-1/CLB.png)

- **FF**: Flip-Flop
- **Mutex**: Multiplexer
- **LUT**: Look-Up Table
	- Kan geconfigureerd worden tot eender welke functie met 4 ingangen en 1 uitgang.

### Microprocessor

De **CPU** is het hart van een microprocessor en bevat o.a.:

- **ALU**: Arithmatic Logic Unit
- **Register file**
- **Programmageheugen**

## Codevoorbeeld

We beschouwen een stukje code in een **hardwarebeschrijvingstaal (VHDL)** en in
een **programmeertaal (C)**.

- Het **input-outputgedrag** van de implementatie is **functioneel hetzelfde**.
- De **implementatie** gebeurt op een **volledig andere manier** op een **FPGA** dan op de **microprocessor**
- In zowel VHDL als C zijn `a` en `z` bytes, in VHDL is `sel` een bit en in C is `sel` een byte

<div class="devselect">

```VHDL
if sel = '1' then
	z <= a sll 1;
else
	z <= a srl 1;
end if;
```

```C
if((sel & 0x01) == 1) {
	z = a << 1;
} else {
	z = a >> 1;
}
```

</div>

Beide codefragmenten implementeren een **schuifbewerking naar links** als de **selectiebit gelijk is aan 1** en **anders** een **schuifbewerking naar rechts**. Dus ofwel wordt:

- z<sub>7</sub>z<sub>6</sub>z<sub>5</sub>z<sub>4</sub>z<sub>3</sub>z<sub>2</sub>z<sub>1</sub>z<sub>0</sub> = a<sub>6</sub>a<sub>5</sub>a<sub>4</sub>a<sub>3</sub>a<sub>2</sub>a<sub>1</sub>a<sub>0</sub>0 (links)
- z<sub>7</sub>z<sub>6</sub>z<sub>5</sub>z<sub>4</sub>z<sub>3</sub>z<sub>2</sub>z<sub>1</sub>z<sub>0</sub> = 0a<sub>7</sub>a<sub>6</sub>a<sub>5</sub>a<sub>4</sub>a<sub>3</sub>a<sub>2</sub>a<sub>1</sub> (rechts)

### VHDL -> FPGA

Er zijn er 2 hardware equivalenten van toepassing:

- Een **schuifbewerking** is het *verbinden van in- en uitgangen met elkaar op een verschoven manier*. 
- *Kiezen tussen 2 mogelijke waarden op basis van een selectiebit* is een **multiplexer**

Hiervoor zijn **8 multiplexers nodig om de 8 bits van z aan te sturen**. Om dit **op een FPGA te configureren zullen er dus 8 LUT's gebruikt worden zonder FF**.

- De **6 middenste LUT's implementeren een multiplexer**.
- De **bovenste en onderste LUT's** implementeren een functie die **ofwel 0 ofwel de inkomende a<sub>i</sub> doorlaat op basis van de selectiebit**.

De **LUT's in de CLB's** worden **verbonden met de juiste in- en uitgangen via Switch Matrices**.

![](/img/DISCH/ch-1/Configuratie.PNG)

De LUT's zijn op onderstaande manier geconfigureerd:

- Bovenste LUT = bovenste multiplexer:
	
|A|B|C|D|LUT-out|
|-|-|-|-|-------|
|0|0|x|x|0|
|0|1|x|x|0|
|1|0|x|x|1|
|1|1|x|x|0|

- Middelste LUT (6x) = middelste multiplexer (6x)

|A|B|C|D|LUT-out|
|-|-|-|-|-------|
|0|0|0|x|0|
|0|0|1|x|0|
|0|1|0|x|1|
|0|1|1|x|0|
|1|0|0|x|0|
|1|0|1|x|1|
|1|1|0|x|1|
|1|1|1|x|1|

- Onderste LUT = onderster multiplexer

|A|B|C|D|LUT-out|
|-|-|-|-|-------|
|0|0|x|x|0|
|0|1|x|x|0|
|1|0|x|x|0|
|1|1|x|x|1|

### C -> microprocessor

Het **schuiven van bits in een microprocessor gebeurt in de ALU via een schuifbewerking**. De schuifinstructies met bijhorende machinecode zien er als volgt uit:

- **Logical Shift Left (LSL)**:
	+ De byte op adres Rd = ddddd wordt 1 bit naar links geschoven en daarna terug geschreven op hetzelfde adres. 
	+ De opcode komt overeen met een optelling van 2 dezelfde getallen.
	
![](/img/DISCH/ch-1/LSL.PNG)

- **Logical Shift Right (LSR)**:
	+ De byte op adres Rd = ddddd wordt 1 bit naar rechts geschoven en daarna terug geschreven op hetzelde adres.

![](/img/DISCH/ch-1/LSR.PNG)

Het **controleren of een byte gelijk is aan een constante waarde gebeurt in de ALU via een aftrekking**. Als die aftrekking in 0 resulteert, is de byte gelijk aan de constante waarde en anders niet. De zero-flag aan de uitgang van de ALU geeft dus het resultaat weer. Een **volgende instructie kan dan de zero-flag controleren om te kiezen tussen de volgende instructie in het programmageheugen of een instructie ergens anders in het programmageheugen**.

- **Compare with Immediate (CPI)**:
	+ De Waarde KKKKKKKK wordt afgetrokken van de byte op adres Rd = 1dddd; waarbij de zero-flag al dan niet 1 wordt.

![](/img/DISCH/ch-1/CPI.PNG)

- **Branch if Equal (BREQ)**:
	+ Als de zero-flag gelijk is aan 0, springt de program counter 1 plaats verder.
	+ Als de zero-flag gelijk is aan 1, springt de program counter kkkkkkk+1 plaatsen verder.

![](/img/DISCH/ch-1/BREQ.PNG)

Vermits we alle **bewerkingen op bytes uitvoeren, moeten we een bit isoleren uit een byte om met 1 selectiebit te werken**. We gebruiken een **bitmask om 1 bit te selecteren**. Dat doen we door een *AND-bewerking uit te voeren met een constante byte die uit zeven 0-en en één 1 bestaat. De plaats van de 1 bepaalt welke bit we willen gebruiken*.

![](/img/DISCH/ch-1/ANDI.png)

In dit voorbeeld zouden het programmageheugen, de register file en de zero-flag er als volgt kunnen uitzien:

|| Programmageheugen||
|---|--------|-|
| 0 | `0111000001000001` | ANDI r20, 1 |
| 1 | `0011000001000001` | CPI r20, 1|
| 2 | `1111000000011001` | BREQ 3 |
| 3 | `1001010000000110` | LSR r0 |
|...| | |
| 6 | `0000110000000000` | LSL r0 |

![](/img/DISCH/ch-1/Register-file.png)

{{% task %}}
Geef aan hoe onderstaand codevoorbeeld kan omgezet worden in een implementatie op een FPGA en een microprocessor, waarbij c, d en z bytes zijn en waarbij sel een bit is in de VHDL-code en een byte is in C-code. Geeft aan hoe de LUT's geconfigureerd zijn in de FPGA-implementatie. Geef aan wat er in het programmageheugen en de register file zit in de microprocessorimplementatie. Gebruik de [AVR-instructieset](/pdf/DISCH/AVR-instructies.pdf) om de gepaste instructies te vinden. 
<br> 

<div class="devselect">

```VHDL
if sel = ‘1’ then
	z <= c and d;
else
	z <= c or d;
end if;
```

```C
if((sel & 0x80) == 0x80) {
	z = c & d;
} else {
	z = c | d;
}
```

</div>
{{% /task %}}