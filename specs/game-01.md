---
layout: default
title: Handle With Suspicion
description: Game 01 design spec for Handle With Suspicion.
---

# Handle With Suspicion

## **Title**
**Handle With Suspicion**

## **Inspiration**
1. **The Mpemba effect in freezing water**  
   Hot water can, under some conditions, freeze faster than colder water. I took the key emotional idea, "the obviously wrong temperature choice is sometimes the right one," and made it the heart of play.

2. **The Salmon Act 1986's ban on handling fish in suspicious circumstances**  
   The law is real, and its phrasing feels like a game rule from a dream. I took the idea that touching the wrong fish the wrong way is itself the crime, and built a game where direct handling is the one thing you must avoid.

3. **Mantis shrimp cavitation punches**  
   Mantis shrimp strike so fast they create cavitation bubbles that collapse with extra force and heat. I took the idea of a hit that is not just impact, but delayed pressure chaos, and turned it into the player's main tool.

## **Elevator Pitch**
You are a mantis-shrimp customs inspector at a midnight fish dock where salmon are pouring in too fast to touch safely. Some fish are legal, some are "suspicious," and the only reliable way to secure contraband is to superheat it, then detonate a cavitation pulse so it flash-freezes into evidence before it escapes into the black-market chute. It is a 60-second arcade sort-and-trap game where the best freezing move looks completely backwards.

## **Core Mechanics**
- **Playfield**  
  Single-screen top-down dock. Conveyor lanes feed salmon in from three piers toward exits labeled `MARKET`, `EVIDENCE`, and `SMUGGLER`.

- **Player role**  
  You control a hyperactive mantis-shrimp inspector.

- **Controls**  
  `WASD` or arrow keys to move.  
  `Space` to perform a cavitation punch: a short-range radial blast that knocks nearby fish, briefly heats the air, and then creates a delayed freezing pulse a moment later.  
  `Shift` to toggle the central dock field between `HEAT` mode and `CHILL` mode.  
  `Enter` to activate an inspection lamp that reveals which nearby fish are suspicious for one second.

- **Fish flow**  
  Salmon slide, flop, and bounce around conveyor currents. Each fish has hidden status: `legal` or `suspicious`. Suspicious fish show subtle tells even before scanning, like erratic pathing, counterfeit stamps, or unnatural escort patterns.

- **Temperature state**  
  Every fish has a visible temperature band: `cold`, `cool`, `warm`, `hot`, `superheated`. Suspicious fish are easiest to secure when frozen into evidence blocks.

- **Mpemba rule**  
  Fish in the `superheated` band that are struck by the delayed cavitation freeze pulse jump directly to `frozen`. Fish in merely `warm` or `cool` states become slush instead, which blocks lanes and wastes time. The correct move is often to heat contraband further before freezing it.

- **Handling law**  
  Touching a suspicious fish directly is illegal. If your sprite physically contacts an unrevealed suspicious fish, the global `SUSPICION` meter spikes. Fill that meter and your run ends in instant dock shutdown.

- **Sorting**  
  Frozen suspicious fish must be knocked into the `EVIDENCE` chute. Legal fish should be guided safely to `MARKET`. If a suspicious fish reaches `MARKET` or `SMUGGLER`, you lose valuable control of the run.

- **Win/Lose conditions**  
  The session lasts 60 seconds. You want the highest score possible before time runs out. The game ends early if the global `SUSPICION` meter maxes out from illegal direct handling.

## **The Twist**
The game's core skill is intentionally creating the exact wrong thermal state so that a delayed pressure event can make it right. You do not grab contraband. You stage it. You overheat a fish so the next cavitation collapse flash-freezes it into a legal evidence brick, then bank that brick off walls and currents into the correct chute. The player is constantly thinking one beat ahead because the punch has two phases: shove now, freeze later.

## **Visual Style**
Surreal fish-market noir rendered with pure Canvas shapes and CSS. Wet asphalt blacks, customs-lamp yellows, emergency reds, and impossible freezer cyan. Salmon should look sleek and slightly absurd, with stamped tags, steam trails, and frost crusts. Temperature is shown through gradients, vapor curls, ice halos, and twitch speed. The cavitation punch should look like concentric transparent rings with a split-second bright void in the center, as if the dock air itself got punched hard enough to crack.

## **Scoring**
- Securing a suspicious fish in `EVIDENCE`: `+100`
- Sending a legal fish safely to `MARKET`: `+40`
- Freezing multiple suspicious fish with one cavitation pulse: combo multiplier starts at `x2`
- Revealing a fish with the inspection lamp before securing it: `+20 clean case bonus`
- Slush clog caused by bad temperature timing: `-30`
- Suspicious fish escaping to `MARKET` or `SMUGGLER`: `-75`

## **Difficulty Progression**
- Early seconds: slow fish, obvious suspicious tells, and wide lanes so the player learns the heat-then-freeze rhythm.
- Mid run: more simultaneous fish, crossing currents, and decoy legal fish mixed into every wave.
- Late run: suspicious salmon arrive in linked schools, so punching one can knock another into danger or safety.
- Final 15 seconds: lane directions pulse, fish speeds spike, and the dock field auto-switches between `HEAT` and `CHILL` faster, forcing snap judgments under chaos.
