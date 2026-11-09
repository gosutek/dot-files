if test -d $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end

if status is-interactive
    set -g fish_greeting

    set -g fish_color_normal         F1F3E4
    set -g fish_color_command        e2342a
    set -g fish_color_keyword        e83b30
    set -g fish_color_param          F1F3E4
    set -g fish_color_option         CCD0CF
    set -g fish_color_quote          A3C293
    set -g fish_color_redirection    8AA9CC
    set -g fish_color_end            e83b30
    set -g fish_color_error          FF6B6B
    set -g fish_color_comment        949699
    set -g fish_color_operator       93D4E0
    set -g fish_color_escape         93D4E0
    set -g fish_color_autosuggestion 949699

    if command -v starship >/dev/null 2>&1
        starship init fish | source
    end

    if command -v zoxide >/dev/null 2>&1
        zoxide init fish | source
    end

    if command -v eza >/dev/null 2>&1
        alias l 'eza -lh --group-directories-first --icons=auto'
        alias la 'l -a'
        alias lt 'eza --tree --level=2 --long --icons --git'
        alias lta 'lt -a'
    end

    abbr -a v nvim
    abbr -a rm rm -v
end
