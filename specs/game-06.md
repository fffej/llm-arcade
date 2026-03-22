# Loogie Loop

## **Title**
**Loogie Loop**

## **Inspiration**
1. **[Arctic tern migration patterns](https://arcticcentre.org/en/arctic-region/arctic-birds/record-migration/)**  
   Arctic terns do not take neat direct trips; they make enormous looping pole-to-pole journeys, with measured routes reaching about `96,000 kilometers` in a year. I took the feeling of a migration that is smarter than a straight line and made looping reroutes the whole point of scoring.

2. **[Virginia's law against expectorating in public places](https://law.lis.virginia.gov/vacode/title18.2/chapter7/section18.2-322/)**  
   Virginia still has a statute that says you cannot spit on public floors, stairways, conveyances, or sidewalks. I took that gloriously specific prohibition and turned spit itself into the player's forbidden but extremely useful level-editing tool.

3. **[Slime mold solving mazes](https://www.mbl.edu/news/how-can-slime-mold-solve-maze-physiology-course-finding-out)**  
   Slime mold can form efficient routes through a maze without a brain, growing toward food and collapsing wasteful branches. I took that as the central simulation rule: every droplet you place causes a living network to re-compute the "best" path for everything currently flying.

## **Elevator Pitch**
You are the disgraced sanitation controller of a public polar transit hall where migrating arctic terns refuse to fly in straight lines. To keep them moving, you commit tiny crimes: firing illegal spit droplets onto the floor to seed a hungry slime network that instantly grows the most efficient route between poles. Flocks latch onto the living path, but every new droplet rewrites the whole map, so the game becomes a frantic 60-second act of route vandalism: build a loop, bait the birds, erase dead branches, and do just enough public expectoration to beat the citation meter.

## **Core Mechanics**
- **Playfield**  
  Single-screen top-down concourse shaped like a stylized public terminal. The top edge is `ARCTIC`, the bottom edge is `ANTARCTIC`, and the middle contains stairs, sidewalks, tiled floor strips, drain grates, benches, and a few legal bio-waste trays.

- **Player role**  
  You control a fast reticle that places droplets and prunes slime, not a walking character.

- **Controls**  
  `Arrow keys` or `WASD` move the reticle.  
  `Space` spits a droplet onto the tile under the reticle.  
  `Shift` scrapes away the nearest slime segment.  
  `Z` toggles the active attractant between `KRILL` and `DAYLIGHT`.  
  `X` triggers a one-second `MIGRATION PULSE` that makes every flock immediately re-evaluate the current slime network.

- **Living route system**  
  Spit droplets are not bullets. They become nutrient nodes. Nearby nodes connect with pulsing slime veins, and the vein network constantly collapses toward the shortest currently viable route between active food beacons. A new droplet can make the whole route buckle and reform in a different shape.

- **Tern behavior**  
  Flocks enter from the top or bottom edge and try to complete a full migration loop: one leg to the opposite pole, then a return leg back through a different side of the arena. They naturally prefer to ride existing slime veins because it gives them speed and coherence.

- **Dual attractants**  
  `KRILL` makes slime favor dense, compact routes through food-rich zones. `DAYLIGHT` makes slime favor brighter edge lanes and long side arcs. Swapping attractant type mid-run changes which branches stay alive, letting you bend the same flock into a short efficient cut or a glamorous looping detour.

- **Public-law pressure**  
  Spitting onto marked public tiles raises a visible `CITATION` meter. Spitting into the moving legal trays does not. The best routes often require brief violations, so the player is constantly deciding when to break the rule and when to route safely through the few legal surfaces.

- **Win/Lose conditions**  
  The run lasts `60` seconds. You are chasing score. The run ends early if the `CITATION` meter fills or if too many flocks stall and pile up in dead-end slime knots.

## **The Twist**
The player is not drawing a path and the birds are not simply following waypoints. You are feeding a live pathfinding organism that keeps redesigning the level underneath everyone in motion. Every illegal spit changes the graph, every graph change bends the flock, and the most valuable migration line is often not the shortest one until you change the attractant and force the slime to rethink the world. It feels less like steering and more like committing minor civic bio-crimes to negotiate with an ecosystem.

## **Visual Style**
Clean public-infrastructure geometry corrupted by luminous biology. The concourse should read as pale station tile, brass stair edges, warning-strip yellows, and civic green signage, all slowly overrun by glossy translucent slime in mint, toxic teal, and sickly pearl. Arctic terns should be tiny white dart-shapes with ribbon tails and sharp flock turns, while slime veins should throb like subway maps made of mucus and moonlight. Everything is achievable with Canvas primitives, gradients, procedural patterns, and simple CSS framing.

## **Scoring**
- Completing one pole-to-pole leg: `+40`
- Completing a full out-and-back migration loop: `+160`
- Finishing the return leg on a different side lane than the outbound leg: `+60 loop purity bonus`
- Redirecting multiple flocks with one network recomputation: combo multiplier starts at `x2`
- Keeping a flock moving for an entire leg without using `MIGRATION PULSE`: `+25 natural flow bonus`
- Public-tile spit violation: `-10` and `CITATION` increases
- Flock trapped in a dead-end knot too long: `-35`

## **Difficulty Progression**
- Early seconds: few flocks, wide legal trays, and simple slime growth let the player learn that droplets reshape the route rather than merely mark it.
- Mid run: stairs and bench islands split the concourse into awkward channels, so recomputing a path can rescue one flock while stranding another.
- Later waves: mixed inbound and outbound flocks share the same slime, meaning one attractant choice can help southbound birds and sabotage northbound returns.
- Final `15` seconds: legal trays drift faster, `CITATION` rises more sharply on illegal spit, and flock density turns the network into a twitchy living traffic jam where every droplet is either genius or a disgusting federal mistake.
