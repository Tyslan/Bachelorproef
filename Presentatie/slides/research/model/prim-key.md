##  Primaire sleutel

```
((part-col-1, part-col-2, ...) clus-col-1, clus-col-2, ...)
```
```
(part-col-1, clus-col-1, clus-col-2, ...)
```

_**Partitiekolom:**_
- Data gebalanceerd verspreiden
- Snel fysieke locatie bepalen
- Restrictie:
  - 'Slechts' 2 miljard entry's per partitie

_**Clusteringkolom:**_
- Boomstructuur binnen partitie

note:
Niet uniek
- INSERT = UPDATE
- Indien geen haakjes rond part cols: maar 1 part col nl de eerste col

Restricties door de manier waarop op geslagen wodt en performantie te garanderen

Restricties partitie:

- Enkel rechtstreeks '=' en 'IN' mogelijk
- '<', '<=', '>', '>='
  - Via token - Niet altijd gewenste resultaat
  - Rechtstreeks met ByteOrderedPartitioner
