#!/bin/bash

SOURCE_DIR="/home/godot/projects/dot-files/.config"
TARGET_DIR="/home/godot/.config"

cp -r "$SOURCE_DIR/hypr" "$TARGET_DIR/"
cp "$SOURCE_DIR/starship.toml" "$TARGET_DIR"
