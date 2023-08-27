#!/bin/sh

# check list python all version
# ref : https://askubuntu.com/questions/505081/what-version-of-python-do-i-have
echo "-------------check list python all version---------------"
#compgen -c python | sort -u
update-alternatives --list python3
echo ""

echo "-------------------check pip version---------------------"
pip --version
echo ""

echo "-----------------------check RT-C------------------------"
timedatectl
echo ""

echo "--------------------check git version--------------------"
git --version
echo ""

echo "-------------------check zsh version---------------------"
zsh --version
echo ""

echo "-------------------check zsh version---------------------"
terminator --version
echo ""