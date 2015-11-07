# Custom prompt
export PS1="\u@\h:\[\033[36m\]\w\[\033[m\]\$ "

# Editor
export EDITOR='vim'

# Add colours
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# save history in real time
# idea from http://www.cuberick.com/2008/11/update-bash-history-in-realtime.html
# http://stackoverflow.com/questions/103944/real-time-history-export-amongst-bash-terminal-windows
HISTTIMEFORMAT="[%F %T] "        # time entry for .bash_history
HISTSIZE=1000000                  # big big history
HISTFILESIZE=1000000              # big big history
shopt -s histappend              # append to history, don't overwrite
shopt -s histverify             # verify when using history
PROMPT_COMMAND="history -a; history -c; history -r;$PROMPT_COMMAND"
HISTCONTROL=ignoredups:ignorespace

# Go away, cows
export ANSIBLE_NOCOWS=1

# Show git branch in prompt
. ~/.bashrc.git
