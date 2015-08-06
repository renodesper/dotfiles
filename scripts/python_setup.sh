#!/bin/sh

# install pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc

# list available python
pyenv install -l | less

# example:
    # install specific python version
    # pyenv install 2.7.10
    # pyenv install 3.4.3

    # use and check newly installed python version
    # pyenv shell 2.7.10
    # python --version
    # pyenv shell 3.4.3
    # python --version
    # pyenv shell system
    # python --version

    # install python package with pip
    # pip install django

# rehash pyenv shims (run this after installing executables)
pyenv rehash
