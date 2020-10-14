#! /bin/bash
echo 'Setting up pyenv'
eval "$(pyenv init -)"

PYENV_ROOT=`pyenv root`

if [ ! -d $PYENV_ROOT/plugins/pyenv-install-latest ]; then
    git clone https://github.com/momo-lab/pyenv-install-latest.git "$(pyenv root)"/plugins/pyenv-install-latest
fi

echo 'Installing python'
PY2_V=`pyenv install-latest --print 2.7 | tr -d '\n\r'`
PY3_V=`pyenv install-latest --print | tr -d '\n\r'`

if [ -d $PYENV_ROOT/versions/$PY2_V ]; then
    echo "Latest Python 2 Version ($PY2_V) Exists. Skipping installation."
else
    pyenv install -s $PY2_V
fi

if [ -d $PYENV_ROOT/versions/$PY3_V ]; then
    echo "Latest Python 3 Version ($PY3_V) Exists. Skipping installation."
else
    pyenv install -s $PY3_V
fi

pyenv rehash

# Sets the python 2 as the default with python 3 as the fallback
pyenv global $PY2_V $PY3_V

pip install --upgrade pip
pip3 install --upgrade pip
pip install pip-tools virtualenv virtualenvwrapper python-language-server pipenv

echo 'Setting up neovim python environments'
if [ -d $PYENV_ROOT/versions/neovim2 ]; then
    echo "Neovim python 2 environment exists. Removing."
    pyenv uninstall -f neovim2
fi
pyenv virtualenv $PY2_V neovim2
pyenv activate neovim2
pip install --upgrade pip
pip install neovim

if [ -d $PYENV_ROOT/versions/neovim3 ]; then
    echo "Neovim python 3 environment exists. Removing."
    pyenv uninstall -f neovim3
fi
pyenv virtualenv $PY3_V neovim3
pyenv activate neovim3
pip install --upgrade pip
pip install neovim

pyenv deactivate
