## Methodes

#### cqlsh

```SQL
COPY tablename (column1 , column2, ...)
FROM 'path/to/file'
(WITH option1 = 'value' (AND option2 = 'true' AND ...))
```

Tijd is lineair afhankelijk van de hoeveelheid data

####  sstableloader

Alle nodes gebruiken

Zelf applicatie schrijven

#### cassandra-loader

Alle nodes gebruiken

note:

cqlsh

- Asynchroon
- Connectie op 1 node
  - Kan vastlopen bij meer dan 1 miljoen rijen
    - Opsplitsen
    - sstableloader
    - cassandra-loader

- Kolomnamen meegeven want csv heeft niet noodzakelijk zelfde volgorde als Cassandra intern
- scheidingsteken tussen velden en encapsulering kan gespecificieerd worden
- meegegeven wat er met een null waarde aangevangen moet worden

sstableloader

- Alle nodes gebruiken
- Aangepaste applicatie schrijven
- Alle nodes moeten online zijn

cassandra-loader

- Brian Hess
- Vergelijkbaar met COPY maar alle nodes gebruiken
- Minimaal 8GB werkgeheugen nodig
