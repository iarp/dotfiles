cd ~

rm -f .screenrc
rm -f .vimrc
rm -f .gitignore_global
rm -f .gitconfig

wget https://raw.githubusercontent.com/iarp/dotfiles/master/.screenrc
wget https://raw.githubusercontent.com/iarp/dotfiles/master/.vimrc
wget https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore -O .gitignore_global
wget https://raw.githubusercontent.com/iarp/dotfiles/master/.gitconfig
wget https://raw.githubusercontent.com/iarp/dotfiles/master/.bashrc -O .tmp_bashrc

# Replace the username in the gitconfig file with the currently logged in user
echo "Set username in gitconfig to $USER"
sed "s/username/$USER/g" .gitconfig -i

# Enable bash colouring by uncommenting force_color_prompt
echo "Enable bash line colour prompt"
sed '/force_color_prompt=yes/s/^# *//' .bashrc -i

# Remove lines from .bashrc that start with the following
echo "Removing HISTSIZE, HISTFILESIZE, HISTCONTROL, PROMPT_COMMAND from .bashrc"
sed '/^HISTSIZE/d' .bashrc -i
sed '/^HISTFILESIZE/d' .bashrc -i
sed '/^HISTCONTROL/d' .bashrc -i
sed '/^PROMPT_COMMAND/d' .bashrc -i

echo "Copying commands from .tmp_bashrc to .bashrc"
cat .tmp_bashrc >> .bashrc

echo "Generating ssh key"
ssh-keygen -t rsa -C "$USER@$HOSTNAME"
curl https://github.com/iarp.keys >> ~/.ssh/authorized_keys

sudo apt update
sudo apt install -y screen git
sudo apt upgrade
