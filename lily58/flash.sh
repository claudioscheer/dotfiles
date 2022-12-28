#!/usr/bin/env bash

# PCB project
# git clone https://github.com/kata0510/Lily58.git

# QMK install and compile
# python3 -m pip install qmk
# cd ~/
# qmk setup

sudo cp -f ~/qmk_firmware/util/udev/50-qmk.rules /etc/udev/rules.d/
rm -rf ~/qmk_firmware/keyboards/lily58/keymaps/claudio/
mkdir -p ~/qmk_firmware/keyboards/lily58/keymaps/claudio
cp keymap.json ~/qmk_firmware/keyboards/lily58/keymaps/claudio/
cp rules.mk ~/qmk_firmware/keyboards/lily58/keymaps/claudio/
cd ~/qmk_firmware/keyboards/lily58/keymaps/claudio
qmk json2c keymap.json > keymap.c
cd ~/qmk_firmware
make clean
make lily58:claudio:flash
