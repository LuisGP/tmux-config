#!/bin/zsh

# Clear rbenv variables before starting tmux
unset RBENV_VERSION
unset RBENV_DIR

tmux start-server;

cd /home/luisgp/git

# Run on_project_start command.



  # Run pre command.
  
  
  # Run on_project_first_start command.
  

  # Create the session and the first window. Manually switch to root
  # directory if required to support tmux < 1.9
  TMUX= tmux new-session -d -s develop -n VIM
  tmux send-keys -t develop:1 cd\ /home/luisgp/git C-m


  # Create other windows.
  tmux new-window -c /home/luisgp/git -t develop:2 -n terminal


  # Window "VIM"
  tmux send-keys -t develop:1.1 vim C-m

  tmux splitw -c /home/luisgp/git -t develop:1
  tmux select-layout -t develop:1 tiled
  tmux send-keys -t develop:1.2 clear C-m

  tmux select-layout -t develop:1 tiled

  tmux select-layout -t develop:1 main-horizontal
  tmux select-pane -t develop:1.1


  # Window "terminal"
  tmux send-keys -t develop:2 clear C-m


  tmux select-window -t develop:1
  tmux select-pane -t develop:1.1

  if [ -z "$TMUX" ]; then
    tmux -u attach-session -t develop
  else
    tmux -u switch-client -t develop
  fi


    
# Run on_project_exit command.

