if [ -f ~/.config/fish/config.fish ]; then
  rm ~/.config/fish/config.fish -f
fi
mkdir -p ~/.config/fish/
ln -s ~/.config/nvim/other/config.fish ~/.config/fish/


#config for tmuxp
if [ -f ~/.config/tmuxp/tm_cppdebug.yml ]; then
  rm ~/.config/tmuxp/tm_cppdebug.yml -f
fi
mkdir -p ~/.config/tmuxp/
ln -s ~/.config/nvim/other/tm_cppdebug.yml ~/.config/tmuxp/


#config for alacritty
if [ -f ~/.config/alacritty/alacritty.yml ]; then
  rm ~/.config/alacritty/alacritty.yml -f
fi
if [ -f ~/.config/alacritty/alacritty_debug.yml ]; then
  rm ~/.config/alacritty/alacritty_debug.yml -f
fi
mkdir -p ~/.config/alacritty/
ln -s ~/.config/nvim/other/alacritty_debug.yml ~/.config/alacritty/
