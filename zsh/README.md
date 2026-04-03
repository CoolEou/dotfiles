# Zsh dotfiles

These dotfiles configures Zsh to use a lean Powerlevel10k with a catppuccin mocha color theme, a few plugins and som optional tools.

For these dotfiles to work as inteded, you'll need to install the following:
- [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10K](https://github.com/romkatv/powerlevel10k)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

Optional tools:
- [eza (a better ls)](https://github.com/eza-community/eza)
- [zoxide (a better cd)](https://github.com/ajeetdsouza/zoxide)


As well as a [Nerd Font](https://www.nerdfonts.com/) (I use JetBrainsMono NFM).

## Install script

To ensure that all prerequisites are met, I've created a script that will install everything for you. 
To include the optional tools, simply specify one or more of the following possible arguments when running the script:

| Tool             | Argument   |
|:-----------------|:-----------|
| Eza              | --eza      |
| Zoxide           | --zoxide   |
| All of the above | --all      |