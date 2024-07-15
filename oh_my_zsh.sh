#!/bin/sh
curr_dir=$(pwd)
dir_setup=$(dirname "$0")
HOME=/home/$SUDO_USER
cd $HOME

# setup zsh
echo "-------------------------install extension oh my zsh---------------------------"
apt install powerline fonts-powerline -y
echo "-------------------------setup oh my zsh---------------------------"
chsh -s $(which zsh)
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Pilaton/OhMyZsh-full-autoupdate.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ohmyzsh-full-autoupdate
mv .zshrc .zshrc_backup
cp $curr_dir/$dir_setup/config/config_oh_my_zsh.sh $HOME/.zshrc

echo "-------------------------setup zsh---------------------------"
echo "$(< $curr_dir/$dir_setup/config/config_zsh.sh)" >> $HOME/.zshrc

source $HOME/.zshrc 
