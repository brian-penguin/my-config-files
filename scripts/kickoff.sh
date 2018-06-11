HOME_DIR=~/code/salsify/dandelion

#uncomment when starting a new dandelion session
tmux new-session -d -s dandy -c $HOME_DIR

tmux send-keys 'script/run_development_servers.sh -S -w 2' 'C-m'
tmux rename-window 'servers'

tmux split-window -h -c $HOME_DIR
# tmux send-keys 'script/build_client.sh -dv && rabbitmq-server start' 'C-m'
tmux send-keys 'script/build_client.sh -dv' 'C-m'
#tmux send-keys 'script/build_client.sh -dvw salsify' 'C-m'

tmux select-pane -t 1
#tmux split-window -v -c $HOME_DIR
#tmux send-keys 'rabbitmq-server start' 'C-m'
#tmux rename-window 'rabbit'

tmux select-pane -t 0
tmux split-window -h -c $HOME_DIR

#tmux send-keys 'gf && c && gst' 'C-m'
#tmux split-window -h -c $HOME_DIR

tmux send-keys 'script/run_development_servers.sh -WDPCE' 'C-m'
#tmux resize-pane -L 20

# This just kills time while things start
for i in `seq 1 3`; do
  echo "HI BRIAN!!!"
done

#Uncomment when starting a new dandelion session
tmux -2 attach-session -t dandy
