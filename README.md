# dotfiles
This setup is largely inspired by this setup:
https://www.josean.com/posts/how-to-setup-wezterm-terminal

## Linux install
Clone the repo to ~/.dotfiles using:
git clone https://github.com/CoolEou/dotfiles.git ~/.dotfiles


Then cd into the .dotfiles folder and initialize the relevant submodules using e.g.:
git submodule init zsh

followed by:
git submodule update zsh

You can replace zsh with any submodule you want to use.


You should then create symbolic links to any relevant files.
Example with zsh:
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
and
ln -s ~/.dotfiles/zsh/p10k.zsh ~/.p10k.zsh


### Specific for Zsh
To use the zsh dotfiles, you need to install zsh, ohmyzsh and power10k first.
First you do the classic:
sudo apt update
sudo apt upgrade


Then install zsh (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH):
sudo apt install zsh


Then ohmyzsh (https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#basic-installation):
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


This will also ask you if you want to set zsh as the default, which you should say yes to
If you don't want to make it the default immediately, you can always do this later using:
chsh -s $(which zsh)


Lastly you should install powerlevel10k (https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh):
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"


Then you should install some plugins (https://github.com/Cra7y/linuxSetup/tree/main):
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


And lastly you can install two better tools:
eza (better ls - https://github.com/eza-community/eza/blob/main/INSTALL.md#debian-and-ubuntu):
sudo apt update
sudo apt install -y gpg

sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza


zoxide (better cd - https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation)
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh


If you don't install these, you should comment out the following section of the zshrc file:
# ---- Eza (better ls) -----
alias ls="eza --icons=always"

# ---- Zoxide (better cd) ----
export PATH="$PATH:$HOME/.local/bin"
eval "$(zoxide init zsh)"
alias cd="z"