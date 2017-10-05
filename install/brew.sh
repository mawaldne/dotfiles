echo 'Installing homebrew'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew tap caskroom/versions

echo 'Installing necessary applications'
brew install git rbenv fzf nvm bash-completion python3 boost tmux homebrew/completions/tmuxinator-completion ag hub ansible
brew cask install docker slack iterm2 google-chrome dropbox

echo 'Installing oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo 'Installing Neovim'
brew install neovim/neovim/neovim
pip3 install neovim
cd ~/.config && ln -s ~/.vim nvim

echo 'Installing nvm'
mkdir -p ~/.nvm
export NVM_DIR="$HOME/.nvm"
ln -sf /usr/local/opt/nvm/nvm.sh $NVM_DIR/nvm.sh
source $NVM_DIR/nvm.sh

echo 'Installing rbenv'
eval "$(rbenv init -)"

echo 'Install emacs'
brew install emacs

open /Applications/Docker.app
