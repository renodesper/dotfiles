#!/bin/sh

# install rbenv
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

echo "gem: --no-document" > ~/.gemrc

# list available ruby
rbenv install -l | less

# example:
    # install specific ruby version
    # rbenv install 2.2.2

    # use and check newly installed ruby version
    # rbenv shell 2.2.2
    # ruby --version

    # install ruby package with gem
    # gem install bundler
    # gem install rails

# rehash rbenv shims (run this after installing executables)
rbenv rehash
