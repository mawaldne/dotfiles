echo 'dotfiles'
rm -f ~/.aliases && ln -s dotfiles/.aliases ~/.aliases
rm -f ~/.ctags && ln -s dotfiles/.ctags ~/.ctags
rm -f ~/.gitconfig && ln -s dotfiles/.gitconfig ~/.gitconfig
rm -f ~/.githelpers && ln -s dotfiles/.githelpers ~/.githelpers
rm -f ~/.profile && ln -s dotfiles/.profile ~/.profile
rm -f ~/.tmux.conf && ln -s dotfiles/.tmux.conf ~/.tmux.conf
rm -f ~/.vimrc && ln -s dotfiles/.vimrc ~/.vimrc
rm -f ~/.zshrc && ln -s dotfiles/.zshrc ~/.zshrc
rm -f ~/.vim && ln -s dotfiles/.vim ~/.vim
rm -f ~/.irbrc && ln -s dotfiles/.irbrc ~/.irbrc
rm -f ~/.emacs.d && ln -s dotfiles/.emacs.d ~/.emacs.d
ln -s dotfiles/.emacs.d/.emacs ~/.emacs
