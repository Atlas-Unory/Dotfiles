# 🎩 Hello Stranger
This are my personal dotfiles (at least some of them) for a development environment and for a good-looking desktop. You ca use both of them at the same time if you wish, or you can just chose one of them that you'd like to use and installed it.

## ⚙️ Development Environment

### About the dotfiles
🚨 **I only work with Linux**

All my dotfiles were made to work on Linux, specifically on Arch Linux and its distributions. In case you aren't on one of these distributions, my dotfiles won't work natively 100% right off the bat. For them all to work, you'll have to manually verify which of the packages are available on your Linux distribution.
If you are an Arch Linux user or are currently using one of its distributions. I don't have a `Install` script yet, but I will add one in the future, but I don't know when, I just know it won't be soon since I'm busy now.

## ✨ Customizing Your Distro

### 🗚  More fonts
Here are some fonts I think you should install on your system.

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