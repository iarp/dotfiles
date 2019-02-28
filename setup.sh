cd ~
rm -f .screenrc
wget https://raw.githubusercontent.com/iarp/dotfiles/master/.screenrc
rm -f .vimrc
wget https://raw.githubusercontent.com/iarp/dotfiles/master/.vimrc
rm -f .gitignore_global
wget https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore -O .gitignore_global
rm -f .gitconfig
wget https://raw.githubusercontent.com/iarp/dotfiles/master/.gitconfig
sed -i 's/username/$USER/g' .gitconfig
