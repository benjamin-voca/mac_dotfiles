#!/usr/bin/env bash
# Install formulae
while read -r pkg; do
  brew install "$pkg"
done < brew-packages.txt

# Install casks
while read -r cask; do
  brew install --cask "$cask"
done < brew-casks.txt
