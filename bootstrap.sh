#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Get script args:
INSTALL_ALL=false
WEZTERM=false
ZSH=false

for arg in "$@"; do
    if [[ "$arg" == "--all" ]]; then
        INSTALL_ALL=true
    elif [[ "$arg" == "--wezterm" ]]; then
        WEZTERM=true
    elif [[ "$arg" == "--zsh" ]]; then
        ZSH=true
    fi
done

echo "This will overwrite the following config files if they exist:"
if [ "$WEZTERM" == true ] || [ "$INSTALL_ALL" == true ]; then 
echo " - ~/.config/wezterm/*"
fi
if [ "$ZSH" == true ] || [ "$INSTALL_ALL" == true ]; 
then echo " - ~/.zshrc"
echo " - ~/.p10k.zsh"
fi
echo ""

read -p "Are you sure this is okay? (y/N): " confirm
confirm=${confirm,,} # Turn input lowercase

if [[ "$confirm" != "y" && "$confirm" != "yes" ]]; then
    echo "Bootstrap aborted"
    exit 0
fi

echo "Setting up symlinks"

# Ensure $HOME/.config exists
mkdir -p "$HOME/.config"

#Setup WezTerm
if [ "$WEZTERM" == true ] || [ "$INSTALL_ALL" == true ]; then
    echo "Initializing WezTerm submodule"
    git submodule update --init --remote wezterm

    rm -rf "$HOME/.config/wezterm"
    ln -sf "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
    echo "WezTerm setup :)"

    echo "Make sure to also have WezTerm installed: https://wezterm.org/installation.html"
fi

#Setup ZSH
if [ "$ZSH" == true ] || [ "$INSTALL_ALL" == true ]; then
    ln -sf "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
    ln -sf "$DOTFILES_DIR/zsh/p10k.zsh" "$HOME/.p10k.zsh"
    echo "Zsh setup :)"

    read -p "Would you like to run the Zsh install script? (y/N): " confirm
    confirm=${confirm,,} # Turn input lowercase

    if [[ "$confirm" == "y" || "$confirm" == "yes" ]]; then
        "$DOTFILES_DIR/zsh/install.sh" --all
    fi
fi

echo "All done! :D"