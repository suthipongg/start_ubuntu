#!/bin/sh
cd $HOME

# setup zsh
echo "-------------------------install extension oh my zsh---------------------------"
apt install powerline fonts-powerline -y
echo "-------------------------setup oh my zsh---------------------------"
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
mv .zshrc .zshrc_backup
touch .zshrc
echo 'export ZSH="$HOME/.oh-my-zsh"' >> .zshrc
echo 'ZSH_THEME="agnoster"' >> .zshrc
echo 'source $ZSH/oh-my-zsh.sh' >> .zshrc
echo 'source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> .zshrc
echo 'source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> .zshrc
echo 'plugins=(git zsh-syntax-highlighting zsh-autosuggestions)' >> .zshrc
source .zshrc 