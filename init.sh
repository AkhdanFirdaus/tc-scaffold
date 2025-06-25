#!/bin/bash

# Define repositories and target directories
REPOS=(
  "https://github.com/AkhdanFirdaus/traversal-socket-sample.git"
  "https://gitlab.com/mutagen/mutagen.git"
  "https://github.com/DwiHandoyo/mutant-killer-alpha-2.git"
  "https://github.com/AkhdanFirdaus/traversal-services.git"
)

DIRS=(
  "server"
  "csrf-engine"
  "lfi-engine"
  "traversal-engine"
)

# Loop through repos and perform actions
for i in "${!REPOS[@]}"; do
  git clone "${REPOS[$i]}" "${DIRS[$i]}"
done

if [[ -f .env.example ]]; then
  cp .env.example .env
  echo "✅ Copied .env.example to .env"
else
  echo "⚠️  No .env.example found in"
fi

