-- project setting support
-- TODO: add possibiliy to restrict to directories
if (vim.uv or vim.loop).fs_stat('.nvim/init.lua') then
    -- require does not work here
    vim.cmd('source .nvim/init.lua')
end

