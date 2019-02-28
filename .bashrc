
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace:erasedups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Display the current Git branch when in a Git repo
if [ "\$(type -t __git_ps1)" ]; then
	PS1="\$(__git_ps1 '(%s) ')$PS1"
#	PS1="$PS1\$(__git_ps1 '(%s) ')"
fi

# Start keychain
# /usr/bin/keychain ~/.ssh/id_rsa
# source ~/.keychain/$HOSTNAME-sh

alias gp='git pull origin master'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias fuck='sudo $(history -p \!\!)'
