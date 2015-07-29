#!/bin/bash

# remove old vim and install required packages
yum remove $(rpm -qa | grep ^vim)
yum groupinstall 'Development tools' -y
yum install ncurses ncurses-devel wget git -y

# download and extract vim source
cd /usr/local/src
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2 -O vim-7.4.tar.bz2
tar -xjf vim-7.4.tar.bz2
cd vim*

# compile vim
./configure --prefix=/usr \
            --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-luainterp \
            --enable-multibyte \
            --with-modified-by=renodesper
make && make install

# re-hash and check vim version
hash -r
vim --version | grep 'version'
