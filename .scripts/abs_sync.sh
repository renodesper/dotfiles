#!/bin/bash

cd /home/renodesper/Project/abs/

# Backup old PKGBUILD
for f in *; do
    mv "$f" "$f".back
done

# Get PKGBUILD
yaourt -G \
    linux-ck \
    linux-ck-headers \
    virtualbox-ck-guest-modules \
    virtualbox-ck-host-modules \
    virtualbox-ext-oracle
abs \
    extra/firefox \
    extra/libreoffice-fresh \
    extra/vim \
    extra/xterm

# Remove old PKGBUILD
rm -rf *.back

# Change ownership back to renodesper
chown -R renodesper:renodesper *

