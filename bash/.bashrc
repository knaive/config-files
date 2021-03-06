# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# some aliases added by myself
alias gvim='gvim -f'
alias em='emacs -nw'
alias rm='rm -i'
alias tmux="TERM=screen-256color-bce tmux"
alias cp='cp -i'
alias mv='mv -i'
alias zhcon='zhcon --utf8 --drv=fb'
alias cd1='cd ~/Desktop'
alias cd2='cd ~/Downloads'
alias cd3='cd ~/ns-allinone-2.35/ns-2.35'
# some more ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
# Alias definitions.


# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#make man page multi colored
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'

#set varialbe for cscope
export CSCOPE_DB=~/.cscopedb/cscope.out
#export ECLIPSE_HOME=~/bin/eclipse-eclim-3.7

#export JAVA_HOME=/usr/local/java/jdk1.6.0_43
export HADOOP_HOME=~/hadoop

export PATH="$PATH:/home/wfg/ns2/bin:/home/wfg/ns2/tcl8.5.10/unix:/home/wfg/ns2/tk8.5.10/unix" 
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/wfg/ns2/otcl-1.14, /home/wfg/ns2/lib" 
export TCL_LIBRARY="$TCL_LIBRARY:home/wfg/ns2/tcl8.5.10/library"

#export CLASSPATH=.:$JAVA_HOME/lib
export PATH=$PATH:$HADOOP_HOME/bin:$ECLIPSE_HOME
export PATH=$PATH:/usr/local/bro/bin
export HADOOP_HOME_WARN_SUPPRESS=”TRUE”
export GTK IM MODULE=xim
export XMODIFIERS="@im=fcitx"
export QT IM MODULE=xim

#To enable fcitx in emacs, LC_CTYPE must be set as follows:
#export LC_CTYPE="zh_CN.UTF-8"
#run emacs as daemon
export ALTERNATE_EDITOR=""
export EDITOR=emacsclient

xmodmap -e "clear Lock" -e "keycode 66 = Escape"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
