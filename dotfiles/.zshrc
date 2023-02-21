# If you come from bash you might have to change your $PATH.
export PATH="$HOME/Documents/Github/git-fuzzy/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/sbin/:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/mongodb-community@3.6/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="screen-256color"

export DISABLE_AUTO_TITLE=true
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ASYNC=false
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=false
SPACESHIP_PROMPT_PREFIXES_SHOW=true
SPACESHIP_PROMPT_SUFFIXES_SHOW=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
  poetry
  asdf
  gitfast
)

source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR="lvim"
# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias nvim="lvim"
alias zshconfig="lvim ~/.zshrc"
alias ohmyzsh="lvim ~/.oh-my-zsh"
alias zshreload="source ~/.zshrc"
alias gitfolder="cd ~/Documents/Github"
alias rmstopcontainer="docker ps -aq --no-trunc -f status=exited | xargs docker rm"
alias rmdanglingimage="docker images -q --filter dangling=true | xargs docker rmi"
alias kraken='open -na GitKraken --args -p "$(git rev-parse --show-toplevel)"'
alias vtop="vtop --theme monokai"
alias tx="tmuxinator"
alias pcli="perform-cli"
alias ll="exa -bhl --color always --icons -a -s type"
alias ls="exa -G --color auto --icons -a -s type"
alias dockersize='docker images --format "{{.ID}}\t{{.Size}}\t{{.Repository}}" | sort -k 2 -h'
# delete known_host for cultureamp ssh server
alias rmkh="sed -i '' '/cultureamp\.io/d' $HOME/.ssh/known_hosts"
alias checkstandardrb='bundle exec standardrb --fix $(git diff --name-only --diff-filter=d `git merge-base origin/master HEAD` | grep -E "(\.rb|^Gemfile)$" )'
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias "....."="cd ../../../.."

if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat -pp --theme="Nord"'
fi

# Git Fuzzy Alias
alias gs="git fuzzy status"
alias gd="git fuzzy diff"
alias glog="git fuzzy log"


# Powerlevel9k config
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv nvm dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_VIRTUALENV_BACKGROUND=107
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'
POWERLEVEL9K_VCS_FOREGROUND='021'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n "
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=">"

# Pyenv Config
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export WORKON_HOME=$HOME/.virtualenvs
# Configure pyenv to autoload the virtualenv
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"


# Added by serverless binary installer
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

# Prevent homebrew to no update everything when you run brew upgrade <package>.
# Only works on osx
export HOMEBREW_NO_INSTALL_CLEANUP=true

# Tell fzf to use ripgrep by default
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 30% --border'
fi

# Custom exec
source ~/.token-env
eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true


# Git Fuzzy
GIT_FUZZY_STATUS_ADD_KEY=Ctrl-S
GIT_FUZZY_STATUS_EDIT_KEY=Ctrl-E
GIT_FUZZY_STATUS_COMMIT_KEY=Ctrl-C
GIT_FUZZY_STATUS_RESET_KEY=Ctrl-R
GIT_FUZZY_STATUS_DISCARD_KEY=Ctrl-U

ITERM2_SQUELCH_MARK=1
source ~/.iterm2_shell_integration.zsh

unset NODE_ENV

# Load up default ssh key if not loaded
if ! ssh-add -L | grep -q "$USER"; then
  echo "🚨 No ssh key detected"
  if [ -s "$HOME/.ssh/id_rsa" ]; then
    ssh-add ~/.ssh/id_rsa
  else
    ssh-add ~/.ssh/id_ed25519
  fi
fi

# pnpm
export PNPM_HOME="/Users/martin.valentino/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
