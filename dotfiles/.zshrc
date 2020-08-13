# If you come from bash you might have to change your $PATH.
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="$HOME/Documents/Github/git-fuzzy/bin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export DISABLE_AUTO_TITLE=true
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="spaceship"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  direnv
  zsh-autosuggestions
  zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR="nvim"
# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshreload="source ~/.zshrc"
alias gitfolder="cd ~/Documents/Github"
alias rmstopcontainer="docker ps -aq --no-trunc -f status=exited | xargs docker rm"
alias rmdanglingimage="docker images -q --filter dangling=true | xargs docker rmi"
alias kraken='open -na GitKraken --args -p "$(git rev-parse --show-toplevel)"'
alias vtop="vtop --theme monokai"
alias tx="tmuxinator"
alias pcli="perform-cli"
alias bfr=$HOME/code/cultureamp/big-frontend-repo/bin/cli
alias ls="exa -bhl"

# Git Fuzzy Alias
alias gs="git fuzzy status"
alias gd="git fuzzy diff"
alias glog="git fuzzy log"

. $HOME/.asdf/asdf.sh

export PATH="/usr/local/opt/mongodb-community@3.6/bin:$PATH"

# Powerlevel9k config
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv nvm dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

## Color
POWERLEVEL9K_VIRTUALENV_BACKGROUND=107
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'
POWERLEVEL9K_VCS_FOREGROUND='021'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n "
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=">"


export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export WORKON_HOME=$HOME/.virtualenvs

# Configure pyenv to autoload the virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
export NVIM_COC_LOG_LEVEL=debug
export PATH="/usr/local/sbin:$PATH"

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
export LOGLVL=ERROR

# Git Fuzzy
export GIT_FUZZY_STATUS_ADD_KEY=Ctrl-S
export GIT_FUZZY_STATUS_EDIT_KEY=Ctrl-T
export GIT_FUZZY_STATUS_COMMIT_KEY=Ctrl-Q
export GIT_FUZZY_STATUS_RESET_KEY=Ctrl-R
export GIT_FUZZY_STATUS_DISCARD_KEY=Ctrl-U
# for `git fuzzy log`
export GF_LOG_MENU_PARAMS='--pretty="%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --topo-order'
# when diffing with branches or commits for preview
export GF_DIFF_COMMIT_PREVIEW_DEFAULTS="--patch-with-stat"
# when diffing with branches or commits for preview
export GF_DIFF_COMMIT_RANGE_PREVIEW_DEFAULTS="--summary"
# when diffing individual files
export GF_DIFF_FILE_PREVIEW_DEFAULTS="--indent-heuristic"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Prevent homebrew to no update everything when you run brew upgrade <package>.
# Only works on osx
export HOMEBREW_NO_INSTALL_CLEANUP=true

# Tell fzf to use ripgrep by default
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 30% --border'
fi

