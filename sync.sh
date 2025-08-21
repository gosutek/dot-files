#!/bin/sh

rsync -av --delete "$HOME/.config/hypr/" "$HOME/projects/dot-files/.config/hypr/"
rsync -av --delete "$HOME/.config/fastfetch/" "$HOME/projects/dot-files/.config/fastfetch/"
rsync -av --delete "$HOME/.config/quickshell/" "$HOME/projects/dot-files/.config/quickshell/"
