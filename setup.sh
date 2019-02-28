cd ~
rm -f .screenrc
wget https://raw.githubusercontent.com/iarp/dotfiles/master/.screenrc
rm -f .vimrc
wget https://raw.githubusercontent.com/iarp/dotfiles/master/.vimrc
rm -f .gitignore_global
wget https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore -O .gitignore_global
rm -f .gitconfig
wget https://raw.githubusercontent.com/iarp/dotfiles/master/.gitconfig

# Replace the username in the gitconfig file with the currently logged in user
sed -i 's/username/$USER/g' .gitconfig -i

# Enable bash colouring by uncommenting force_color_prompt
sed '/force_color_prompt=yes/s/^# *//' .bashrc -i

# Remove lines from .bashrc that start with the following
sed '/^HISTSIZE/d' .bashrc -i
sed '/^HISTFILESIZE/d' .bashrc -i
sed '/^HISTCONTROL/d' .bashrc -i
sed '/^PROMPT_COMMAND/d' .bashrc -i

wget https://raw.githubusercontent.com/iarp/dotfiles/master/.bashrc -O .tmp_bashrc
cat .tmp_bashrc >> .bashrc
