# Waggle Switchback

## **Title**
**Waggle Switchback**

## **Inspiration**
1. **Honey bee waggle dance direction**  
   Honey bees encode food direction as an angle relative to the sun, not as a fixed compass arrow. I took the idea that a direction can stay "correct" even while the world rotates underneath it, and turned that into a control scheme where commands are always relative to a moving sun marker.

2. **The double cone that appears to roll uphill**  
   In the classic V-rail demo, the object looks like it climbs, but its center of mass is really dropping. I used that deliciously wrong-looking motion as the arena rule: the same lane behaves differently depending on where a bee's weight hangs, so a loaded return trip can visibly go "uphill."

3. **Lyrebirds mimicking an entire alarmed flock**  
   Lyrebirds can convincingly imitate a whole mobbing flock and manipulate other animals with counterfeit urgency. I took that as the sabotage system: perched mimics steal and replay your previous signal, creating fake broadcasts that can ruin a route or become the exact delayed reroute you wanted.

## **Elevator Pitch**
You are the frantic traffic choreographer of a cliffside hive built on impossible rails. Foragers do not respond to left and right in screen space; they respond to waggle commands relative to a slowly orbiting sun. Empty bees and nectar-heavy bees read the same V-shaped lanes in opposite ways, so returns can appear to climb the mountain. Meanwhile, sinister mimic birds keep replaying your last command like a stolen alarm, which means the best move is often to issue a knowingly wrong order now so its echoed version becomes right one second later.

## **Core Mechanics**
- **Playfield**  
  Single-screen arena: a central hive hub connected to six branching V-rails that spread toward flower mouths on the rim. A bright sun icon rotates around the border, continuously redefining what counts as "toward the sun."

- **Player role**  
  You do not move a character. You conduct traffic from the hive by broadcasting waggle signals.

- **Controls**  
  `Left` / `Right` rotate the planned waggle angle in `45` degree steps relative to the current sun position.  
  `Up` toggles the signal to `SHORT` range, targeting the inner flower ring.  
  `Down` toggles the signal to `LONG` range, targeting the outer flower ring.  
  `Space` broadcasts the current waggle signal, launching any idle foragers from the hub.  
  `Shift` performs a one-second `HUSH`, preventing mimic birds from replaying stolen signals during that window, but briefly disabling score multipliers.

- **Bee states**  
  Foragers are either `EMPTY` or `LOADED`. Empty bees outbound to flowers ride the rails according to their light body position. Loaded bees carry a dangling nectar sac that shifts their effective center of mass, making several rails behave in the visually "wrong" direction on the way home.

- **Relative-direction navigation**  
  Signals are never absolute. If the sun rotates, the meaning of the same waggle angle changes. The player is constantly reading where the sun will be when the bees actually reach a decision point, not just where it is at the instant of input.

- **Switchback rails**  
  Each V-rail widens as it rises. Empty bees tend to drift toward the visually lower, narrower end. Loaded bees tend to drift toward the visually higher, wider end, producing the apparent uphill return effect. The same branch can therefore be safe outbound and bizarre inbound.

- **Mimic interference**  
  Perched black bird silhouettes on the rim record your last successful waggle. After a short delay, one of them replays it as a fake alarm pulse. Any bee crossing that bird's listening cone immediately reorients to the stolen command. This can scatter a wave or be used intentionally to bend loaded bees onto profitable return rails.

- **Objective**  
  Launch bees to blooming flowers, let them load up, and route them back into the hive before the `CONFUSION` meter fills. The run lasts `60` seconds and is pure score attack.

- **Win/Lose conditions**  
  Score as much nectar as possible before time expires. The run ends early if the `CONFUSION` meter maxes out from too many bees being lost off the rim, intercepted by mimic birds, or sent into dead-end rails.

## **The Twist**
The game is built on delayed correctness. You are often supposed to send the wrong command on purpose, because a mimic will steal it and replay it later, after the sun has rotated and after the bees have changed from empty to loaded. A signal that was wrong for the outbound trip can become perfect for the return trip specifically because the arena's geometry and reference frame both changed. The player is not mastering a route; they are mastering when a lie becomes true.

## **Visual Style**
Graphic, theatrical, and slightly feverish. The hive mountain should look like a science-museum prop crossed with a ritual diagram: honey ambers, pollen golds, chalk-white rail lines, and deep volcanic browns. Bees are clean geometric sprites with exaggerated hanging nectar bulbs. Mimic birds are flat black cutout shapes with concentric fake-sound rings. The sun should be a bold rotating icon with long tick marks, making the entire page feel like a navigational instrument that has become emotionally unstable. Everything should be achievable with Canvas primitives, gradients, line patterns, and CSS framing.

## **Scoring**
- Returning a loaded bee to the hive: `+100`
- Returning a bee via an apparent uphill rail: `+40 switchback bonus`
- Having a mimic replay reroute a loaded bee into the correct hive lane: `+75 counterfeit bonus`
- Banking three or more loaded bees within one sun quadrant: combo multiplier starts at `x2`
- Using `HUSH`: no penalty, but combo multipliers are disabled for one second
- Bee lost off the rim: `-50`
- Bee trapped in a dead-end rail or captured by a mimic pulse: `-35` and `CONFUSION` rises

## **Difficulty Progression**
- Opening seconds: only a few bees launch at once, the sun rotates slowly, and there is just one mimic bird, so the player learns the relative-angle language.
- Mid run: more flowers bloom simultaneously on different rings, forcing mixed `SHORT` and `LONG` routing instead of one obvious line.
- Later waves: additional mimic birds appear and replay signals sooner, so accidental sabotage becomes common unless the player starts planning around stolen commands.
- Final `15` seconds: the sun rotates faster, loaded bees move quicker on uphill-looking rails, and bloom positions start hopping between rings, turning the screen into a controlled directional fraud.
