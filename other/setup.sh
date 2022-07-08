if [ -f ~/.config/fish/config.fish ]; then
  rm ~/.config/fish/config.fish -f
fi
mkdir -p ~/.config/fish/
ln -s ~/.config/nvim/other/config.fish ~/.config/fish/


#config for tmuxinator
if [ -f ~/.config/tmuxinator/tm_cppdebug.yml ]; then
  rm ~/.config/tmuxinator/tm_cppdebug.yml -f
fi
mkdir -p ~/.config/tmuxinator/
ln -s ~/.config/nvim/other/tm_cppdebug.yml ~/.config/tmuxinator/


#config for alacritty
if [ -f ~/.config/alacritty/alacritty.yml ]; then
  rm ~/.config/alacritty/alacritty.yml -f
fi
if [ -f ~/.config/alacritty/alacritty_debug.yml ]; then
  rm ~/.config/alacritty/alacritty_debug.yml -f
fi
mkdir -p ~/.config/alacritty/
ln -s ~/.config/nvim/other/alacritty_debug.yml ~/.config/alacritty/
ln -s ~/.config/nvim/other/alacritty.yml ~/.config/alacritty/
