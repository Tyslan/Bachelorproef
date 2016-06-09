##  Doel

1. Data evenwichtig verspreiden
2. Weinig partitie reads

Onbelangrijk:

- Aantal writes
- Duplicate data

note:
Evenwichtig:
- partitie kolommen
- werk verdelen over alle nodes

Partitie reads:
- Iedere partitie op andere node => overhead want query naar alle nodes
- Zelf partities op dezelfde nodes queryen is inefficiënt

- Cassandra is geoptimaliseerd voor groot aantal writes
- Schijfruimte is goedkoop tov CPU, netwerk, geheugen ed
  - Basis van Cassandra
