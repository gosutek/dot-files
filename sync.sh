#!/bin/sh

rsync -av --delete "$HOME/.config/hypr/" "$HOME/projects/dot-files/.config/hypr/"
rsync -av --delete "$HOME/.config/fastfetch/" "$HOME/projects/dot-files/.config/fastfetch/"
rsync -av --delete "$HOME/.config/quickshell/" "$HOME/projects/dot-files/.config/quickshell/"
rsync -av --delete "$HOME/.config/leafvim/" "$HOME/projects/dot-files/.config/leafvim"
rsync -av --delete "$HOME/.config/starship/" "$HOME/projects/dot-files/.config/starship"
