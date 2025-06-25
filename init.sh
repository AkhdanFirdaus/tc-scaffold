#!/bin/bash

# Define repositories and target directories
REPOS=(
  "https://gitlab.com/AkhdanFirdaus/secure-gen.git"
  "https://gitlab.com/mutagen/mutagen.git"
  "https://github.com/DwiHandoyo/mutant-killer-alpha-2.git"
  "https://github.com/AkhdanFirdaus/traversal-services.git"
)

DIRS=(
  "app"
  "csrf-engine"
  "lfi-engine"
  "traversal-engine"
)

# Loop through repos and perform actions
for i in "${!REPOS[@]}"; do
  REPO="${REPOS[$i]}"
  DIR="${DIRS[$i]}"

  if [[ -d "$DIR" ]]; then
    echo "🧹 Directory '$DIR' exists. Removing it..."
    rm -rf "$DIR"
  fi

  echo "⬇️ Cloning $REPO into $DIR..."
  git clone "$REPO" "$DIR"
done

if [[ -f .env.example ]]; then
  cp .env.example .env
  echo "✅ Copied .env.example to .env"
else
  echo "⚠️  No .env.example found in"
fi