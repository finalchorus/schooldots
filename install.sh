#!/bin/bash

# Update apt and existing packages
echo "[*] Updating packages and cleaning up.."
sudo pacman -Syu 
echo "[*] We up-to-date and clean now!"

# Install required packages for the script
echo "[*] Installing dependencies for this script (curl wget git)"
sudo pacman -S curl
sleep 1
sudo pacman -S wget
sleep 1
sudo pacman -S git
sleep 1
echo "[*] All done!"

# Install zsh
echo "[*] Installing zsh.."
sudo pacman -S zsh
echo "[*] zsh installed!"


# Create directory for and Install Terminator plugins
echo "[*] Installing TerminatorThemes.."
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
echo "[*] TerminatorThemes are ready!"


# Install oh-my-zsh
echo "[*] Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "[*] oh-my-zsh has been cloned!"

# Install fast-syntax-highlighting & zsh-autocomplete from https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df
echo "[*] Installing zsh-autocomplete"
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# Don't forget to add them to the .zshrc under plugins******
echo "[*] Don't forget to add the plugins in the field in .zshrc!"
sleep 5

# Install nerd-fonts "caskaydia"
echo "[*] Installing Caskaydia-Nerd-Font"
echo "[*] Caskaydia is #22"
sleep 5
sudo pacman -S nerdfonts
echo "[*] Font is here!"

# Install p10k zsh theme
echo "[*] Installing POWERLEVEL10K"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "[*] POWERLEVEL IS NOW GREATER THAN 9k"


# Replace default theme in .zshrc with "powerlevel10k/powerlevel10k"
echo "[*] Changing zsh theme to p10k"
sed -i 's|robbyrussell|powerlevel10k\/powerlevel10k|1' $HOME/.zshrc
echo "[*] zsh theme has become p10k"


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
# echo "[*] Adding the PS1 line to .bashrc"
# cat ps1 >> ~/.bashrc
# export PS1="┌─[\[\e[1;34m\]\u\[\e[00m\]@\[\e[1;36m\]\h\[\e[00m\]:\[\e[1;35m\]\w\[\e[0m\]]\n└─╼"

echo "[*] We're done now!"
