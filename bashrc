#
# ~/.bashrc
#

[[ $- != *i* ]] && return


colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

PS1="\# \[\e[0;36m\][\t]\[\e[0;m\]\[\e[0;32m\]\u@\h\[\e[0;m\]:\[\e[1;35m\]\w\[\e[0;m\]\[\e[1;32m\]\$\[\e[0;m\] "
PS1="\# \[\e[0;36m\][\t]\[\e[0;m\]\[\e[0;31m\]\u@\h\[\e[0;m\]:\[\e[1;35m\]\w\[\e[0;m\]\[\e[1;31m\]\$\[\e[0;m\] "
 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


