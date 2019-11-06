set up Dein for neovim:

```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
installer.sh ~/.cache/dein
```

set up Vundle for vim:

```
mkdir -p ~/.vimr/bundle
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim


link the config files

```
ln dotvimrc ~/.vimrc

mkdir -p ~/.config/nvim
ln nviminit ~/.config/nvim/init.vim
```

nvim config needs a nerd font terminal

in vim:
:PluginInstall()

in nvim:
:call dein#install()

might want to clone Redrc.vim into the dotfiles vim directory
git clone git@github.com:redcartel/Redrc.vim
ln -s Redrc.vim/pl

look at other_installs for langserver installation (needed for plugins)
