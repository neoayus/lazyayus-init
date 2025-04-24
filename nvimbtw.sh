#!/bin/bash

dotfiles_repo="git@github.com:neoayus/dotfiles.git"
dotfiles_dir="$HOME/dotfiles"  # safer target directory

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

# Clone dotfiles if not already present
if [ ! -d "$dotfiles_dir" ]; then 
    git clone "$dotfiles_repo" "$dotfiles_dir"  
else
    echo "Dotfiles directory already exists"
fi

# Change working directory to ~/dotfiles
cd "$dotfiles_dir" || exit

# Load configs
stow nvim 

# Remove git history (optional)
rm -rf .git
