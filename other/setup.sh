#!/bin/bas#config for fish
if [ -f ~/.config/fish/config.fish ]; then
  rm ~/.config/fish/config.fish -f
  mkdir -p ~/.config/fish/
  ln -s ~/.config/nvim/other/config.fish ~/.config/fish/
fi


#config for tmuxp
if [ -f ~/.config/tmuxp/cppdebug.yml ]; then
  rm ~/.config/tmuxp/cppdebug.yml -f
  mkdir -p ~/.config/tmuxp/
  ln -s ~/.config/nimv ~/.config/fish/
  ln -s ~/.config/nvim/other/cppdebug.yml ~/.config/nvim/other/
fi
