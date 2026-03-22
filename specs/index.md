---
layout: default
title: Game Specs
description: Rendered design documents for the Weird & Wacky Arcade games.
---

## Design Specs

Each page below is a rendered version of the generated Markdown spec for one arcade game.

<div class="spec-grid">
{% assign spec_pages = site.pages | where_exp: "p", "p.path contains 'specs/game-'" | sort: "path" %}
{% for spec in spec_pages %}
  <a href="{{ spec.url | relative_url }}">
    <span class="eyebrow">{{ spec.path | split: '/' | last | split: '.' | first | upcase }}</span>
    <strong>{{ spec.title }}</strong>
    Open the formatted design document.
  </a>
{% endfor %}
</div>

