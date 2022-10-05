+++
title= "2. week 3"
weight= 3
+++

## Opdrachten Hoofdstuk 5

### 2.2.1

{{% task %}}

Zoek uit hoe `std::pair`, `std::map`, `std::tuple` en `std::get()` gebruik maken van templates op basis van de documentatie. Waarvoor gebruikt `std::map` default template argumenten? Waarom geven bepaalde varianten van `insert()` bij `std::map` een `std::pair` terug?

{{% /task %}}

Ze maken gebruik van templates om objecten van alle types te kunnen opslaan zodat er niet voor alle mogelijke datastructuren een andere constructor moet gemaakt worden. 

`std::map()` gebruikt default argumenten voor de compare en allocater variabelen.

`std::map()` returnt soms een `std::pair` omdat dit een boolean bevat die aangeeft of de insert gelukt is of niet.

---
