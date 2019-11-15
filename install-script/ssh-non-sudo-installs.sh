#!/bin/bash
##- Install list for manual installation of binaries without sudo
#init all submodules recursively
cd ..;
git submodule update --recursive ;

#settings variables
CONFIGS="$HOME/configs";


##- brew installs
# install homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# add brew to path
eval $(${HOME}/.linuxbrew/bin/brew shellenv);

#install brew version of gcc for easier building
brew install gcc

#install stuff via brew that cant be install via apt
brew install exa;
brew install jump;
brew install micro;

##- symlink stuff to $HOME
ln -sf  ${CONFIGS}/bash/bashrc.sh ${HOME}/.bashrc
ln -sf  ${CONFIGS}/bash/bash.profile ${HOME}/.profile
ln -sf  ${CONFIGS}/git/git.gitignore_global ${HOME}/.gitignore_global
ln -sf  ${CONFIGS}/zshrc.zsh ${HOME}/.zshrc
ln -sf  ${CONFIGS}/zprofile.zsh ${HOME}/.zprofile
