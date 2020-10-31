#!/usr/bin/env bash --login -i

undo() {
  sed -i .bak "/  gem \'pry\'/d" Gemfile
  sed -i .bak "/  gem \'pry-byebug\'/d" Gemfile
  sed -i .bak "/  gem \'pry-remote\'/d" Gemfile
  sed -i .bak "/  gem \'pry-rails\'/d" Gemfile
  sed -i .bak "/  gem \'pry-doc\'/d" Gemfile
  sed -i .bak "/  gem \'pry-docmore\'/d" Gemfile
  sed -i .bak "/  gem \'pry-stack_explorer\'/d" Gemfile
  sed -i .bak "/  gem \'pry-macro\'/d" Gemfile
  sed -i .bak "/  gem \'pry-bloodline\'/d" Gemfile
  sed -i .bak "/  gem \'pry-state\'/d" Gemfile
  rm Gemfile.bak
}

add() {
  # cp Gemfile Gemfile.old;

  awk "/dotenv-rails/ { print; print \"  gem 'pry'\n  gem 'pry-bloodline'\n  gem 'pry-macro'\n  gem 'pry-state'\n  gem 'pry-stack_explorer'\n  gem 'pry-doc'\n  gem 'pry-docmore'\n  gem 'pry-remote'\n  gem 'pry-rails'\n  gem 'pry-byebug'\"; next }1" Gemfile > Gemfile.new;

  mv Gemfile.new Gemfile;
}

run_ag() {
  ag --ignore client --ignore db --ignore tmp --ignore assets --ignore bower_components --ignore vendor --vimgrep --smart-case -Q $1
}

remove_bindings() {
  run_ag "binding.pry" | gitgreppath.sh | xargs -I {} sed -i .bak "/binding\.pry/d" {}
}

remove_requires() {
  run_ag "require 'pry'" | gitgreppath.sh | xargs -I {} sed -i .bak "/require \'pry\'/d" {}
}

remove_bak_ups() {
  git status | grep \.bak | xargs -I {} rm {}
}

clean_up_pry() {
  remove_bindings
  remove_requires
  remove_bak_ups
}

add_target_schema_writes() {
  rotate_target_schema_writers -a
}

remove_target_schema_writers() {
  rotate_target_schema_writers -r
}

if [ "$1" = "add" ]; then
 add
 bundle install --jobs 16 --local --no-prune --verbose
elif [ "$1" = "remove" ]; then
  undo
  clean_up_pry
  bundle install --jobs 16 --local --no-prune --verbose
elif [ "$1" = "clean" ]; then
  clean_up_pry
elif [ "$1" = "gems" ]; then
  add
elif [ "$1" = "install" ]; then
  bundle install --jobs 8
else
  echo "please enter cmd add or remove"
fi
