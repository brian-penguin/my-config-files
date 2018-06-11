#!/bin/bash

# This is V aggressive and will delete all (merged or not)
# I think there's some difference between since and before with git
# WARNING DONT USE THIS! IT DOESNT WORK AS EXPECTED
remove_branches_by_time () {
  # This comes from: https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script
  # It will delete all branches older than the before statement
  for k in $(git branch | sed /\*/d); do
    if [ -n "$(git log -1 --since='1 month ago' -s $k)" ]; then
      git branch -D $k
    fi
  done
}

# Delete all the stale references (where the remote has already cleaned up but we still have them in 'remotes/')
prune_origin () {
  git remote prune origin
}

# List out branches and if we've just pruned the remotes, delete if we have
# We might have a problem cause I'm not sure github actually deletes these branches
remove_local_branches_with_removed_remotes () {
  git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
}

# Another Suggestion from : https://railsware.com/blog/2014/08/11/git-housekeeping-tutorial-clean-up-outdated-branches-in-local-and-remote-repositories/
#comm -12  &lt;(git branch --merged|awk '{print($1)}') &lt;(git branch -r --merged|awk '{print($1)}'|awk -F \/ '{print($2)}')

clean () {
  prune_origin
  remove_local_branches_with_removed_remotes
}

echo "Deleting all branches that have removed remotes"
echo "continue? "
select yn in "Yes" "No"; do
  case $yn in
    Yes ) clean ; break;;
    No ) exit;;
  esac
done

