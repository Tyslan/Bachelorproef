##  Herstelmechanismes

1. Hinted-handoff
2. Anti-entropy repair
3. Read repair
  1. Synchrone read repair
  2. Asynchrone read repair
  3. Manuele read repair

note:
Hinted handoff

- Online node houdt hint bij voor offline node (max 3uur)
- Online komen:
  - Reads blokkeren (consistentie)
  - Hints doorvoeren
  - Reads toestaan

Anti-entropy
  - Anti-entropy: replica's vergelijken en bijwerken indien nodig
  - Asynchroon proces
  - Continu uitvoeren

Read repair
  - Allemaal identiek
  - Enkel wanneeer verschilt
  - Checksum vergelijken
    - Niet gelijk -> ophalen -> updaten op basis van timestamp
