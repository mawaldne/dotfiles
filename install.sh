#! /bin/bash

# Manual Installs first
#
# ) Setup basic mac things
#   - Double click on right
#   - Hide menu bar
#   - Key repeat rate: https://apple.stackexchange.com/questions/46361/keyboard-no-longer-repeats-keys-when-held-down
#
# ) Install chrome
#
# ) Install password manager
# 	- Setup your account using key
# 	- setup work account - Remeber you team is #team#.passwordmanager.com
# 	- Go to menu to setup extention
# 	- Setup chrome extention
#
# ) Install xcode command line tools:
# 	- Might have to install xcode in app store
# 	- xcode-select --install MIGHT work
#
# ) Install ssh keys
#
# ) Clone dotfiles
#
# ) Install oh my zsh
#   - you will need to make sure its setup as default
#
# ) Install brew
#
# ) Install wez term
#   - brew install --cask wezterm
#
# ) Install LaunchBar (key in password manager)
#    - brew install --cask launchbar
#    - turn off shortcuts for clipboard (just keep command L)
#
# ) Install Alt tab
#   - brew install --cask alt-tab
#
# ) Install Sizeup (key in password manager)
#   - brew install --cask sizeup
#
# ) Install MacVim
#   Install from the dmg file downloaded from the site
#   Setting should just work now
#
# ) Install Slack
#   - brew install --cask slack
#   - setup push up to edit under accessibility
#
# YARN - npm install -g yarn
# 	.npmrc - add work related registies
#
# Install docker. Dark mode
#
# Install webstorm
#   - install ideavim
#   - font monaco 16
#   - dracula theme
#
# Install datagrip
#   - aws toolkit install
#   - Import projects: https://blog.jetbrains.com/datagrip/2018/05/21/copy-and-share-data-sources-in-datagrip/
#
# AWS VPN
#   - vpn files
#   - install aws command line tools
# 	- brew install awscli
# 	- aws configure
#   - get original .aws config tools
#
# Files to bring over?
# zsh_history
# project files
# todo.txt
# Desktop files not in icloud?
#

source install/dotfiles.sh
source install/brew.sh
