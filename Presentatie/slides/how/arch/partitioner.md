##  Partitioner

<img src="./img/2-arch/partitioner.png" alt="Partitioner"/>

note:
Horizontaal schalen:
- dynamische partitionering van data over de nodes
  - partitioners -> fysieke plaats
    - hashfuncties

3 Soorten
1. RandomPartitioner
  - MD5 hash
2. Murmur3Partitioner
  - Murmur hash
  - Standaard sinds 1.2
3. ByteOrderedPartitioner
  - Volgens bytes primaire sleutel
  - Problemen:
    - "Hot spots"
    - Gebalanceerde cluster

Voorbeeld
- 6 nodes -> 6 ranges van hashwaardes a, b, c...
- record wegschrijven
- hash berekenen
- kijken tot welke ranges het behoort
- doorgeven aan juiste node
- node handelt write af
