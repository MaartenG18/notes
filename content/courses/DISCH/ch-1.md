---
title: 1. Inleiding
---

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
een **programmeertaal (C)**. //TODO(dit verder afmaken)

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