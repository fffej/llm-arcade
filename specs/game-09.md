# Heterodyne Drift

## **Title**
**Heterodyne Drift**

## **Inspiration**
1. **[How a theremin works](https://electronics.howstuffworks.com/gadgets/audio-music/theremin.htm)**  
   A theremin creates pitch and volume by sensing hand distance from two antennas instead of by physical contact. I took the idea of "playing empty space" and turned it into a control scheme where the player tunes invisible fields rather than directly pushing the game piece.

2. **[Roque at the 1904 Summer Olympics](https://en.wikipedia.org/wiki/Roque_at_the_1904_Summer_Olympics)**  
   Roque was a once-Olympic cousin of croquet played on a hard court with low banks, angles, and wickets, and it only appeared in 1904. I took its bank-shot geometry and gate-clearing objective, but removed the mallet entirely so the sport becomes an eerie act of remote guidance.

3. **[Death Valley sailing stones](https://sos.noaa.gov/education/phenomenon-based-learning/sailing-stones/)**  
   Sailing stones seem to move on their own, leaving tracks when rare combinations of rain, ice, and wind let them glide across the playa. I took that stop-start, self-propelled feeling and made movement happen in short thaw windows where the stone suddenly skates under previously tuned conditions.

## **Elevator Pitch**
You are not hitting a ball. You are tuning a haunted little weather instrument and hoping the court obeys. In `Heterodyne Drift`, a single stone sits on a boxed roque court full of wickets, banks, and slick melt patches. You spend a second adjusting two invisible theremin-like fields, then a thaw pulse hits and the stone glides on its own, carving a trail through the mud-ice and banking off walls toward the next wicket. The thrill is in learning to "play" motion indirectly: part trick-shot sport, part unstable instrument, part desert geology seance.

## **Core Mechanics**
- **Goal**  
  Score as many wickets as possible in `60` seconds by sending the drifting stone through numbered gates in sequence.

- **Playfield**  
  Single-screen top-down roque court with short rebound walls, several wickets, melt patches, dry rough patches, and the persistent trail lines left by previous drifts.

- **Player action loop**  
  The game alternates between `TUNE` and `THAW`.  
  During `TUNE`, the stone is frozen and the player sets two values.  
  During `THAW`, the stone moves on its own for a brief burst according to those values and the terrain it touches.

- **Controls**  
  `A` / `D`: move the `PITCH FIELD` lower or higher, which sets drift angle.  
  `J` / `L`: move the `VOLUME FIELD` lower or higher, which sets drift strength.  
  `Space`: trigger the thaw pulse early once you like the current tuning.  
  `R`: damp the fields back toward center for a safer reset.  
  `Shift`: apply a short `VIBRATO`, causing the stone to wobble slightly while drifting for fine curve corrections.

- **Theremin-style tuning behavior**  
  The field meters are intentionally nonlinear. Near the center, changes are broad and forgiving; near the extremes, tiny taps create dramatic angle or speed shifts. The player is effectively "hovering" in a dangerous invisible control zone with the keyboard.

- **Drift behavior**  
  When thaw begins, the stone slides without further direct steering. It can bank off walls, skim through wickets, and cross old trails. Melt patches reduce friction and extend the glide. Dry rough patches kill momentum quickly.

- **Trail behavior**  
  Every drift leaves a visible scrape line. Crossing an old line on a later drift gives the stone a slight tendency to follow it, like a groove in the playa. Skilled play turns old mistakes into reusable infrastructure.

- **Win/Lose conditions**  
  The run is always `60` seconds. You lose tempo, not lives, but the run ends immediately if the `CRACK` meter fills from repeated hard wall slams or missed thaws. Final score is whatever you earned before time expires.

## **The Twist**
The novelty is that this is a precision trick-shot game where the shot is never a direct hit. You do not aim a cue, pull back a slingshot, or control the stone frame by frame. You tune an invisible instrument, then watch a rock "decide" how to move during a tiny weather event. The court gradually fills with your old tracks, so the game becomes about composing future motion out of leftover history. The fastest route to the next wicket might literally be a groove you carved ten seconds ago.

## **Visual Style**
Harsh occult-sports minimalism. The court should look like a 1920s lawn game diagram trapped inside a desert science experiment: chalk-white wickets, dusty clay reds, pale frozen blues, and thin electric field lines humming at the screen edges. During `TUNE`, the pitch and volume fields should shimmer as translucent contour bands around the stone. During `THAW`, the stone should scrape a bright line into the mud while tiny ice panes flash and break under it. Everything should feel crisp, geometric, and slightly wrong, like a gentleman's sport being operated by weather ghosts.

## **Scoring**
- Passing cleanly through the next correct wicket: `+100`
- Banking off a wall and then clearing the wicket in the same thaw: `+50 stylish bank bonus`
- Crossing one of your own previous trails and still clearing the wicket: `+30 groove bonus`
- Clearing two wickets in one thaw burst: `+150 chain bonus`
- Using `VIBRATO` to curve through a wicket opening: `+20 flourish bonus`
- Hitting a wrong wicket out of order: `-40`
- Slamming a wall hard enough to raise `CRACK`: `-15`
- Ending a thaw without touching any useful object: `-10 drift waste`

## **Difficulty Progression**
- Opening phase: wide wickets, gentle field sensitivity, and generous melt patches teach the tune-then-drift rhythm.
- Mid run: wicket order becomes less linear, bank shots matter more, and rough patches start breaking up obvious straight routes.
- Late run: the field meters become more twitchy near the edges, moving frost zones alter how far the stone carries, and useful old trails become essential for efficient clears.
- Final `15` seconds: wickets shrink, some appear near dangerous corners, and thaw windows shorten enough that confident tuning matters more than cautious adjustment.
