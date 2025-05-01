if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting
set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
set -x KITTY_CONFIG_DIRECTORY ~/.config/kitty/
starship init fish | source
fastfetch

thefuck --alias | source
