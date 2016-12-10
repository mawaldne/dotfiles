echo 'Installing ruby'
rbenv install 2.3.1
rbenv global 2.3.1

echo 'Installing global gems'
gem install bundler tmuxinator
