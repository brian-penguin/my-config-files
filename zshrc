# Path to your oh-my-zsh installation.
export ZSH=/Users/brian/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
ZSH_THEME="Spaceship"
SPACESHIP_BATTERY_ALWAYS_SHOW=false
#SPACESHIP_PROMPT_SYMBOL="➤"
SPACESHIP_PROMPT_SYMBOL="✚"
SPACESHIP_PROMPT_ADD_NEWLINE=false

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby rails zsh-syntax-highlighting)

# User configuration

# export PATH="/Users/brian/.rbenv/shims:/usr/local/bin:/Users/brian/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   # export EDITOR='vim'
   export EDITOR='nvim'
 fi

# Use localhost for all postgres on this machine
export PGHOST='localhost'

# For Rusty-tags
# Rust based extensions for ctags
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/

# Use VI mode in zsh
# bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias ta="tmux attach"
alias ko="kickoff.sh"
alias zshrc="v ~/.zshrc"
alias vimrc="v ~/.vimrc"
alias dandy="heroku run rails c -a dandelion-prod"
alias sdandy="heroku run rails c -a dandelion-staging"
alias zeus="heroku run rails c -a zeus-production"
alias szeus="heroku run rails c -a bootstrapping-staging"
alias senv="source .env"
#alias v="vim"
alias v="nvim"
alias c="clear"
alias bumpmem="sudo sysctl -w kern.sysv.shmall=65536 && sudo sysctl -w kern.sysv.shmmax=16777216"
alias pa='pry_mod.sh add;'
alias pr='pry_mod.sh remove;'
alias be='bundle exec'
alias bird='bundle install; rake db:migrate_all && rake db:test:prepare'
alias gcod='gco db*'
alias gh="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias sk8="salsifyk8s"
alias clean="git clean -xi"

# For disabling ctrl-s as terminal freeze
stty -ixon

# load NVM as a function
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# For Z indexing
. `brew --prefix`/etc/profile.d/z.sh

export GOPATH="$HOME/go"

export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
# export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/Library/Python/2.7/bin"
export PATH="$PATH:$HOME/code/salsify/potpourri/bin"
export PATH="$PATH:$HOME/opt/kafka/bin"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin"
export PATH="$PATH:/usr/local/opt/icu4c/bin"
export PATH="$PATH:/usr/local/opt/icu4c/sbin"

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# make the key timout 0.1s instead of 0.4s
export KEYTIMEOUT=1

export PATH="$HOME/.yarn/bin:$PATH"

source "/Users/brian/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
