fish_add_path --path ~/.local/bin

if status is-interactive
    set fish_greeting

    starship init fish | source
	zoxide init fish | source

    abbr -a l 'ls -lAh1 --group-directories-first'
    abbr -a v nvim
    abbr -a rm rm -v
    abbr -a fp fpick
end
