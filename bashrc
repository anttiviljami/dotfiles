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
HISTTIMEFORMAT="[%F %T] " # add time entry for .bash_history
HISTSIZE=1000000 # big big history
HISTFILESIZE=1000000 # big big history
shopt -s histappend # append to history, don't overwrite
shopt -s histverify # verify when using history
PROMPT_COMMAND="history -a; history -c; history -r;$PROMPT_COMMAND"
HISTCONTROL=ignoredups:ignorespace

shopt -s checkwinsize # auto window size

# Go away, cows
export ANSIBLE_NOCOWS=1

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


# Get aliases
. ~/.aliases

# Show git branch in prompt
. ~/.bashrc.git
