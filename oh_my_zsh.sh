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

echo "
export ZSH='$HOME/.oh-my-zsh'
ZSH_THEME='agnoster'
source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

alias ez='vim \$HOME/.zshrc'
alias sz='source \$HOME/.zshrc'
alias gst='git status'
" >> ~/.zshrc

source .zshrc 