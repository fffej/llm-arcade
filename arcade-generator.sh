#!/usr/bin/env bash
set -euo pipefail

# ============================================================================
# Weird & Wacky Arcade Generator
# Generates 10 arcade games with novel twists using OpenAI Codex CLI
# Run this in a terminal and walk away.
# ============================================================================

GAMES_DIR="games"
SPECS_DIR="specs"
NUM_GAMES=10

# Colour helpers (degrade gracefully if no tty)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

log()  { echo -e "${CYAN}[arcade]${NC} $*"; }
ok()   { echo -e "${GREEN}[  ok  ]${NC} $*"; }
warn() { echo -e "${YELLOW}[ warn ]${NC} $*"; }
fail() { echo -e "${RED}[ fail ]${NC} $*"; }

# ---------------------------------------------------------------------------
# Pre-flight checks
# ---------------------------------------------------------------------------
if ! command -v codex &>/dev/null; then
  fail "Codex CLI not found. Install with: npm install -g @openai/codex"
  exit 1
fi

if ! command -v git &>/dev/null; then
  fail "git not found."
  exit 1
fi

# ---------------------------------------------------------------------------
# Initialise the repo if needed
# ---------------------------------------------------------------------------
if [ ! -d ".git" ]; then
  log "Initialising git repo..."
  git init
  git checkout -b main 2>/dev/null || true
fi

mkdir -p "$GAMES_DIR" "$SPECS_DIR"

# ---------------------------------------------------------------------------
# Create (or reset) the index page
# ---------------------------------------------------------------------------
create_index() {
  cat > "$GAMES_DIR/index.html" <<'INDEXEOF'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Weird & Wacky Arcade</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap');
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body {
    min-height: 100vh;
    background: #0a0a0a;
    color: #fff;
    font-family: 'Press Start 2P', monospace;
    display: flex; flex-direction: column; align-items: center;
    padding: 2rem;
  }
  h1 {
    font-size: 1.8rem;
    margin-bottom: 0.5rem;
    background: linear-gradient(90deg, #ff006e, #fb5607, #ffbe0b, #3a86ff, #8338ec);
    -webkit-background-clip: text; -webkit-text-fill-color: transparent;
    animation: hue 4s linear infinite;
  }
  @keyframes hue { to { filter: hue-rotate(360deg); } }
  .subtitle { font-size: 0.6rem; color: #888; margin-bottom: 2rem; }
  .grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 1.2rem; width: 100%; max-width: 960px;
  }
  .card {
    background: #1a1a2e;
    border: 2px solid #333;
    border-radius: 8px;
    padding: 1.2rem;
    transition: all 0.2s;
    text-decoration: none; color: #fff;
    display: flex; flex-direction: column; gap: 0.6rem;
  }
  .card:hover { border-color: #fb5607; transform: translateY(-3px); box-shadow: 0 4px 20px rgba(251,86,7,0.3); }
  .card .number { font-size: 0.5rem; color: #fb5607; }
  .card .name { font-size: 0.75rem; }
  .card .desc { font-size: 0.45rem; color: #aaa; line-height: 1.6; }
  .empty { text-align: center; color: #555; font-size: 0.6rem; padding: 3rem; }
</style>
</head>
<body>
  <h1>WEIRD &amp; WACKY ARCADE</h1>
  <p class="subtitle">AI-generated games with a twist</p>
  <div class="grid" id="games">
    <!-- GAMES_PLACEHOLDER -->
  </div>
</body>
</html>
INDEXEOF
}

create_index

# ---------------------------------------------------------------------------
# Stimulus seeds — just enough entropy to stop Codex repeating itself.
# These aren't game ideas; they're random springboards for the LLM to
# bounce off in unpredictable directions via web search.
# ---------------------------------------------------------------------------
STIMULUS_A=(
  "the migration patterns of arctic terns"
  "how a theremin works"
  "the history of Peruvian textiles"
  "the rules of Kabaddi"
  "deep sea bioluminescence"
  "the Voynich manuscript"
  "competitive cheese rolling"
  "how bees communicate direction"
  "the physics of a whip crack"
  "the Dewey Decimal System"
  "fermentation in Korean cuisine"
  "the Banach-Tarski paradox"
  "Victorian mourning customs"
  "how GPS trilateration works"
  "the mating dance of the bowerbird"
  "tidal bore surfing"
  "the history of pneumatic tube mail"
  "how colour blind people see traffic lights"
  "the economics of street food in Bangkok"
  "the Mpemba effect in freezing water"
)

STIMULUS_B=(
  "today's weather forecast in Cusco, Peru"
  "what is trending on Wikipedia right now"
  "a random unsolved problem in mathematics"
  "an obscure Olympic sport that was discontinued"
  "a weird law still on the books somewhere"
  "an unusual musical instrument from Asia"
  "a counterintuitive physics demonstration"
  "a strange symbiotic relationship in nature"
  "an unusual unit of measurement"
  "a bizarre world record held by a human"
  "the most remote inhabited island on Earth"
  "an unexpected use of magnets"
  "a paradox from philosophy"
  "an animal that breaks the rules of its taxonomy"
  "a forgotten mechanical computer from history"
  "the strangest thing about non-Euclidean geometry"
  "an edible plant most people think is poisonous"
  "a ritual from an ancient civilisation"
  "something surprising about the number 37"
  "an illusion that fools even experts"
)

pick_random() {
  local -n arr=$1
  echo "${arr[RANDOM % ${#arr[@]}]}"
}

# ---------------------------------------------------------------------------
# Main loop
# ---------------------------------------------------------------------------
for i in $(seq 1 "$NUM_GAMES"); do
  GAME_NUM=$(printf "%02d" "$i")
  SEED_A=$(pick_random STIMULUS_A)
  SEED_B=$(pick_random STIMULUS_B)

  log "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  log "Game ${GAME_NUM}/${NUM_GAMES}"
  log "Stimulus A: ${SEED_A}"
  log "Stimulus B: ${SEED_B}"
  log "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

  # -----------------------------------------------------------------------
  # PHASE 1: Generate the game concept spec
  # -----------------------------------------------------------------------
  SPEC_FILE="${SPECS_DIR}/game-${GAME_NUM}.md"

  # Build a list of existing game titles so Codex avoids repeats
  EXISTING_GAMES=""
  for prev_spec in "${SPECS_DIR}"/game-*.md; do
    [ -f "$prev_spec" ] || continue
    prev_title=$(grep -m1 '^#\s' "$prev_spec" 2>/dev/null | sed 's/^#\s*//' | sed 's/\*//g' || true)
    [ -n "$prev_title" ] && EXISTING_GAMES="${EXISTING_GAMES}
- ${prev_title}"
  done

  CONCEPT_PROMPT="You are a wildly creative, slightly unhinged game designer who finds
inspiration in the most unexpected places. Your mission: invent a genuinely
novel, fun, and surprising arcade game that nobody has thought of before.

STEP 1 — FORAGE FOR INSPIRATION
Use your web search tools. You MUST actually search the web for at least
these two stimuli and read what you find:

  Stimulus A: \"${SEED_A}\"
  Stimulus B: \"${SEED_B}\"

Then search for ONE more thing of your own choosing — something completely
unrelated to either stimulus. A random Wikipedia article. The current weather
somewhere absurd. A historical event from today's date. A bizarre animal fact.
Whatever catches your eye. The weirder the better.

STEP 2 — COLLIDE AND CREATE
Take the three things you found and smash them together into a game concept.
The game should NOT be a trivial reskin of an existing classic. It should feel
like something new — a mechanic or interaction that makes people say 'wait,
what?' when they first see it.

Think about what makes each stimulus interesting and find the surprising
connection between them. Maybe the migration pattern becomes a scoring
mechanic. Maybe the weather drives difficulty. Maybe the obscure fact
becomes the core twist. Be bold.

STEP 3 — WRITE THE SPEC
Write a Markdown game design document to: ${SPEC_FILE}

Include these sections:
1. **Title** — a catchy, memorable name
2. **Inspiration** — the 3 stimuli and what you took from each (1-2 sentences each)
3. **Elevator Pitch** — one punchy paragraph selling the concept
4. **Core Mechanics** — how the game plays, controls (keyboard), win/lose conditions
5. **The Twist** — the thing that makes this game unlike anything else
6. **Visual Style** — art direction (this is a single HTML/Canvas page, no images, no audio files, no external assets)
7. **Scoring** — how points work
8. **Difficulty Progression** — how it gets harder over time

CONSTRAINTS:
- The game MUST be implementable as a single self-contained HTML file
  using Canvas and/or CSS. No external assets, no images, no audio files.
- Keep scope realistic — this needs to be fun in under 60 seconds of play.
- It must be playable with just a keyboard.
${EXISTING_GAMES:+
IMPORTANT — These games already exist in the arcade. Do NOT repeat any of these concepts:
${EXISTING_GAMES}
}"

  log "Phase 1: Generating game concept..."
  codex exec \
    --dangerously-bypass-approvals-and-sandbox \
    "$CONCEPT_PROMPT" \
    > "/tmp/arcade-concept-${GAME_NUM}.log" 2>&1 || {
      warn "Concept generation had issues for game ${GAME_NUM}, checking if spec exists..."
    }

  if [ ! -f "$SPEC_FILE" ]; then
    fail "Spec file not created for game ${GAME_NUM}. Skipping."
    continue
  fi

  ok "Spec created: ${SPEC_FILE}"

  # Extract the game title from the spec (first H1 or first line)
  GAME_TITLE=$(grep -m1 '^#\s' "$SPEC_FILE" | sed 's/^#\s*//' | sed 's/\*//g' || echo "Game ${GAME_NUM}")
  GAME_TITLE=${GAME_TITLE:-"Game ${GAME_NUM}"}

  git add "$SPEC_FILE"
  git commit -m "spec: ${GAME_TITLE} (game ${GAME_NUM})" --allow-empty || true

  # -----------------------------------------------------------------------
  # PHASE 2: Implement the game
  # -----------------------------------------------------------------------
  GAME_FILE="${GAMES_DIR}/game-${GAME_NUM}.html"

  IMPLEMENT_PROMPT="You are an expert arcade game developer. Read the game design spec
in ${SPEC_FILE} and implement it as a SINGLE, self-contained HTML file.

HARD REQUIREMENTS:
- Output a single file: ${GAME_FILE}
- Everything in ONE file — HTML, CSS, JavaScript. No external dependencies.
  No CDN links. No images. No audio files.
- Use Canvas API and/or CSS for all visuals.
- Must be playable immediately on opening the file in a browser.
- Include a title screen, gameplay, and game-over screen with score.
- Responsive — should work on desktop (keyboard) at minimum.
- Include a visible link or button at the top-left that says '← Back to Arcade'
  linking to 'index.html'.
- Keep the code clean but prioritise fun and playability.
- The game should be genuinely fun and polished — not a bare-bones demo.

Read the spec carefully. Implement ALL the mechanics described, especially the twist.
Write the complete game to: ${GAME_FILE}"

  log "Phase 2: Implementing game..."
  codex exec \
    --dangerously-bypass-approvals-and-sandbox \
    "$IMPLEMENT_PROMPT" \
    > "/tmp/arcade-impl-${GAME_NUM}.log" 2>&1 || {
      warn "Implementation had issues for game ${GAME_NUM}, checking if file exists..."
    }

  if [ ! -f "$GAME_FILE" ]; then
    fail "Game file not created for game ${GAME_NUM}. Skipping."
    continue
  fi

  ok "Game implemented: ${GAME_FILE}"

  # -----------------------------------------------------------------------
  # PHASE 3: Update the index page
  # -----------------------------------------------------------------------
  # Extract a short description from the spec (elevator pitch)
  ELEVATOR_PITCH=$(sed -n '/Elevator Pitch/,/^##\|^#/{/Elevator Pitch/d;/^##\|^#/d;p}' "$SPEC_FILE" \
    | head -5 | tr '\n' ' ' | sed 's/\*//g' | cut -c1-200)
  ELEVATOR_PITCH=${ELEVATOR_PITCH:-"A weird and wonderful arcade experiment."}

  # Build the new card HTML (escaped for sed)
  CARD_HTML="<a class=\"card\" href=\"game-${GAME_NUM}.html\">"
  CARD_HTML+="<span class=\"number\">GAME ${GAME_NUM}</span>"
  CARD_HTML+="<span class=\"name\">${GAME_TITLE}</span>"
  CARD_HTML+="<span class=\"desc\">${ELEVATOR_PITCH}</span>"
  CARD_HTML+="</a>"

  # Insert before the placeholder comment
  # Use python for reliable multi-char string replacement
  python3 -c "
import sys
index_path = '${GAMES_DIR}/index.html'
with open(index_path, 'r') as f:
    content = f.read()
card = '''    ${CARD_HTML}
'''
placeholder = '<!-- GAMES_PLACEHOLDER -->'
content = content.replace(placeholder, card + '    ' + placeholder)
with open(index_path, 'w') as f:
    f.write(content)
"

  ok "Index updated with game ${GAME_NUM}"

  git add "$GAMES_DIR" "$SPECS_DIR"
  git commit -m "game: ${GAME_TITLE} (game ${GAME_NUM})" --allow-empty || true

  ok "Game ${GAME_NUM} committed to source control"
  echo ""
done

# ---------------------------------------------------------------------------
# Final commit
# ---------------------------------------------------------------------------
git add -A
git commit -m "arcade: all ${NUM_GAMES} games generated" --allow-empty || true

log "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ok "ARCADE COMPLETE! ${NUM_GAMES} games generated."
log "Open ${GAMES_DIR}/index.html in a browser to play."
log "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"