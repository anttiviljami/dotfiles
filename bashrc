# Custom prompt
#export PS1="\u@\h:\[\033[36m\]\w\[\033[m\]\$ "
export PS1="viljami@work:\[\033[36m\]\w\[\033[m\]\$ "

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
#PROMPT_COMMAND="history -a; history -c; history -r;$PROMPT_COMMAND"
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

# use nuget with mono
alias nuget="mono /usr/local/bin/nuget.exe"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add .local/bin
export PATH="$PATH:$HOME/.local/bin"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# run GPG in terminal
export GPG_TTY=$(tty)

# prefer gnu sed
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"


# pnpm
export PNPM_HOME="~/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# gitlab container registry
# echo "$GLAB_PAT" | docker login registry.gitlab.com -u viljami.io --password-stdin
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
