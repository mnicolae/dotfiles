# File        : .kshrc
# Description : KSH config file
# Author      : Mihai Nicolae

. /wsdb/oemtools/share/kshrc

# because vi is best bro <3
set -o vi

if [[ $TERM = 'screen' ]];
then export COLUMNS=80;    # to avoid strange phenomena with screen
elif [[ $TERM = 'emacs' ]];# an emacs-type shell
then export COLUMNS=81;    # no point in setting big COLUMNS since has no effect on command line
#else export COLUMNS=98;   # to allow continuation of command line to wrap to new line
fi

#GSKCapiCmd path setup
export PATH=$PATH:$HOME/sqllib/gskit/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/sqllib/lib/gskit
export SHLIB_PATH=$SHLIB_PATH:$HOME/sqllib/lib/gskit

# GSkit
alias gsk='gsk8capicmd_64'

# ClearCase
alias lscos='ct lsco -cview -avobs'
alias svw='selview'

# build
alias ulvl='uselvl'

# debugger
alias tv='totalview& > /dev/null 2>&1'

# DB2 aliases
alias stt='db2start'
alias stp='db2stop'
alias sc='db2scope'

# DB2 db connection aliases
alias cdb='db2 connect to'
alias ddb='db2 disconnect'
alias deact='db2 deactivate db'
alias act='db2 activate db'
alias te='db2 terminate'

# db2 list aliases
alias lsdb='db2 list db directory'
alias lstab='db2 list tables'
alias lsnd='db list node directory'

# dbm cfg aliases
alias dbmcfgl='db2 get dbm cfg|less'
alias dbmcfg='db2 get dbm cfg'

# interactive versions of mv, cp, rm
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# ls variations
alias lr='ls -R'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias llm='ls -l | more'
alias llam='ls -la | more'
alias ls='ls -F'
alias lsl='ls|less'

# cmd-line editor
alias se='set -o emacs'
alias sv='set -o vi'

# echo env variables
alias display='echo $DISPLAY'

# launch xterm
alias x='xrdb -merge ~/.Xresources; xterm -T "hotellnx96" -n "hotellnx96 -- minimized" &'

# re-attach Screen
alias s='screen -r'

# Commexit-related aliases
alias drdafmt='echo /home/hotellnx96/mihain/sqllib/cfg/drdafmt.log > /home/hotellnx96/mihain/sqllib/cfg/drdafmt.cfg'
alias rtcommexit='echo /home/hotellnx96/mihain/sqllib/cfg/rtcommexit.log > /home/hotellnx96/mihain/sqllib/cfg/rtcommexit.cfg'

# Display the password of regression users
alias psswd='cat /wsdb/tools/test_pwd'

# my TMP folder
alias tmp='cd /TMP/mihain'

# engn navigation aliases
alias sqe='cd /vbs/engn/sqe'
alias sqf='cd /vbs/engn/sqf'
alias sqkf='cd /vbs/engn/sqkf'
alias sqkd='cd /vbs/engn/sqkd'
alias inc='cd /vbs/engn/include'
alias hdr='cd /vbs/engn/headers'
alias sqrl='cd /vbs/engn/sqrl'
alias sqt='cd /vbs/engn/sqt'
alias sqz='cd /vbs/engn/sqz'
alias sqo='cd /vbs/engn/sqo'
alias pd='cd /vbs/engn/pd'
alias sqno='cd /vbs/engn/sqno'
alias sqnx='cd /vbs/engn/sqnx'
alias sqng='cd /vbs/engn/sqng'
alias sqri='cd /vbs/engn/sqri'
alias sqr='cd /vbs/engn/sqr'
alias sqra='cd /vbs/engn/sqra'
alias sqnq='cd /vbs/engn/sqnq'
alias cfg='cd /vbs/engn/cfg'
alias sqer='cd /vbs/engn/sqer'
alias lib='cd /vbs/engn/lib'
alias sqm='cd /vbs/engn/sqm'
alias sqnn='cd /vbs/engn/sqnn'
alias sqng='cd /vbs/engn/sqng'
alias sqno='cd /vbs/engn/sqno'
alias sqd='cd /vbs/engn/sqd'
alias xmrn='cd /vbs/engn/xmrn'
alias sqmo='cd /vbs/engn/sqmo'
alias sqb='cd /vbs/engn/sqb'

# other navigation aliases
alias b='cd ..'
alias dmp='cd ${HOME}/sqllib/db2dump'

# default vim to gvim
alias vim='gvim'
