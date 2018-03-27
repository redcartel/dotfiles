mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
ln ../dotvimrc ~/.vimrc
ln ../dotinputrc ~/.inputrc
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
vim -s pluginupdate.vim
