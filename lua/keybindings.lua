require 'keybindings.screenlike'

--[[
local binding_folder_name = 'keybindings'
local binding_path = vim.fn.stdpath('config') .. '/lua/' .. binding_folder_name
vim.uv.fs_scandir(binding_path, function(err, fs)
    if (err ~= nil) then
        print(err)
    end
    local next_file = vim.uv.fs_scandir_next(fs)
    while (next_file ~= nil) do
        print ('handing ' .. next_file)
        -- if vim.endswith(next_file, 'lua') then
        -- end
        -- mod_name = binding_folder_name .. '/' .. next_file
        -- require(mod_name)
     end

    end)
]]--
