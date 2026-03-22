# Weird & Wacky Arcade

This directory contains a small Bash-driven pipeline that uses the OpenAI Codex CLI to generate a ten-game browser arcade.

Each run:

- invents ten game concepts from random stimulus prompts
- writes a Markdown spec for each game in `specs/`
- implements each game as a single self-contained HTML file in `games/`
- updates `games/index.html` so the whole arcade is playable from one page
- commits progress to git as it goes

## Repository Layout

- `arcade-generator.sh`: the generator script
- `specs/`: generated game design docs
- `games/`: generated HTML games and the arcade index

## Requirements

- Bash
- `git`
- `python3`
- OpenAI Codex CLI available as `codex`

The script checks for `codex` and `git` before it starts. If `codex` is missing, it suggests:

```bash
npm install -g @openai/codex
```

You will also need Codex configured with whatever credentials and permissions your local setup requires.

## Running The Generator

From this directory:

```bash
./arcade-generator.sh
```

The script will:

1. create `games/` and `specs/` if needed
2. reset `games/index.html`
3. generate ten specs
4. implement ten HTML games
5. update the arcade index after each game
6. make git commits during the run and a final summary commit at the end

## Playing The Arcade

Open [games/index.html](/home/fffej/code/llm-arcade/games/index.html) in a browser.

Each generated game is a single HTML file with inline CSS and JavaScript. The intended play style is keyboard-first desktop play.

## Notes

- The generator is intentionally stochastic. It picks random stimulus prompts, so rerunning it will produce different results.
- The prompts instruct Codex to use web search during concept generation.
- Generated output is committed incrementally, so a run leaves a readable history of specs and implementations.
- Re-running the script in the same repository will overwrite `games/index.html` and add or replace generated content in `games/` and `specs/`.
