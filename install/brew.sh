echo 'Installing homebrew'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew tap caskroom/versions

echo 'Installing necessary applications'
brew install git rbenv nvm bash-completion python3 boost tmux homebrew/completions/tmuxinator-completion ag hub
brew cask install docker slack iterm2 google-chrome dropbox

echo 'Installing oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo 'Installing Neovim'
brew install neovim/neovim/neovim
pip3 install neovim
cd ~/.config && ln -s ~/.vim nvim

