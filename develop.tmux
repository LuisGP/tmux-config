tmux has-session -t develop
if [ $? != 0 ]
then
    tmux new-session -s develop -n vim -d
    tmux send-keys -t develop 'cd ~/git' C-m
    tmux send-keys -t develop 'clear' C-m
    tmux send-keys -t develop 'vim' C-m
    tmux split-window -v -p 10 -t develop
    tmux send-keys -t develop:1.2 'cd ~/git' C-m
    tmux send-keys -t develop:1.2 'clear' C-m
    tmux new-window -n console -t develop
    tmux send-keys -t develop:2 'cd ~/git' C-m
    tmux send-keys -t develop:2 'clear' C-m
    tmux select-pane -t develop:1.1
    tmux select-window -t develop:1
fi
tmux attach -t develop
