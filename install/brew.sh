echo 'Installing homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'Installing oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'Installing necessary applications'
brew install git fzf bash-completion tmux tree rg jq pgFormatter neovim diff-so-fancy reattach-to-user-namespace

