---
layout: default
title: Pole to Sole
description: Game 04 design spec for Pole to Sole.
---

# Pole to Sole

## **Title**
**Pole to Sole**

## **Inspiration**
1. **[Arctic tern migration patterns](https://arcticcentre.org/en/arctic-region/arctic-birds/record-migration/)**  
   Arctic terns do absurd globe-spanning pole-to-pole journeys, with measured routes reaching about 96,000 kilometers in a year. I took the feeling of a huge looping commute and made every valuable target something that wants to complete a long return path instead of a short direct hop.

2. **[Washington's ban on shoe-fitting X-rays](https://lawfilestestext.leg.wa.gov/LawTest/RCWPDF/RCW%20%2070A%20TITLE/RCW%20%2070A.388%20%20CHAPTER/RCW%20%2070A.388%20.190.pdf)**  
   It is still explicitly prohibited to use fluoroscopic X-rays to fit shoes or view the bones in feet. I took that deliciously specific legal nonsense and turned it into the player's forbidden information tool: the only way to see the invisible shoe-gates that matter is to briefly commit a scan violation.

3. **[Mantis shrimp strike mechanics](https://www.nationalgeographic.com/science/article/the-mantis-shrimp-has-the-worlds-fastest-punch)**  
   Mantis shrimp strikes work by storing energy, latching it, then releasing it in a violent snap. I took the delayed spring-loaded release as the core interaction, so the player is always setting up a route correction a beat before it actually happens.

## **Elevator Pitch**
You run a deeply illegal migratory refitting kiosk suspended between the Arctic and Antarctic. Neon flocks of arctic terns stream across the screen on elegant wind arcs, each trying to complete a return journey through invisible shoe-shaped checkpoints. You cannot steer the birds directly. Instead, you tap a forbidden shoe fluoroscope to reveal the hidden gates for a second, then plant spring-loaded shock snaps that fire a moment later and kick whole flocks onto new curves. In 60 seconds, the game becomes a frantic act of predictive bird shoe-fitting: glimpse the future, refit the route, and keep the migration loop alive.

## **Core Mechanics**
- **Playfield**  
  Single-screen vertical arena. The top edge is `ARCTIC`, the bottom edge is `ANTARCTIC`, and the center is a shifting belt of cloud-winds. Invisible shoe outlines drift sideways through the middle third of the screen as moving checkpoints.

- **Player role**  
  You control a floating reticle, not a character. The reticle places route-changing snaps and triggers scans.

- **Controls**  
  `Arrow keys` or `WASD` move the reticle.  
  `Space` hold to charge a spring snap, release to plant it. After a short delay, it detonates in a circular burst that knocks nearby flocks into neighboring wind curves.  
  `X` activates the forbidden fluoroscope for one second, revealing invisible shoe gates and the hidden "size band" of each flock.  
  `Z` toggles the planted snap polarity between `INSTEP` and `HEEL`, which changes whether the burst bends a flock inward or outward on its arc.

- **Flocks**  
  Small tern groups continuously enter from the top or bottom and travel on smooth curved routes. Every flock has a hidden size band: `NARROW`, `MID`, or `WIDE`. A flock scores only if it passes through a matching shoe gate on the way south, reverses at the opposite pole, and then passes another matching gate on the return leg.

- **Route refitting**  
  A planted snap does nothing immediately. It flashes, charges for a fraction of a second, then fires. Timing matters because the player must place the burst where the flock will be, not where it is now. `INSTEP` snaps pull a route tighter toward the centerline. `HEEL` snaps flare it wider toward the screen edges.

- **Forbidden scanning**  
  Shoe gates are invisible unless the fluoroscope is active. During the scan, each flock briefly shows a skeletal outline and a matching size icon. Scanning fills a visible `CITATION` meter. If the meter maxes out, regulators shut the kiosk down and the run ends early.

- **Migration loop**  
  A flock that successfully fits a gate gets stamped and brightens in color. Reaching the opposite pole flips its direction for the return trip. Completing both legs cashes the flock out for full points and spawns a new faster flock.

- **Win/Lose conditions**  
  The session lasts 60 seconds and is score attack. The run ends early if the `CITATION` meter fills or if too many unstamped flocks leave the wrong edge, causing a `FLYWAY COLLAPSE`.

## **The Twist**
The game is about illegal foresight and delayed geometry. You do not react to where the targets are. You briefly expose the hidden checkpoint layout with a risky scan, then commit to a spring-loaded route change that goes off later, while the birds are already moving on long migratory curves. The central pleasure is prediction under self-inflicted blindness: the level's most important objects only exist while you are breaking the rule that can end your run.

## **Visual Style**
Luminous aviation-cartography fever dream in pure Canvas and CSS. The poles should glow like cold runway lights, while the middle sky is full of thin map lines, compass ticks, and drifting shoe-outline ghosts that only appear under sickly green X-ray light. Tern flocks should read as tiny white shards with trailing ribbon paths, and every planted snap should look like a loaded spring diagram about to become weather. The whole page should feel like an airline safety poster designed by a criminal podiatrist.

## **Scoring**
- Completing a full pole-to-pole return migration with a correctly fitted flock: `+150`
- Passing a correct shoe gate on the outbound leg: `+40`
- Passing a correct shoe gate on the return leg: `+60`
- Refitting multiple flocks with one snap detonation: combo multiplier starts at `x2`
- Finishing a full migration without using the fluoroscope during that flock's return leg: `+30 blind trust bonus`
- Wrong gate fit or missing a reversal setup: `-35`
- Flock exiting the arena unstamped: `-50`
- Forced shutdown from the `CITATION` meter: run ends immediately

## **Difficulty Progression**
- Early seconds: slow flocks, large gate outlines, and generous scan windows teach the player to read arc timing and delayed snap placement.
- Mid run: mixed flock sizes overlap, gates drift faster, and opposite-direction traffic creates route-crossing problems instead of simple interceptions.
- Late run: cloud-wind lanes wobble, making planted snaps slightly harder to forecast, and some gates only remain visible for a split second after the scan ends as fading afterimages.
- Final 15 seconds: the `CITATION` meter rises faster, flocks reverse almost instantly at the poles, and dense migration traffic turns the screen into a panicked choreography of illegal glimpses and pre-committed bursts.
