#!/bin/sh
curr_dir=$(pwd)
dir_setup=$(dirname "$0")
cd $HOME

# install google chrome
# ref : https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-debian-9/
echo "-------------------------install google chrome---------------------------"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb -y
rm google-chrome-stable_current_amd64.deb

# install curl
echo "-------------------------install curl---------------------------"
apt install curl -y

echo "-------------------------install pip---------------------------"
apt install python3-pip -y # install pip

# install git
echo "-------------------------install git---------------------------"
apt install git -y

# install vim
echo "-------------------------install vim---------------------------"
apt-get install vim -y

# install visual studio code
# ref : https://www.makeuseof.com/how-to-install-visual-studio-code-ubuntu/#:~:text=To%20install%20Visual%20Studio%20Code%2C%20launch%20the%20Ubuntu%20Software%20app,directly%20from%20the%20Applications%20menu.
echo "-------------------------install vscode---------------------------"
snap install --classic code
apt-get install ttf-ubuntu-font-family -y

# install fonts
# ref1 : https://stackoverflow.com/questions/62710890/font-issues-while-integrating-zsh-on-visual-studio-code
# ref2 : https://www.unixtutorial.org/how-to-install-ttf-fonts-in-linux/
echo "-------------------------install font---------------------------"
cp $curr_dir/$dir_setup/font $HOME/.fonts
cd $HOME/.fonts
fc-cache -f -v
cd
echo "-------------------------install font in vscode---------------------------"
cp $curr_dir/$dir_setup/config/config_vscode $HOME/.config/Code/User/settings.json

# set time to RTC
# ref : https://ubuntuhandbook.org/index.php/2016/05/time-differences-ubuntu-1604-windows-10/
echo "-------------------------change time RTC---------------------------"
timedatectl set-local-rtc 1 --adjust-system-clock

# install terminator
# ref : https://github.com/gnome-terminator/terminator/tree/master
echo "-------------------------install terminator---------------------------"
add-apt-repository ppa:mattrose/terminator -y
apt-get update
apt install terminator -y
# replace default terminal to terminator
# ref : https://github.com/Eugeny/tabby/issues/5277
update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/terminator 50
cp $curr_dir/$dir_setup/config/config_terminator $HOME/.config/terminator/config

# install Ohmy zsh
# ref : https://www.tecmint.com/install-oh-my-zsh-in-ubuntu/
echo "-------------------------install oh my zsh---------------------------"
apt-get install zsh -y
usermod -s /usr/bin/zsh $(whoami)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y

echo "-------------------------update & upgrade---------------------------"
apt update && apt upgrade -y
echo "-------------------------autoremove---------------------------"
apt autoremove