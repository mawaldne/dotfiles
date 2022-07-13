echo 'dotfiles'
rm -f ~/.aliases && ln -s dotfiles/.aliases ~/.aliases
rm -f ~/.ctags && ln -s dotfiles/.ctags ~/.ctags
rm -f ~/.gitconfig && ln -s dotfiles/.gitconfig ~/.gitconfig
rm -f ~/.githelpers && ln -s dotfiles/.githelpers ~/.githelpers
rm -f ~/.profile && ln -s dotfiles/.profile ~/.profile
rm -f ~/.tmux.conf && ln -s dotfiles/.tmux.conf ~/.tmux.conf
rm -f ~/.vimrc && ln -s dotfiles/.vimrc ~/.vimrc
rm -f ~/.zshrc && ln -s dotfiles/.zshrc ~/.zshrc
rm -rf ~/.vim && ln -s dotfiles/.vim ~/.vim
rm -rf ~/.tools-version && ln -s dotfiles/.tools-version ~/.tools-version
rm -f ~/.config/nvim/init.vim && ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim
