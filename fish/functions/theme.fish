function theme --description 'Generate colors from an image with matugen'
    matugen image $argv[1] -m dark -t scheme-tonal-spot --prefer saturation
end
