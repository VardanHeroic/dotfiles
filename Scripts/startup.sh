#!/bin/bash

tmux new-session -d -s vrdo -n nvim
tmux send-keys -t vrdo:nvim "cd ~/Works/Random" Enter
tmux send-keys -t vrdo:nvim "nvim" Enter
tmux new-window -t vrdo: -n npm
tmux send-keys -t vrdo:npm "cd ~/Works/Random" Enter
tmux attach -t vrdo:nvim
