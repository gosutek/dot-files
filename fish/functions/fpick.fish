function fpick --description 'Fuzzy search and open in neovim'
    fd -t f | fzf --bind 'enter:become(nvim {})'
end
