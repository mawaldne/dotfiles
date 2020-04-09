echo 'Installing homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'Installing necessary applications'
brew install git fzf bash-completion tmux tree ag jq ansible reattach-to-user-namespace python3

echo 'Installing oh-my-zsh'
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

echo 'Installing Neovim'
# needed for deoplete...
/usr/local/bin/pip3 install neovim --upgrade
brew install neovim

echo 'Installing Plug - Neovim and Vim'
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
