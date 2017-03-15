if [ "${TERM}" != "xterm" ] || [ "${SSH_CLIENT}" != "" ]
then
	if [ -f ~/.bashrc ]
	then
		. ~/.bashrc
	fi
	if [ -f ~/.cookie ]
	then
		cat ~/.cookie
	fi

fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
