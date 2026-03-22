# Night Raft Raid

## **Title**
**Night Raft Raid**

## **Inspiration**
1. **Kabaddi rules**  
   Kabaddi's core tension is the raid: cross into danger, make contact, and get back home before the clock or defenders trap you. I took the one-breath commit-and-return rhythm and made every scoring run a deliberate incursion that must end with a safe retreat.

2. **The Argei ritual from ancient Rome**  
   In the Argei rites, human-shaped figures made from rush, reed, and straw were carried in procession and thrown from the Pons Sublicius into the Tiber as a ritual purification. I took the idea of collecting symbolic bodies that absorb corruption, then casting them into water as the scoring act.

3. **Noctiluca sea sparkle**  
   Noctiluca plankton flash when water is mechanically disturbed, turning agitation itself into light. I took that literally: the arena is mostly unreadable until the player thrashes through it, creating brief glowing maps with their own movement.

## **Elevator Pitch**
You are the keeper of a midnight reed-bridge over a black river full of living sea sparkle. In each 60-second run, you dash off your shrine, snatch haunted straw effigies drifting in the dark, drag them through corrupted water so they absorb enough filth to matter, then sprint back and hurl them into the river before your raid timer expires. The catch is that the river can only be seen where you have just disturbed it, so every escape route is something you draw yourself, in real time, with panic.

## **Core Mechanics**
- **Playfield**  
  Single-screen top-down arena. The left edge is the player's shrine bank. The center and right side are dark river channels with drifting effigies, hidden whirlpools, and narrow bridge planks.

- **Controls**  
  `WASD` or arrow keys to move.  
  `Space` begins a raid if you are on the shrine bank, and throws all carried effigies if you are back on the bank during an active raid.  
  `Shift` performs a short dash that agitates a wide splash, revealing more of the river for a moment but consuming extra raid time.

- **Raid loop**  
  Press `Space` on the bank to start a raid. A visible raid timer begins counting down. While raiding, you must leave the bank, touch drifting effigies to tether them behind you, and return to the bank before the timer hits zero.

- **Effigies**  
  Each effigy starts pale and worthless. Dragging it through invisible corruption patches stains it darker and fills its `PURGE` meter. A fuller effigy is worth more when thrown back into the river, but it also swings more heavily and snags on corners.

- **Visibility**  
  The river is almost black by default. Movement, dashing, collisions, and trailing effigies trigger short-lived bioluminescent flashes that reveal currents, hazards, corruption patches, and enemies in expanding ripples. If you stop moving, the map disappears again.

- **Hazards and opposition**  
  River wardens patrol the dark and move toward fresh flashes, not toward the player directly. Whirlpools, broken planks, and pollution slicks are only visible when lit. If a warden grabs your chain of effigies, the rearmost one snaps free and is lost.

- **Win/Lose conditions**  
  The run lasts 60 seconds and is score attack only. A raid fails if the timer expires before you return to the bank, causing you to drop all carried effigies and take a score penalty. The game does not hard-fail unless three raids collapse in a row, which ends the run early in ritual disgrace.

## **The Twist**
The player does not learn the level once and then execute. They manufacture visibility by moving, and that visibility is what attracts danger. The optimal run is a paradox: make as much noise in the water as possible so you can see the safe route, but not so much that you summon wardens onto that exact route. The map is not hidden behind fog of war. The map is your wake.

## **Visual Style**
Ancient-night-river surrealism in pure Canvas: matte obsidian water, bone-white bridge planks, sickly green corruption stains, and violent electric-blue bioluminescent ripples. Effigies should look handmade and uncanny, with reed limbs and knot-bound joints that trail behind the player like wet ceremonial kites. The whole screen should feel like a sacred procession happening inside a storm drain dream.

## **Scoring**
- Throwing a cleansed effigy with minimal `PURGE`: `+50`
- Throwing a heavily saturated effigy: up to `+200`
- Returning with multiple effigies in one raid: combo multiplier starts at `x2`
- Throwing effigies within one second of arriving back on the bank: `+25 quick-cast bonus`
- Lost effigy to a warden or timeout: `-40`
- Failed raid: `-100`

## **Difficulty Progression**
- Early seconds: wide corruption patches, slow wardens, and long-lived glow trails let the player learn that motion is both vision and risk.
- Mid run: effigies spawn deeper in the river, corruption appears in thinner streaks, and wardens begin reacting faster to repeated splashes in the same area.
- Late run: bridge sections crack and force detours, some effigies are oversized and harder to drag, and whirlpools drift instead of staying fixed.
- Final 15 seconds: the river becomes rougher, so every movement creates brighter flashes that reveal more space but pull wardens from farther away, turning each last raid into a glorious self-betrayal.
