function pkgdeps --description 'Describe packages that installing $argv would pull in'
    expac -S '%n: %d' (pacman -Sp --print-format '%n' $argv)
end
