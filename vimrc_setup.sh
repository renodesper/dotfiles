#!/bin/sh
# NeoBundle installation and vimrc preparation

# NeoBundle installation directory
VIM_CONFIG=~/.vimrc
BUNDLE_DIR=~/.vim/bundle
INSTALL_DIR=$BUNDLE_DIR/neobundle.vim

if [ -e $INSTALL_DIR ]; then
  echo "$INSTALL_DIR already exists!"
  exit 1
fi

# check git command
if type git; then
  : # You have git command. No Problem.
else
  echo 'Please install git or update your path to include the git executable!'
  exit 1;
fi

# make bundle dir and fetch neobundle
echo "Begin fetching NeoBundle..."
mkdir -p $BUNDLE_DIR
git clone https://github.com/Shougo/neobundle.vim $INSTALL_DIR
echo "Complete setup NeoBundle!"

# copy .vimrc into ~/.vimrc
echo "Begin copying vimrc..."
cp -f .vimrc $VIM_CONFIG
echo "Done!"

echo "Please open vim to install other plugins."
