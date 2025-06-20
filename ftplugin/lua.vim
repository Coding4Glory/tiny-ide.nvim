if exists("b:tiny_ftplugin") && b:tiny_ftplugin == "lua"
  finish
endif
let b:tiny_ftplugin = "lua"

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

