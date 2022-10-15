+++
title= "3. week 4"
weight= 3
+++

Vragen nog verbeteren.

## RDBMS Transacties

### Transaction Management Basics

1. Er kan geen media recovery gebruikt worden omdat er bijvoorbeeld in een task een waarde veranderd wordt en deze daarna nog eens kan veranderen binnen dezelfde task. Als dit voorkomt en de data revocery valt toevallig tussen de 2 veranderingen dan zal de database op een fout moment gerecovered worden.

2. Er kunnen problemen voorkomen zoals berekeningen doen met waarden die niet juist zijn omdat elke task nog de foute waarde ziet omdat de veranderingen van 1 task nog niet gecommit zijn.

3. Bij UNDO moeten er een aantal stappen van de een task ongedaan gemaakt worden omdat de task nog niet is afgelopen bij de failure. Bij REDO moeten de taken opnieuw worden uitgevoerd omdat deze nog niet zijn opgeslaan in de recovery.

4. De database zou beschermd moeten worden zodat er dan geen wijzigingen kunnen gebeuren of er moet terug gegaan kunnen worden naar een recovery state van voor de crash waardoor de mogelijke wijzigingen ongedaan worden gemaakt.

5. Dan zal degene die zijn aanvraag om het artikel in het winkelmandje te doen het eerste bij de database manager komt degene zijn die voorrang krijgt en daardoor het artikel zal kunnen kopen. Aan de andere persoon zal dan een melding komen dat het artikel niet meer in stock was.

### Concurrency Control

1. Er zijn nog inserts mogelijk

2. Transactie 1 zou kunnen lezen terwijl transactie nog lijnen wil toevoegen en zo gaan ze elkaar in een deadlock brengen.

3. Atomicity, Isolation

4. Hoe meer locks er zijn hoe trager alles wordt want er moeten meer transacties op elkaar wachten. 