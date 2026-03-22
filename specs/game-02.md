# Monotreme Fever

## **Title**
**Monotreme Fever**

## **Inspiration**
1. **The Mpemba effect in freezing water**  
   Under some conditions, hotter water can freeze before colder water. I took the idea that the "wrong" thermal choice can create the fastest path, and made overheating the main setup move instead of a mistake.

2. **The platypus as a taxonomy rule-breaker**  
   The platypus looks like several animal categories collided and refused to separate: egg-laying, milk-producing, venomous, duck-billed, mammalian. I took that category chaos and turned identity into a gameplay state that changes how each object behaves.

3. **The dancing plague of 1518**  
   A crowd reportedly fell into contagious, unstoppable motion. I took the idea of movement spreading from one body to nearby bodies and made "dance fever" the chain-reaction system that lets one sliding object hijack a whole cluster.

## **Elevator Pitch**
You are the climate operator of a very illegal natural history exhibit where runaway platypus-stones are trying to escape categorization. Each round, impossible little egg-rock-beasts skitter across a salt-flat display case. You cannot push them directly. Instead, you overheat one so it freezes first during the next cold snap, angle the wind so it sails across the floor, and trigger a contagious dance pulse that makes nearby specimens copy its glide. In under 60 seconds, the player is constantly doing something that feels absurd but works: making things hotter so they move on ice sooner, then weaponizing that motion outbreak to sort a herd of classification disasters.

## **Core Mechanics**
- **Playfield**  
  Single-screen top-down salt pan with three archive gates on the right edge. Each gate requests a trait for the current wave, such as `MAMMAL`, `EGG`, or `VENOM`.

- **Player role**  
  You control the exhibit's weather system and a selection cursor, not a character.

- **Controls**  
  `Left` / `Right` cycle the selected specimen.  
  `Up` applies a short heat burst to the selected specimen.  
  `Down` triggers a global cold snap that lays a thin ice film over the arena for a second.  
  `A` / `D` tilt the wind left or right during the cold snap.  
  `Space` flips the selected specimen between its two visible trait stances.

- **Specimens**  
  Each specimen is an animated "platypus-stone": part pebble, part egg, part animal hoax. Every one has two stances it can swap between, such as `MAMMAL / EGG`, `MAMMAL / VENOM`, or `DUCK / FUR`. The active stance changes its scoring target and one physical behavior.

- **Paradox movement**  
  Heating a specimen does not launch it immediately. Instead, it stores thermal charge. On the next cold snap, the most-heated specimens form slick ice first and start sailing first, echoing the Mpemba-style paradox that the hotter setup can produce the faster freeze-driven movement.

- **Dance fever**  
  When a sailing specimen passes close to another specimen, it infects it with a brief rhythm pulse. Infected specimens begin copying the mover's direction and speed for a moment, creating chain reactions and accidental conga lines across the ice.

- **Sorting**  
  During each wave, the archive gates highlight one desired trait each. A specimen scores if it enters a gate while its current stance matches that trait. A mismatch causes it to bounce out and crack the archive glass, costing points and increasing danger.

- **Win/Lose conditions**  
  A run lasts 60 seconds. The goal is to score as many clean archive deliveries as possible. The game ends early if the `CHAOS` meter fills from repeated mismatches or too many specimens escaping off the left side during bad wind control.

## **The Twist**
The game is built around a three-step contradiction: heat something to make it freeze into motion sooner, use that motion indirectly instead of steering, and let that motion spread like an outbreak to everything nearby. The player's best move often looks incorrect at first glance. You are not controlling where one object goes so much as staging the first impossible object and trusting the epidemic of sliding to do the rest.

## **Visual Style**
Surreal museum-science carnival rendered with pure Canvas shapes and CSS gradients. The arena should look like a cracked salt flat trapped inside a specimen drawer: pale mineral whites, freezer blues, fever oranges, and black taxonomy labels stamped over everything. The platypus-stones should read instantly as impossible fakes made real, with pebble bodies, glossy bills, tiny claws, and hairline shell seams. Motion effects should lean theatrical: heat shimmer, razor-thin ice sheen, dashed wind ribbons, and concentric dance rings that make the whole exhibit feel one bad theory away from collapse.

## **Scoring**
- Matching a specimen to the correct gate: `+100`
- Delivering a specimen after it was moved by dance fever instead of directly by its own launch: `+40 chain bonus`
- Delivering multiple infected specimens in one cold snap: combo multiplier starts at `x2`
- Swapping stance at the last moment and still landing correctly: `+25 clutch bonus`
- Wrong gate collision: `-35`
- Specimen escapes off the wrong side or chaos meter increases from repeated failures: `-50`

## **Difficulty Progression**
- Early run: only a few slow specimens appear, gate requests are simple, and infection range is forgiving so the player learns the heat-then-freeze rhythm.
- Mid run: specimens arrive in denser clusters, forcing the player to decide whether to create careful single slides or risky contagious chains.
- Later waves: more awkward stance pairs appear, wind shifts faster, and gate requests rotate sooner, so the player must flip identity at speed instead of planning leisurely.
- Final 15 seconds: cold snaps shorten, dance fever spreads farther, and escaped specimens feed the `CHAOS` meter faster, turning the board into a glorious taxonomy riot.
