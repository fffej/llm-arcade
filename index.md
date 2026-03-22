---
layout: default
title: Home
description: Play the generated arcade and read the design specs on GitHub Pages.
---

<section class="hero">
  <span class="eyebrow">GitHub Pages Ready</span>
  <h1>Weird &amp; Wacky Arcade</h1>
  <p>
    This site publishes the generated arcade as static HTML and the source game specs as rendered Markdown.
    Play the games in the arcade, or browse the design docs behind each one.
  </p>
  <div class="button-row">
    <a class="button button-primary" href="{{ '/games/' | relative_url }}">Play The Arcade</a>
    <a class="button button-secondary" href="{{ '/specs/' | relative_url }}">Read The Specs</a>
  </div>
</section>

<section class="panel">
  <h2>What’s Here</h2>
  <div class="stats">
    <div class="stat">
      <strong>10</strong>
      browser-playable arcade games
    </div>
    <div class="stat">
      <strong>10</strong>
      rendered design specs
    </div>
    <div class="stat">
      <strong>1</strong>
      static site suitable for GitHub Pages
    </div>
  </div>
</section>

<section class="panel">
  <h2>Jump In</h2>
  <div class="spec-grid">
    <a href="{{ '/games/' | relative_url }}">
      <span class="eyebrow">Arcade</span>
      <strong>Play from the game hub</strong>
      Launch the existing HTML arcade index and move between games from there.
    </a>
    <a href="{{ '/specs/' | relative_url }}">
      <span class="eyebrow">Specs</span>
      <strong>Browse the design documents</strong>
      Read the underlying Markdown docs as formatted web pages instead of raw source.
    </a>
  </div>
</section>

