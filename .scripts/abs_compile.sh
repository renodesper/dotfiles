#!/bin/bash

# Compile PKGBUILD
for f in /home/renodesper/Project/abs/*/; do
    cd "$f"
    makepkg -sic
done

