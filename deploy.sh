#!/bin/bash
#
# Deploy script for EP5 Bookdown
# Usage: ./deploy.sh [commit message]
#
# This script renders the book and pushes to GitHub in one step.
# If no commit message is provided, it defaults to "update book".

set -e

cd "$(dirname "$0")"

MSG="${1:-update book}"

echo "==> Rendering book..."
Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::bs4_book")'

echo "==> Staging changes..."
git add --all

if git diff --cached --quiet; then
  echo "==> No changes to commit."
  exit 0
fi

echo "==> Committing: $MSG"
git commit -m "$MSG"

echo "==> Pushing to GitHub..."
git push

echo "==> Done! Book will be live at https://daarnolducsd.github.io/ep5book/"
