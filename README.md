# tiny.nvim

The probably tiniest neo vim distribution you might find. The goal of this disribution is to be a small as possible starting point with a low number of modules.

## Installation

This depends on your personal favour. Plugins will be installed on first start.
.

### As main configuration

    git clone <repo-url> ~/.config/nvim -b release
    cd ~/.config/nvim checkout -b myconfig
    git remote add myrepo <new-repo-url>
    git push --set-upstream myrepo myconfig
    nvim


### Besides existing configuration

*tvim* is just an example and can be replaced with any name not colliding on your system. Just ensure the foldername and the alias are the same.

    git clone <repo-url> ~/.config/tvim -b release
    cd ~/.config/tvim checkout -b myconfig
    git remote add myrepo <new-repo-url>
    source <<EOF
    $(echo 'alias tvim="NVOM_APPNAME=tvim" | tee -a ~/.profile)
    EOF
    tvim

## Configuration

This IS a configuration 😉

The file structure is simple

.
├── ftplugin
│   ├── lua.vim
│   └── vim.vim
├── lua
│   ├── plugins
│   │   ├── custom
│   │   ├── tiny
│   │   ├── tiny-ide
│   │   └── lazy.lua
│   ├── tiny
│   │   ├── buffers.lua
│   │   ├── modeline.lua
│   │   ├── projectsettings.lua
│   │   ├── templates.lua
│   │   └── terminal.lua
│   ├── options.lua
│   └── tiny.lua
├── templates
│   ├── ftplugin.vim
│   └── skel.lua
└── init.lua

The loading order is as following (ommiting the lua/ folder)

1. init.lua
    1. options.lua
    1. lazy.lua
        1. plugins/tiny
        1. plugins/tiny-ide
        1. plugins/custom
    1. tiny.lua
        1. tiny/buffers.lua
        1. tiny/terminal.lua
        1. tiny/templates.lua
        1. tiny/modeline.lua
        1. tiny/projectsettings.lua

### tile type plugins

tiny.nvim uses the native ftplugin loading mechanism to set file type specific settings. Those files have to be written in classic VimScript, a template is included.

## Included Plugins

Plugins are separated in two categories: Basic, to be found in the tiny folder and advanced in the tiny-ide folder.

- basic
    - [neogit]()
    - [netrw-nvim]()
    - [telescope]()
    - [todo]()
    - [which-key]()
- advanced
    - [cmp-nvim-lsp]()
    - [lazydev]()
    - [mason]()
    - [lsp-config]()
    - [LuaSnip]()
    - [mason-lspconfig]()
    - [none_ls]()
    - [nvim-cmp]()
    - [treesitter]()
- custom
    - [nvim-tree]() *(bonus)*

## Troubleshooting

Since this distribution is merely a starting point you might end up in a situation where your neovim does not perform as expected. Checkout the tiny-ide.nvim branch as a "safe mode" and your own config in a worktree. The tiny-ide config contains support for lua so you can fix your config with some ide support.

The tiny.nvim setup can be usefull in situations where you want or need a more bare experience.

Never forget: `:help help` 😎

## Trivia

I came up with this idea after struggling with [LunarVim][1] which was my favourite before because it didn't modify the default config but uses it's own launch script. But it has to many dependencies for a daily driver. Then I stumbled across [kickstart.nvim][2] and must say for a *starting point claiming to be not distribution* it looks a little large, since it includes mini.nvim consiting already of 40 mini plugins. Finally I decided to start my own configuration and pick my plugins with some help from [typecraft on youtube][3] ([full course][4]). So I do the contrary to [kickstart.nvim][2] and call my small starter configuration a distribution.


[1]: https://www.lunarvim.org/
[2]: https://github.com/nvim-lua/kickstart.nvim
[3]: https://www.youtube.com/watch?v=zHTeCSVAFNY
[4]: https://typecraft.dev/neovim-for-newbs
[5]: https://neovim.io/doc/user/pi_netrw.html
[6]: https://github.com/nvim-tree/nvim-tree.lua
