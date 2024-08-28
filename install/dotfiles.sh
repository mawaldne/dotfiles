echo 'dotfiles'
rm -f ~/.aliases && ln -s dotfiles/.aliases ~/.aliases
rm -f ~/.gitconfig && ln -s dotfiles/.gitconfig ~/.gitconfig
rm -f ~/.githelpers && ln -s dotfiles/.githelpers ~/.githelpers
rm -f ~/.profile && ln -s dotfiles/.profile ~/.profile
rm -f ~/.tmux.conf && ln -s dotfiles/.tmux.conf ~/.tmux.conf
rm -f ~/.vimrc && ln -s dotfiles/.vimrc ~/.vimrc
rm -f ~/.ideavimrc && ln -s dotfiles/.ideavimrc ~/.ideavimrc
rm -f ~/.zshrc && ln -s dotfiles/.zshrc ~/.zshrc
rm -f ~/.zprofile && ln -s dotfiles/.zprofile ~/.zprofile
rm -rf ~/.vim && ln -s dotfiles/.vim ~/.vim
rm -f ~/.config/nvim/init.vim && ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim
rm -f ~/.config/wezterm && ln -s ../dotfiles/wezterm/.config/wezterm ~/.config/wezterm
