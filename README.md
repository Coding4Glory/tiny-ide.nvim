# tiny.nvim

The probably tiniest neo vim distribution you might find. The goal of this disribution is to be a small as possible starting point with a low number of modules.

I came up with this idea after struggling with [LunarVim][1] which was my favourite before because it didn't modify the default config but uses it's own launch script. But it has to many dependencies for a daily driver. Then I stumbled across [kickstart.nvim][2] had must stay for a *starting point claiming to be not distribution* it looks a little large, since it includes mini.nvim consiting already of 40 mini plugins. Finally I decided to start my own configuration and pick my plugins with some help from [typecraft on youtube][3] ([full course][4]). So I do the contrary to [kickstart.nvim][2] and call my small starter configuration a distribution.

## Flavours

This distribution comes in two flavours.

- tiny.nvim: minimalistic plugin selection utilizing [netrw][5]
- tiny-ide.nvim: a little more cosy but using [nvim-tree.lua][6] (disabling netrw)

> nvim-tree.lua was chosen to avoid any dependency to nui

## Installation

This depends on your personal favour, following the recommendation.

    git clone <repo-url> ~/.config/nvim -b nvim-ide.tiny
    cd ~/.config/nvim checkout -b myconfig
    git remote remove origin
    git remote add origin <your-repo>
    git push --set-upstream origin
    git remote add upstream <repo-url>
    git clone <repo-url> ~/.config/tvim -b nvim.tiny
    echo 'alias tvim="NVIM_APPNAME=tvim nvim"' >> .profile

Plugins will be installed on first start. Using this approach will duplicate some plugins. But due to it's minimal approach this won't occupy much space.

## Troubleshooting

Since this distribution is merely a starting point you might end up in a situation where your neovim does not perform as expected. Checkout the tiny-ide.nvim branch as a "safe mode" and your own config in a worktree. The tiny-ide config contains support for lua so you can fix your config with some ide support.

The tiny.nvim setup can be usefull in situations where you want or need a more bare experience.

[1]: https://www.lunarvim.org/
[2]: https://github.com/nvim-lua/kickstart.nvim
[3]: https://www.youtube.com/watch?v=zHTeCSVAFNY
[4]: https://typecraft.dev/neovim-for-newbs
[5]: https://neovim.io/doc/user/pi_netrw.html
[6]: https://github.com/nvim-tree/nvim-tree.lua
[7]: https://typecraft.dev/neovim-for-newbs
