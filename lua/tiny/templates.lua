-- table with templates for easier extension
local file_templates = {
    ['*.pl'] = 'skel.pl',
    ['*.pm'] = 'skel.pm',
    ['*.php'] = 'skel.php',
    ['*.lua'] = 'skel.lua',
    ['ftplugin/*.vim'] = 'ftplugin.vim',
    ['.vimrc'] = 'vimrc.vim',
}

local template_path = vim.fs.joinpath(vim.fn.stdpath('config'), 'templates')
local template_group = vim.api.nvim_create_augroup('file_templates', { clear = true, })
for p, f in pairs(file_templates) do
    vim.api.nvim_create_autocmd({ 'BufNewFile' },
        { pattern = p, command = '0read ' .. vim.fs.joinpath(template_path, f), group = template_group, desc = 'Template for ' ..
        p .. ' files' })
end
