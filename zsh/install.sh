#!/usr/bin/env bash
set -e

# Get script args:
INSTALL_ALL=false
EZA=false
ZOXIDE=false

for arg in "$@"; do
    if [[ "$arg" == "--all" ]]; then
        INSTALL_ALL=true
    elif [[ "$arg" == "--eza" ]]; then
        EZA=true
    elif [[ "$arg" == "--zoxide" ]]; then
        ZOXIDE=true
    fi
done

echo "This will install the following:"
echo " - Zsh"
echo " - Oh My Zsh"
echo " - Powerlevel10k"
echo " - zsh-autosuggestions"
echo " - zsh-syntax-highlighting"
if [ "$EZA" == true ] || [ "$INSTALL_ALL" == true ]; then 
echo " - eza (better ls)" 
fi
if [ "$ZOXIDE" == true ] || [ "$INSTALL_ALL" == true ]; then 
echo " - zoxide (better cd)" 
fi
echo "Note that this script currently only works if you're using the APT package manager"
echo ""


read -p "Are you sure this is okay? (y/N): " confirm
confirm=${confirm,,} # Turn input lowercase

if [[ "$confirm" != "y" && "$confirm" != "yes" ]]; then
    echo "Zsh install aborted"
    exit 0
fi

echo "Updating packages"
sudo apt update
sudo apt install -y git curl

echo "Installing Zsh"
sudo apt install -y zsh

echo "Installing Oh My Zsh"
# rm -rf "$HOME/.oh-my-zsh" # Used to quickly test the use of the script with and without the optional args
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

if [ "$EZA" == true ] || [ "$INSTALL_ALL" == true ]; then
    echo "Installing eza"
    sudo apt install -y gpg wget
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza
fi

if [ "$ZOXIDE" == true ] || [ "$INSTALL_ALL" == true ]; then 
    echo "Installing zoxide"
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

echo "All done! :D"