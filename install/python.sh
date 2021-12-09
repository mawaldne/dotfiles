#! /bin/bash
echo 'Setting up pyenv'
eval "$(pyenv init -)"

PYENV_ROOT=`pyenv root`

pyenv global $PY2_V $PY3_V

# TODO
