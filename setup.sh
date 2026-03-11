#!/bin/bash
# One-shot setup script for da-leclerc.github.io
# Run this from INSIDE the da-leclerc.github.io folder
# Prerequisites: git installed, GitHub CLI (gh) installed and authenticated

set -e

echo "=== Step 1: Creating GitHub repo ==="
gh repo create da-leclerc.github.io --public --description "Bilingual AI consulting website — Dominic-André Leclerc" || echo "Repo may already exist, continuing..."

echo ""
echo "=== Step 2: Initializing git ==="
git init
git branch -M main

echo ""
echo "=== Step 3: Adding PaperMod theme ==="
git submodule add --depth=1 https://github.com/adnanh/hugo-PaperMod.git themes/PaperMod

echo ""
echo "=== Step 4: Committing and pushing ==="
git add -A
git commit -m "Initial site: bilingual Hugo + PaperMod"
git remote add origin https://github.com/DA-Leclerc/da-leclerc.github.io.git 2>/dev/null || git remote set-url origin https://github.com/DA-Leclerc/da-leclerc.github.io.git
git push -u origin main

echo ""
echo "=== Step 5: Enabling GitHub Pages ==="
gh api repos/DA-Leclerc/da-leclerc.github.io/pages -X POST -f build_type=workflow 2>/dev/null || echo "Pages may already be configured."

echo ""
echo "=== Done! ==="
echo "Your site will be live at: https://da-leclerc.github.io/"
echo "GitHub Actions will build it automatically. Check progress at:"
echo "https://github.com/DA-Leclerc/da-leclerc.github.io/actions"
