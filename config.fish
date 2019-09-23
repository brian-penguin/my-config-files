# Brian's Fish config circa 2019
#

# Don't say anything!
set fish_greeting

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)set FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Use nvim as the standard editor
# -x stands for export (or make an environment var)
set -x EDITOR 'nvim -f'

# Use ripgrep with FZF to make sure that follow things and respect the ignore
# - Check the ~/.ripgreprc file if you want to see what other things are set by default
set -x FZF_DEFAULT_COMMAND 'rg --files'

# Use ASDF as the standard package manager for ruby, elixir, and node
source ~/.asdf/asdf.fish

# Setting some personal Alias's
alias c="clear"
alias v="nvim"
alias gitconf="nvim ~/.gitconfig"
alias fishconf="nvim ~/.config/fish/config.fish"
alias tmuxconf="nvim ~/.tmux.conf"
alias vimconf="nvim ~/.config/nvim/init.vim"

alias fishreload="source ~/.config/fish/config.fish"

alias cat="bat --theme OneHalfLight"

alias gh="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

alias be="bundle exec"
alias bird="bundle install; bundle exec rake db:migrate; bundle exec rake db:test:prepare"

set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/libxml2/bin" $fish_user_paths
# This adds chromedriver to the fish path. This is chromedriver v 74. Remove that executable if you want to install a new version
set -g fish_user_paths "~/scripts/scripts/chromedriver " $fish_user_paths
