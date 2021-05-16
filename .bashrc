#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Login
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

# Created by `pipx` on 2021-05-12 21:20:51
export PATH="$PATH:/home/alexis/.local/bin"
