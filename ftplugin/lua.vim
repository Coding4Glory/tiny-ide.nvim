if exists("b:tiny_ftplugin") && b:tiny_ftplugin == "lua"
  finish
endif
let b:tiny_ftplugin = "lua"

setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

