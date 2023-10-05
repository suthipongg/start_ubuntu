export ZSH=$HOME/.oh-my-zsh
ZSH_THEME='agnoster'
source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
