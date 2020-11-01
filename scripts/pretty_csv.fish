#!/usr/bin/fish

function pretty_csv
  # We use sed here to add a space before the comma because on Mac, column command will merge empty cells
  # Which if we know anything about csv files, is wrong
  cat $argv | sed 's/,/ ,/g' | column -t -s, | less -S
end
