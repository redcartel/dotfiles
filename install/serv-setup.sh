mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
ln ../dotvimrc ~/.vimrc
ln ../dotinputrc ~/.inputrc
vim -s pluginupdate.vim
echo "IPADDR=\"\$(ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | tail -1 | cut -d: -f2 | awk '{print \$1}')\"" >> ~/.zshrc
echo "PROMPT=\$IPADDR:\$PROMPT" >> ~/.zshrc
