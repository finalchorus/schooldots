#!/bin/bash

# Update apt and existing packages
echo "[*] Updating packages and cleaning up.."
sudo apt update && sudo apt upgrade && sudo apt autoremove
echo "[*] We up-to-date and clean now!"

# Install required packages for the script
echo "[*] Installing dependencies for this script (curl wget git)"
sudo apt install curl
sleep 1
sudo apt install wget
sleep 1
sudo apt install git
sleep 1
echo "[*] All done!"

# Install zsh
echo "[*] Installing zsh.."
sudo apt install zsh
echo "[*] zsh installed!"

# Install gnome-tweaks and themes
echo "[*] Installing GNOME-tweaks.."
sudo apt install gnome-tweaks
sudo apt install gnome-themes-extra
echo "[*] GNOME Tweaks installed!"


# Create directory for and Install Terminator plugins
echo "[*] Installing TerminatorThemes.."
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
echo "[*] TerminatorThemes are ready!"


# Install oh-my-zsh
echo "[*] Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "[*] oh-my-zsh has been cloned!"


# Install nerd-fonts "caskaydia"
echo "[*] Installing Caskaydia-Nerd-Font"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
unzip CascadiaCode.zip
mkdir /home/student/.fonts
mv CaskaydiaCoveNerdFont* ~/.fonts
fc-cache -fv
echo "[*] Font is here!"

# Install p10k zsh theme
echo "[*] Installing POWERLEVEL10K"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "[*] POWERLEVEL IS NOW GREATER THAN 9k"


# Replace default theme in .zshrc with "powerlevel10k/powerlevel10k"
echo "[*] Changing zsh theme to p10k"
sed -i 's|robbyrussell|powerlevel10k\/powerlevel10k|1' $HOME/.zshrc
echo "[*] zsh theme has become p10k"

# Adding the syntax highlighting to zsh
echo "[*] Activating syntax highlighting!"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/^plugins=(git)$/plugins=(git zsh-syntax-highlighting)/' $HOME/.zshrc
echo "[*] Syntax highlighting activated!"

# Install Pokemon-colorscripts
echo "[*] Installing Pokemon-colorscripts"
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git 
sleep 3
cd pokemon-colorscripts 
sleep 3
sudo ./install.sh
sleep 3
echo "[*] Caught them all, through Gen8 at least."


# Adds Pokemon-colorscripts to the shell files for new terminals
echo "[*]Adding Pokemon Sprites to bash and zsh"
echo "pokemon-colorscripts --no-title -r" >> ~/.zshrc
sleep 1
echo "pokemon-colorscripts --no-title -r" >> ~/.bashrc
echo "[*] Sprites now added to terminals!"
sleep 1

# Adding customized bash prompt
echo "[*] Adding the PS1 line to .bashrc"
cat ./ps1 >> ~/.bashrc


echo "[*] We're done now!"
