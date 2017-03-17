# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.alias ]; then
	. ~/.alias
fi

case $SHELL in
	/bin/bash)
		PS1='\u@\h \w \$ '
		;;
	*)
		PS1='@declips $ '
		;;
esac

MAKE=`type -p make`
MKDIR=`type -p mkdir`
SED=`type -p sed`
TMPDIR=/var/tmp
TTY=`type -p tty`
UNAME=`type -p uname`
OS=`${UNAME} -s`
ARCH=`${UNAME} -m`

case ${OS} in

	'Linux')

		case ${ARCH} in

			'armv6l'|'armv7l'|'i686'|'x86_64')
				GREP=/bin/grep
				;;

			'x86_64')
				GREP=/usr/bin/grep
				;;

		esac
		;;

	'Darwin')
		GREP=/usr/bin/grep
		;;

esac

if [ `echo $- | ${GREP} -i -c i` = 1 ] 
then
	_tty=`${TTY} | ${SED} -e 's/\/.*\///g'`
	HISTDIR=$HOME/.history/`hostname`/`tty | ${SED} -e 's/\/.$//' | ${SED} -e 's/\/.*\///g'`
	if [ ! -d ${HISTDIR} ]
	then
		${MKDIR} -p ${HISTDIR}
	fi
	HISTFILE=$HISTDIR/${_tty}
	HISTCONTROL="ignoreboth"
fi

CDPATH=.:$HOME:/var
PROMPT_DIRTRIM=2
EDITOR=`type -p vi`
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64
LESS="eMis"
LESSHISTFILE="-"
MAILCHECK=0
MANPATH=/usr/kerberos/man:/usr/share/man/de:$MANPATH
PAGER=/usr/bin/less
PATH=$PATH:/sbin:/usr/sbin:$HOME/bin:$HOME/mongoDB/bin:.
PGPPATH=$HOME/.gnupg

export HISTCONTROL HISTFILE PS1 CDPATH LESS PAGER MAKE PGPPATH EDITOR
export LESSHISTFILE PROMPT_DIRTRIM MAILCHECK

##
#
# JAVA Stuff
#
## 
CLASSPATH=${CLASSPATH}:.

export CLASSPATH

##
#
# PostgreSQL Variablen für die PostgreSQL puppetdb
#
##
PGDATABASE=puppetdb

export PGDATABASE

#
##
## Sprach- und Kodierungssettings
##
#
unset LANG
LC_ALL="en_US.UTF-8"

export LC_ALL
