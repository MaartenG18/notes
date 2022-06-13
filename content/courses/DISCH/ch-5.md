+++
title= "5. Simulatie"
weight= 3
+++

## Table of contents

1. [Testbenches](#testbenches)
2. [Evalutie van een hardware-ontwerp](#evalutie-van-een-hardware-ontwerp)

## Testbenches

### Doelstelling van testbenches

- Het testen van VHDL code (of delen van code) zodat de juiste werking kan getest worden voordat de code geïmplementeerd wordt in een hardware component.
- Het definiëren van een omgeving die in eens testmachine kan gebruikt worden om een bestaande component te testen.

Een elektronisch ontwerp maken op zich volstaat niet. Bij een goed ontwerp bestaat minstens 50 % van de ontwerptijd uit het uitdenken en uitwerken van testen die verzekeren dat het ontwerp functioneert zoals het moet. Deze testen dienen zowel te gebeuren tijdens de verschillende iteraties en verbeteringen van het ontwerp als na de uiteindelijke realisatie. Het is ook goed om eerst de verschillende deelblokken uitvoerig en volledig te testen en pas daarna (als alle deelblokken correct werken) het geheel te testen. Het vlug wat signalen aanleggen nadat de VHDL code klaar is en het vlug even kijken of de uitgangssignalen zijn zoals we denken dat ze moeten zijn, volstaat duidelijk niet en is de foutieve aanpak.

### Voordelen van testbenches

- In een testbench kan je systematisch alle te voorziene situaties implementeren, zodat je de zekerheid hebt dat de component onder alles omstandigheden zal werken.
- Bij complexe systemen kan je niet manueel alle mogelijkheden testen.
- Debuggen kan gebeuren zonder de component in werkelijkheid te moeten programmeren.

Bij een goed ontwerp zullen we gelijktijdig met het ontwerp (of zelfs vooraf) ook de testen waaraan het ontwerp dient te voldoen schrijven. Deze testen worden ook in VHDL beschreven en elke keer dat we het ontwerp testen, zullen we dat doen aan de hand van dezelfde testbench.

### Implementatie

- Een nieuw bouwblok (van een hoger niveau) wordt gecreëerd.
- Deze bouwblok gebruikt de te testen blok (DUR of Device Under Test) als component:
	+ Ingangssignalen worden hieraan aangelegd
	+ Uitgangssignalen worden opgemeten
	+ De verschillen tussen wat verwacht wordt en wat bekomen wordt, worden gerapporteerd.
		* Naar het scherm toe
		* Naar een tekstfile

![](/img/DISCH/ch-5/DUT.PNG)

### Basisstructuur van een testbench

- De entity van de testbench bevat geen port.
- De architecture vangt aan met de declaratie van alle input en output signalen van de DUT en eventueel ook de declaratie van ee log-file om resultaten in weg te schrijven.
- De component die moet getest worden, wordt vervolgens gedeclareerd.

```VHDL
entity testbench is
end testbench;

architecture test of tesbench is
	signal in0,in1,in2,in3: bit;
	signal output: bit;
	component te_testen
		port(in0, in1, in2, in3: in bit;
			 output: out bit);
	end component;
```

- In de body van de architectuur (na begin instructie) staat vervolgens de instantiatie van de resten component.
- Daarna volgen processen die inputs aanleggen of outputs wegschrijven.

```VHDL
begin
	dut: te_testen port map(in0, in1, in2, in3, output);

	process
		begin
			in0 <= '1';
			in1 <= '0' after 1 ns;
			wait for 10 ns;
			in2 <= '0';
			in3 <= '1' after 1 ns;
			wait for 10 ns;
			in0 <= '0';
			in1 <= '1' after 1 ns;
			wait for 10 ns;
			in2 <= '1';
			in3 <= '0' after 1 ns;
			wait for 10 ns;
	end process;
```


### Kloksignaal in een testbench

- De klok-periode kan als constant gedaclareerd worden

```VHDL
CONSTANT clk_period = time := 10 ns;
```

- De klok kan gegenereerd worden door een speciaal proces.

``` VHDL
clk_process: process
begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end process;
```

### Berichten in een testbench

- De assert instructie laat toe berichten mee te delen.
- De assert instructie wordt gevolgd door een booleaanse expressie.
- Als aan deze expressie niet voldaan is wordt een "assetion violation" gerapporteerd. (default)

```VHDL
assert (out = (in1 and in2));
```

- Je kan hetgeen gerapporteerd wordt aanpassen met een report keyword
- Na de report moet altijd een string volgen.

```VHDL
assert (out = (in1 and in2)) report "De and-poort werkt niet";
```

- De report kan ook los staan.

```VHDL
report "Ik ben nu in deze lus";
```

- De ernst van het bericht kan je aanpassen met het severity keyword.
- De ernst die hierop volgt moet van het type `severity_level` zijn.
- Je kan bepalen bij welke erns de simulator moet stoppen.

```VHDL
assert (out = (in1 and in2)) report "Fout" severity ERROR;
```

```VHDL
type severity_level is (note, warning, error, failure);
```

## Evalutie van een hardware-ontwerp

- **Maximale klokfrequentie = 1/(vertraging van het kritisch pad)**
- **Bepaling van de maximale klokfrequentie door de tools:**
	+ Leg een bepaalde klokfrequentie op.
	+ Check via de ontwerptools of de opgelegde frequentie kan gehaald worden.
	+ Indien niet: herhaal met een lagere klokfrequentie
	+ Indien wel: herhaal met een hogere klokfrequentie
	+ De maximale klokfrequentie is gelijk aan de hoogste klokfrequentie waarover de tools rapporteren dat ze gehaald kan warden.