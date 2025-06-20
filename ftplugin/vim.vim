if exists("b:tiny_ftplugin") && b:tiny_ftplugin == "vim"
  finish
endif
let b:tiny_ftplugin = "vim"

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab
