# Brian's Fish config circa 2019
#

# Don't say anything!
set fish_greeting

# Use nvim as the standard editor
# -x stands for export (or make an environment var)
set -x EDITOR 'nvim -f'

# Use ripgrep with FZF to make sure that follow things and respect the ignore
# - Check the ~/.ripgreprc file if you want to see what other things are set by default
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)set FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
set -x FZF_DEFAULT_COMMAND 'rg --files'

# Use ASDF as the standard package manager for ruby, elixir, and node
# source ~/.asdf/asdf.fish

# Setting some personal Alias's
alias c="clear"
alias v="nvim"
alias gitconf="nvim ~/.gitconfig"
alias fishconf="nvim ~/.config/fish/config.fish"
alias tmuxconf="nvim ~/.tmux.conf"
alias vimconf="nvim ~/.config/nvim/init.vim"

alias fishreload="source ~/.config/fish/config.fish"

alias bat="bat --theme OneHalfLight"
alias ls="exa"

alias gh="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

alias be="bundle exec"
alias bird="bundle install; bundle exec rake db:migrate; bundle exec rake db:test:prepare"
alias br="bin/rspec"

# --------------------------------------------------------------------
# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
# --------------------------------------------------------------------

# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source
# https://starship.rs/
starship init fish | source
