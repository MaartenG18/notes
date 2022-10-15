+++
title= "2. week 2-3"
weight= 3
+++

1. Schrijf een query die alle Customers (volledige naam, customer ID en land) laat zien die niet wonen in de USA.

```SQL
SELECT * FROM customers WHERE Country != 'USA'
SELECT * FROM customers WHERE Country <> 'USA'
```

2. Schrijf een query die enkel de Customers laat zien die in Brazilië wonen.

```SQL
SELECT * FROM customers WHERE Country = 'Brazil';
```

3. Schrijf een query die alle Employees laat zien die werken in de Sales afdeling.

```SQL
SELECT * FROM employees WHERE Title like 'Sales%';
```

4. Schrijf een query die een unieke lijst van landen laat zien uit de Invoices tabel.

```SQL
SELECT DISTINCT BillingCountry FROM invoices;
```

5. Schrijf een query die alle Tracks laat zien waarvoor er geen componist bekend is.

```SQL
SELECT * FROM tracks WHERE Composer is NULL;
```

6. Schrijf een query van alle unieke Componisten. Als de componist niet bekend is, dan moet er ‘Onbekend’ weergegeven worden gesorteerd op naam.

```SQL
SELECT * FROM tracks WHERE Composer is NULL;
```

7. Schrijf een query die het maximumbedrag van een Invoice laat zien.

```SQL
SELECT MAX(total) FROM invoices;
```


1. Schrijf een query die alle Invoices laat zien van alle Customers uit Brazilië. Het resultaat moet de volledige naam van de Customer, Invoice ID, Invoice Datum en Billing Country weergeven.

```SQL
SELECT FirstName, LastName, InvoiceId, InvoiceDate, BillingCountry 
FROM invoices
INNER JOIN customers ON customers.CustomerId = invoices.CustomerId
WHERE customers.Country = 'Brazil';
```

2. Schrijf een query die alle Invoices laat zien voor elke Sales Agent. Het resultaat moet de volledige naam van de Sales Agent weergeven.

```SQL
SELECT employees.FirstName, employees.LastName, invoices.* FROM invoices
INNER JOIN customers ON customers.CustomerId = invoices.CustomerId
INNER JOIN employees ON employees.EmployeeId = customers.SupportRepId
```

3. Schrijf een query die het Invoice Totaal, de Customer naam en land en de naam van de Sales Agent weergeeft voor alle Invoices en Customers.

```SQL
SELECT invoices.Total, customers.FirstName, customers.LastName, customers.Country, employees.FirstName, employees.LastName FROM invoices
INNER JOIN customers ON customers.CustomerId = invoices.CustomerId
INNER JOIN employees ON employees.EmployeeId = customers.SupportRepId;
```

4. Schrijf een query die het aantal invoice lijnen weergeeft voor Invoice ID 37.

```SQL
SELECT invoices.InvoiceId, invoice_items.* FROM invoice_items
INNER JOIN invoices ON invoices.InvoiceId = invoice_items.InvoiceId
WHERE invoices.InvoiceId = 37;
```

5. Schrijf een query die de track naam weergeeft langs elke invoice lijn.

```SQL
SELECT invoice_items.InvoiceLineId, tracks.Name from tracks
INNER JOIN invoice_items ON invoice_items.TrackId = tracks.TrackId;
```

6. Schrijf een query die de track naam en de artiest naam weergeeft langs elke invoice lijn.

```SQL

```

7. Schrijf een query die alle tracks laat zien, maar geen ID’s. Het resultaat moet de album titel, het media type en het genre bevatten.

```SQL

```

8. Schrijf een query die alle genres weergeeft waarvoor er geen tracks bestaan.

```SQL

```


1. Schrijf een query die het aantal Invoices laat zien voor 2009 en 2011.

```SQL
SELECT strftime('%Y', invoices.InvoiceDate), count(*) from invoices
WHERE strftime('%Y', invoices.InvoiceDate) in ('2009', '2011')
GROUP BY strftime('%Y', invoices.InvoiceDate);
```

2. Schrijf een query die het aantal invoices per land laat zien.

```SQL
SELECT BillingCountry, count(*) FROM invoices
GROUP BY BillingCountry;
```

3. Schrijf een query die per Invoice ID het aantal invoice lijnen laat zien.

```SQL
SELECT InvoiceId, count(*) FROM invoice_items
GROUP BY InvoiceId;
```

4. Schrijf een query die de naam van elke playlist laat zien, alsook het aantal tracks in elke playlist.

```SQL
SELECT Name, count(*) FROM playlists
INNER JOIN playlist_track ON playlists.PlaylistId = playlist_track.PlaylistId
GROUP BY playlists.PlaylistId;
```

5. Schrijf een query die alle data uit de Invoices tabel laat zien, aangevuld met het aantal invoice lijnen.

```SQL
SELECT invoices.*, count(*) FROM invoices
INNER JOIN invoice_items ON invoices.InvoiceId = invoice_items.InvoiceId
GROUP BY invoices.InvoiceId
```

6. Schrijf een query die de totale verkoopcijfers per Sales Agent laat zien.

```SQL
SELECT employees.FirstName, employees.LastName, sum(invoices.total) FROM invoices
INNER JOIN customers ON customers.CustomerId = invoices.CustomerId
INNER JOIN employees ON employees.EmployeeId = customers.SupportRepId
GROUP BY employees.LastName;
```

7. Schrijf een query die laat zien welke Sales Agent de grootste verkoopcijfers heeft voor 2009.

```SQL
SELECT employees.FirstName, employees.LastName, sum(invoices.total) FROM invoices
INNER JOIN customers ON customers.CustomerId = invoices.CustomerId
INNER JOIN employees ON employees.EmployeeId = customers.SupportRepId
GROUP BY employees.LastName
HAVING strftime('%Y', invoices.InvoiceDate) in ('2009')
ORDER BY sum(invoices.total) DESC
LIMIT 1
```

8. Schrijf een query die laat zien welke Sales Agent de grootste verkoopcijfers heeft voor 2010.

```SQL
SELECT employees.FirstName, employees.LastName, sum(invoices.total) FROM invoices
INNER JOIN customers ON customers.CustomerId = invoices.CustomerId
INNER JOIN employees ON employees.EmployeeId = customers.SupportRepId
GROUP BY employees.LastName
HAVING strftime('%Y', invoices.InvoiceDate) in ('2010')
ORDER BY sum(invoices.total) DESC
LIMIT 1
```

9. Schrijf een query die laat zien welke Sales Agent de grootste verkoopcijfers heeft over alle jaren heen.

```SQL
SELECT employees.FirstName, employees.LastName, sum(invoices.total) FROM invoices
INNER JOIN customers ON customers.CustomerId = invoices.CustomerId
INNER JOIN employees ON employees.EmployeeId = customers.SupportRepId
GROUP BY employees.LastName
ORDER BY sum(invoices.total) DESC
LIMIT 1
```

10. Schrijf een query die het aantal Customers laat zien per Sales Agent.



1. Schrijf een query die alle invoices laat zien die een track bevatten van Iron Maiden.

```SQL
SELECT * FROM invoices
WHERE EXISTS (
	SELECT * FROM artists
	INNER JOIN invoice_items ON invoices.InvoiceId = invoice_items.InvoiceId
	INNER JOIN tracks ON invoice_items.TrackId = tracks.TrackId
	INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
	where artists.Name = 'Iron Maiden' AND albums.ArtistId = artists.ArtistId
);
```

2. Schrijf een query die alle invoices laat zien die verkocht werden door Margaret Park.

```SQL
SELECT * FROM invoices
WHERE EXISTS (
	SELECT 1 FROM employees
	INNER JOIN customers ON customers.CustomerId = invoices.CustomerId
	WHERE employees.FirstName LIKE 'Margaret' AND employees.EmployeeId = customers.SupportRepId
);
```

3. Schrijf een query die alle genres laat zien waarvoor er geen track bestaat.

```SQL
SELECT * FROM genres
WHERE NOT EXISTS (
	SELECT 1 FROM tracks
	WHERE tracks.GenreId = genres.GenreId
);
```

4. Schrijf een query die alle invoices laat zien waarvan de prijs groter is dan het gemiddelde van alle invoices.

```SQL
SELECT * FROM invoices
WHERE Total > (
	SELECT avg(Total) FROM invoices
);
```

5. Schrijf een query die alle invoices laat zien waarin een Metallica track verkocht is, waarvan de prijs groter is dan het gemiddelde van alle invoices waarin een Metallica track verkocht is.

```SQL

```