if status is-interactive
    # Commands to run in interactive sessions can go here
end


set -U fish_greeting
starship init fish | source
nitch

thefuck --alias | source
