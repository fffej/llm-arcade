# Split Decision Playa

## **Title**
**Split Decision Playa**

## **Inspiration**
1. **[The Banach-Tarski paradox](https://www.britannica.com/science/Banach-Tarski-paradox)**  
   The part I stole is the impossible act itself: one thing can be cut apart and reassembled into two full things. I turned that into a game rule where a stalled stone can be decomposed into two equally real scoring pieces without shrinking.

2. **[Buridan's ass](https://plato.stanford.edu/entries/buridan/)**  
   What matters here is fatal symmetry: when two options are perfectly equal, rational choice locks up. I used that deadlock as the trigger state for play, so the player is rewarded for manufacturing moments where an object cannot decide where to go.

3. **[Death Valley's sailing stones](https://sos.noaa.gov/education/phenomenon-based-learning/sailing-stones/)**  
   I took the eerie feeling of heavy rocks gliding only during rare, specific weather windows and leaving tracks behind them. That became the movement model: stones mostly wait, then suddenly skate across a temporary slick surface and carve visible history into the arena.

## **Elevator Pitch**
You are the illegal weather-judge of a haunted salt flat where indecisive stones can be split into twins. Each round, boulders sit between identical mirage shrines and refuse to choose. Your job is to arrange perfect balance, invoke a paradox cut, and then trigger a brief melt-and-wind event so the duplicate stones sail away on diverging tracks. It is a 60-second arcade score attack about creating hesitation on purpose and then cashing that hesitation out as impossible motion.

## **Core Mechanics**
- **Playfield**  
  Single-screen top-down playa. Stones spawn near the center. Mirage shrines drift slowly around the edges in mirrored pairs such as `LEFT / RIGHT` or `NORTH / SOUTH`.

- **Player role**  
  You control a floating "reason cursor" that places influence, not a character.

- **Controls**  
  `Arrow keys` move the cursor.  
  `Z` drops or removes a blue `REASON` beacon.  
  `X` drops or removes a red `REASON` beacon.  
  `Space` performs a `PARADOX CUT` on the currently highlighted stalled stone.  
  `Shift` triggers a short `THAW WIND` event that creates the slick surface and pushes all active stones in the direction of the stronger nearby beacon.

- **Decision field**  
  Every stone constantly compares pull from the nearest blue beacon and nearest red beacon. If one side is stronger, the stone slowly "leans" that way. If the pulls are exactly balanced, the stone becomes `UNDECIDED` and locks in place, vibrating visibly.

- **Paradox cut**  
  Pressing `Space` on an `UNDECIDED` stone splits it into two full-value twins, one committed to blue and one committed to red. Both inherit the same position, then separate only when the next `THAW WIND` happens.

- **Sailing movement**  
  Stones do not travel freely all the time. They only slide during `THAW WIND`, when a thin reflective film appears on the playa. During that short window, stones glide fast, drift slightly, and leave long etched trails behind them.

- **Trail interaction**  
  Fresh trails are slippery for a few seconds. Later stones that cross them get a speed boost and subtly snap to the trail angle, letting the player build rail-like route networks out of previous indecisions.

- **Objective**  
  Guide duplicated stones into matching edge shrines before the 60-second run ends. A blue-committed twin must enter a blue shrine, and a red-committed twin must enter a red shrine.

- **Win/Lose conditions**  
  The run is score attack for 60 seconds. The game ends early if the playa's `PARADOX LOAD` meter fills from too many unsorted duplicates colliding, re-merging, or drifting offscreen.

## **The Twist**
The core pleasure is that indecision is not a failure state. It is the raw material. You first engineer a perfect tie so a stone refuses to move, then you cut that stalemate into two complete stones, then you wait for a tiny weather window to make both of them skate away on different futures. The player is effectively farming hesitation and spending it as motion.

## **Visual Style**
Minimalist desert occultism in pure Canvas and CSS. The playa is a pale cracked oval on a black void, with mirror-clean thaw films, neon shrine halos, and stone trails scratched like calligraphy into wet salt. Stones should feel heavy but faintly nervous, shivering when undecided and then gliding with impossible grace once the wind hits. The whole screen should look like a mathematical proof performed as desert weather.

## **Scoring**
- Sending one twin into its matching shrine: `+80`
- Sending both twins from the same paradox cut into different correct shrines: `+220 total pair bonus`
- Routing a stone along an older trail before scoring: `+30`
- Scoring three or more stones during one `THAW WIND`: combo multiplier starts at `x2`
- Stone enters the wrong shrine: `-40`
- Twin pair collides hard enough to re-merge into a dead stone: `-60`
- Stone drifts off the playa edge: `-75`

## **Difficulty Progression**
- Early seconds: only one or two stones spawn at a time, shrine pairs are far apart, and balance windows are generous so the player learns how to create `UNDECIDED` states on purpose.
- Mid run: shrine pairs drift more aggressively, forcing more precise beacon placement and making trail reuse more valuable than raw splitting.
- Late run: neutral obstacle stones appear and can block or deflect twins during `THAW WIND`, increasing collision risk and making the `PARADOX LOAD` meter harder to manage.
- Final 15 seconds: thaw windows become shorter but stronger, so stones travel farther per gust, the screen fills with crossing trail-lines, and every new split feels like either genius or self-inflicted disaster.
