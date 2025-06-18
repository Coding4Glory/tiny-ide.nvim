require 'keybindings.screenlike'

--[[
local binding_folder_name = 'keybindings'
local binding_path = vim.fn.stdpath('config') .. '/lua/' .. binding_folder_name
vim.uv.fs_scandir(binding_path, function(err, fs)
    if (err ~= nil) then
        print(err)
    end
    local next_file = vim.uv.fs_scandir_next(fs)
    local max_files = 100;
    while (next_file ~= nil and max_files > 0) do
        print ('handing ' .. next_file)
        max_files = max_files -1
        -- if vim.endswith(next_file, 'lua') then
        -- end
        -- mod_name = binding_folder_name .. '/' .. next_file
        -- require(mod_name)
     end

    end)
]]--
