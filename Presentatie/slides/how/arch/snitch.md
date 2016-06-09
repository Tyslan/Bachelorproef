##  Snitch

<img src="./img/2-arch/snitch.png" alt="Snitch"/>

note:
- Snel en efficiënt data ophalen
- 8 soorten:
  - Fysieke datacenters: GossipingPropertyFileSnitch
  - Cloud: bijhorende snitch

SimpleSnitch

1. Query op de coördinator
  1. Snitch zoekt uit waar de replica's staan en haalt informatie over deze nodes op
2. Op basis van deze info wordt de query doorgegeven aan de meest geschikte node
3. Coördinator krijgt resultaat
4. Client krijgt resultaat
