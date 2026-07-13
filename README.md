# 🎩 Hello Stranger

This are my personal dotfiles (at least some of them) for a development environment and for a good-looking desktop. You ca use both of them at the same time if you wish, or you can just chose one of them that you'd like to use and installed it.

## ⚙️ Development Environment

### About the dotfiles

🚨 **I only work with Linux**

All my dotfiles were made to work on Linux, specifically on Arch Linux and its distributions. In case you aren't on one of these distributions, my dotfiles won't work natively 100% right off the bat. For them all to work, you'll have to manually verify which of the packages are available on your Linux distribution.
If you are an Arch Linux user or are currently using one of its distributions. I don't have a `Install` script yet, but I will add one in the future, but I don't know when, I just know it won't be soon since I'm busy now.

## ✨ Customizing Your Distro

### 🗚 More fonts

Here are some fonts I think you should install on your system.
🚨 **This fonts are recommended only if you are on Arch Linux**

Adobe source sans serif and sans fonts and CJK and emoji which cover most of Asia characters.

```bash
    sudo pacman -S sudo adobe-source-han-serif-cn-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fonts adobe-source-han-serif-tw-fonts
```

```bash
    sudo pacman -S adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-han-sans-otc-fonts adobe-source-han-sans-tw-fonts
```

Fonts to display icons and emojis correctly

```bash
    sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
```

### About Fish Shell 🐟

Here are somethings about the Fish Shell configuration file:

- The configuration file uses the default [Starship](https://starship.rs) to add icons and visual effects to the shell and help the user to see better what is happening on their terminals.

- Since i don't like to use things like the Kwallet on KDE to manage my SSH keys, I replaced it with [Keychain](https://github.com/danielrobbins/keychain), so, if you like to use Keychain, uncomment the lines referent to it to use it or use your preferencial method to manage your SSH keys.

- I also like to use [Bat](https://github.com/sharkdp/bat) with the Dracula theme.

- I only use NVM though the [Fisher plugin](https://github.com/jorgebucaran/nvm.fish) to mange my [NodeJS](https://nodejs.org/en) versions, but globally I only use the LTS version.

### Neovim

Here are a table of all my [Neovim]() plugins and its description:

| Plugin                  | Description                                                                                                                                                                                                                             |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| mfussenegger/nvim-dap   | nvim-dap is a Debug Adapter Protocol client implementation for Neovim. [Link](https://neovimcraft.com/plugin/mfussenegger/nvim-dap/)                                                                                                    |
| j-hui/fidget.nvim       | Extensible UI for Neovim notifications and LSP progress messages. [Link](https://neovimcraft.com/plugin/j-hui/fidget.nvim/)                                                                                                             |
| formatters              | These are just formatters that I like to use, you can just use them or change to those you like in the `.lua` file                                                                                                                      |
| linters                 | These are just linters that I like to use, you can just use them or change to those you like in the `.lua` file                                                                                                                         |
| catgoose/nvim-colorizer | A high-performance color highlighter for Neovim with no external dependencies. Written in performant Luajit. [Link](https://neovimcraft.com/plugin/catgoose/nvim-colorizer.lua/)                                                        |
| render-markdown.nvim    | Improve viewing Markdown in Neovim. [Link](https://neovimcraft.com/plugin/MeanderingProgrammer/render-markdown.nvim/)                                                                                                                   |
| smear-cursor.nvim       | Neovim plugin to animate the cursor with a smear effect in all terminals. [Inspired by Neovide's animated cursor](https://neovide.dev/features.html#animated-cursor). [Link](https://neovimcraft.com/plugin/sphamba/smear-cursor.nvim/) |
| themes                  | It is just the themes I like to use, you can modifi them however you want and add more themes.                                                                                                                                          |
| visual-whitespace.nvim  | Display white space characters in visual mode, like VSCode's renderWhitespace: selection. [Link](https://github.com/mcauley-penney/visual-whitespace.nvim)                                                                              |
