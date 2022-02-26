#!/bin/sh

nvim_config_file=~/.config/nvim
vim_config_file=~/.vimrc

# nvim config
if [ ! -L "$nvim_config_file" ]; then
  mkdir -p $nvim_config_file
  rm -rf $nvim_config_file
  echo "ln -s ~/.dotfiles/vim $nvim_config_file"
  ln -s ~/.dotfiles/vim "$nvim_config_file"
fi

# vim config
if [ ! -L "$vim_config_file" ]; then
  echo "ln -s ~/.dotfiles/vim/init.vim $vim_config_file"
  ln -s ~/.dotfiles/vim/init.vim "$vim_config_file"
fi

