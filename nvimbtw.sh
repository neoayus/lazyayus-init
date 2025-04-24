#!/bin/bash

dotfiles_repo = "https://github.com/neoayus/dotfilew.git"
dotfiles_dir = "$HOME" 

# function to check 'if' or Install a package 
# cNi for check and install 
cNi(){ 
    if ! which "$1" &> /dev/null ; then    
        echo "$1 not found, installing..."
        sudo apt update && sudo apt install -y "$1" 
    else
        echo "$1 is already installed" 
    fi
}

# install required packages 
cNi git 
cni nvim 
cNi stow 

# clone 'neoayus/dotfiles' locally.. 
if [ ! -d "$dotfiles_dir"]; then 
    git clone "$dotfiles_repo" "$dotfiles_dir"  
else
    echo "WE ON ARCH BIC- " 
fi

# change working directory to ~/dotfiles 
cd ~/dotfiles/ 

# load configs 
stow nvim 
stow bash 

# remove git source from local repo 
rm -rf .git 
