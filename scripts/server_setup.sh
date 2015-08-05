#!/bin/sh

# install required packages
yum install epel-release -y
yum groupinstall 'Development tools' -y
yum install bzip2 bzip2-devel gcc gcc-c++ git make mosh mysql-client mysql-devel mysql-server ncurses ncurses-devel nginx openssl-devel patch php-fpm php-mysql readline-devel sqlite sqlite-devel sudo tmux wget zlib-devel \
  golang \
  lua-devel \
  python-devel \
  ruby-devel -y
