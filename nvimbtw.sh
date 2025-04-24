#!/bin/bash

<<<<<<< HEAD
dotfiles_repo="git@github.com:neoayus/dotfiles.git"
dotfiles_dir="$HOME/dotfiles"  # safer target directory
=======
dotfiles_repo="https://github.com/neoayus/dotfiles.git"
home_dir="$HOME" 
dotfiles_dir="$HOME/dotfiles" 
>>>>>>> c6bf02149c19692465712b36891f962f52c7da16

# Function to check if package is installed, or install it
cNi(){ 
    if ! which "$1" &> /dev/null ; then    
        echo "$1 not found, installing..."
        sudo apt update && sudo apt install -y "$1" 
    else
        echo "$1 is already installed" 
    fi
}

# Install required packages
cNi git 
cNi neovim 
cNi stow 

<<<<<<< HEAD
# Clone dotfiles if not already present
if [ ! -d "$dotfiles_dir" ]; then 
    git clone "$dotfiles_repo" "$dotfiles_dir"  
=======
# clone 'neoayus/dotfiles' locally.. 
if [ ! -d "$dotfiles_dir" ]; then 
    cd ~
    git clone "$dotfiles_repo"  
>>>>>>> c6bf02149c19692465712b36891f962f52c7da16
else
    echo "Dotfiles directory already exists"
fi

<<<<<<< HEAD
# Change working directory to ~/dotfiles
cd "$dotfiles_dir" || exit
=======
# change working directory to ~/dotfiles 
cd $dotfiles_dir
>>>>>>> c6bf02149c19692465712b36891f962f52c7da16

# Load configs
stow nvim 

# Remove git history (optional)
rm -rf .git
