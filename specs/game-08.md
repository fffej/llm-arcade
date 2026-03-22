# Shade Signal Panic

## **Title**
**Shade Signal Panic**

## **Inspiration**
1. **[How bees communicate direction](https://content.ces.ncsu.edu/honey-bee-dance-language)**  
   Honey bees encode direction as an angle relative to the sun, not as a fixed map arrow. I took that relative, time-sensitive navigation rule and made every movement input depend on a rotating sun reference instead of screen-space up/down/left/right.

2. **[The checker shadow illusion](https://persci.mit.edu/gallery/checkershadow)**  
   Adelson's illusion works because two squares that look obviously different are actually the same shade of gray. I took that perceptual betrayal and made "matching what looks different" the scoring logic of the arena.

3. **[Mantis shrimp circular polarization vision](https://www.nationalgeographic.com/science/article/mantis-shrimps-have-a-unique-way-of-seeing)**  
   Mantis shrimp can distinguish left- and right-handed circularly polarized light and may use it as a secret communication channel. I took that hidden left/right spin language and turned it into a second movement state that changes which targets are safe, open, or occupied.

## **Elevator Pitch**
You are a courier skimming across a fraudulent checkerboard observatory where nothing should be trusted. Movement is not aimed at the screen; it is encoded relative to a sun marker that keeps sliding around the arena. The tiles you need are not the ones that look alike, but the ones that secretly share the same luminance under different shadows. And before every dash, you must choose a clockwise or counterclockwise "spin" to slip through hidden polarized locks. In under 60 seconds, the game becomes a delirious rhythm of sending yourself toward the wrong-looking square for exactly the right invisible reason.

## **Core Mechanics**
- **Playfield**  
  Single-screen top-down arena made of a warped checkerboard of large square pads. A bright sun icon orbits the border, continuously redefining directional input. Several pads are under obvious fake shadows, but shadow does not change their true value.

- **Player role**  
  You control one hyperfast courier disk that ricochets from pad to pad. The courier always rests on a pad; movement happens in sharp committed dashes rather than free walking.

- **Controls**  
  `Left` / `Right` rotate your queued dash angle relative to the current sun position in `45` degree steps.  
  `Space` executes the dash along that sun-relative angle.  
  `Z` sets your courier to `LEFT-SPIN`.  
  `X` sets your courier to `RIGHT-SPIN`.  
  `Shift` triggers a short `PROOF STRIP` overlay that flattens shadows for half a second, revealing which pads are actually the same shade, but freezes combo gain while active.

- **Dash logic**  
  If the sun is at the top edge, `0` degrees means "toward the sun." If it has rotated to the right edge, that same queued angle now means "rightward." The player is constantly translating intention through a moving reference frame, exactly the way a bee dance stays meaningful only relative to the sun.

- **Same-shade pairing**  
  Pads come in hidden luminance pairs. One may look bright in the open while its partner looks dark in shadow, but they are secretly identical. Landing on one member of a pair charges it. Landing on its hidden same-shade partner next cashes the pair out for points and spawns a new pair somewhere else.

- **Polarized occupancy**  
  Every pad also carries a hidden spin state: `LEFT`, `RIGHT`, or `OPEN`. If you land with the wrong spin on a locked pad, it "rejects" you with a stun pulse and adds danger. If your spin matches, the pad accepts the landing and may grant a brief speed bonus through its secret channel.

- **Risk objects**  
  Decoy pads begin to appear that look like ideal pair targets but do not share the same true luminance. Chasing appearances wastes time and can bounce you into bad follow-up angles.

- **Win/Lose conditions**  
  The run lasts `60` seconds and is score attack. The game ends early if the `MISREAD` meter fills from too many wrong-shade matches, wrong-spin landings, or off-board dashes.

## **The Twist**
The game's core pleasure is that three different truths are operating at once and none of them line up with first instinct. You must navigate by a moving sun-relative language, score by matching pads that visibly do not match, and survive by choosing a spin channel that is not directly visible. Most arcade games ask for quick reactions to obvious information. This one asks you to become briefly fluent in a fake sensory world and act on what looks wrong.

## **Visual Style**
Graphic-op-art panic rendered entirely with Canvas and CSS. The board should feel like a science-museum illusion exploded into an arcade cabinet: hard black geometry, sickly cream highlights, heavy theatrical shadows, hot amber sunlight, and electric cyan/magenta spin glints. The courier disk should leave short curved polarization tails, and accepted landings should flash with corkscrew rings while rejected landings produce a harsh flat shock. The `PROOF STRIP` should look like a sliding band of forensic light that temporarily cancels the lie of the shadows without breaking the overall stylized look.

## **Scoring**
- Completing a correct same-shade pair: `+100`
- Completing the pair without using `PROOF STRIP`: `+50 blind confidence bonus`
- Landing on a correctly matched locked pad with the right spin: `+25 secret channel bonus`
- Chaining three or more correct pairs without a misread: combo multiplier starts at `x2`
- Wrong-shade landing on a decoy target: `-30`
- Wrong-spin landing on a locked pad: `-20` and `MISREAD` increases
- Dashing off the board: `-50`

## **Difficulty Progression**
- Opening seconds: only a few obvious pairs exist, the sun rotates slowly, and most pads are `OPEN`, so the player learns the sun-relative dash language.
- Mid run: more shadow tricks appear, same-shade pairs sit farther apart, and polarized locks begin forcing spin decisions before every jump.
- Late run: decoy pads crowd the board, the sun moves faster, and some high-value pairs require two correct spin-matched landings in a row to cash out.
- Final `15` seconds: the board becomes dense with false shadow patterns, `PROOF STRIP` cooldowns lengthen, and the orbiting sun speeds up enough that hesitation itself becomes the real hazard.
