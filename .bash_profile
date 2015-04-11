# File        : .bash_profile
# Description : bash config file for my Macbook
# Author      : Mihai Nicolae

# Because VIM on the Terminal is best bro <3
set -o vi

export CLICOLOR=1
export EDITOR="vi"

export GRADLE_HOME="/Applications/gradle-2.2.1"
export JAVA_HOME=`/usr/libexec/java_home`

PATH=$PATH:$GRADLE_HOME

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

# Navigation aliases
alias b="cd .." 

# Git aliases
alias ga='git add'
alias gai='git add -i'
alias gc='git commit'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git merge --no-ff'
alias gst='git status -s'

# SSH aliases
alias cdf="ssh g1mihai@cdf.utoronto.ca"
alias eos="ssh g1mihai@eos.cs.toronto.edu" 
alias hydra="ssh g1mihai@hydra.isl.sandbox"

# Human readable directory sizes for current dir, sorted descending
alias du_cwd="du -hsx * | sort -r"

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
