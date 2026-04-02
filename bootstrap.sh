#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Get script args:
WEZTERM=false

for arg in "$@"; do
    if [[ "$arg" == "--wezterm" ]]; then
        WEZTERM=true
    fi
done

echo "This will overwrite the following config files if they exist:"
if [ "$WEZTERM" == true ]; then echo " - ~/.config/wezterm/*"; fi
echo " - ~/.zshrc"
echo " - ~/.p10k.zsh"
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
if [ "$WEZTERM" == true ]; then
    echo "Initializing WezTerm submodule"
    git submodule update --init --remote wezterm

    rm -rf "$HOME/.config/wezterm"
    ln -sf "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
    echo "WezTerm setup :)"
fi

#Setup ZSH
ln -sf "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/p10k.zsh" "$HOME/.p10k.zsh"
echo "Zsh setup :)"

echo "Done!"