#!/bin/sh

# install required packages
yum install epel-release -y
yum groupinstall 'Development tools' -y
yum install autoconf automake bison bzip2 bzip2-devel curl gcc gcc-c++ git git-core htop libffi-devel libtool libyaml-devel make mosh ncurses ncurses-devel nginx openssl-devel patch php-fpm php-mysql readline readline-devel sqlite-devel sudo tmux wget zlib zlib-devel \
  sqlite sqlite-devel \  # sqlite
  mysql-client mysql-devel mysql-server \  # mysql
  postgresql-server postgresql-contrib \  # postgres
  golang \ # go language
  lua-devel \  # lua language
  nodejs \  # nodejs language
  python-devel \  # python language
  ruby-devel -y  # ruby language
