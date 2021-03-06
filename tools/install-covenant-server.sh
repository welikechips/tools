#!/bin/bash

sudo su
cd ~
git clone --recurse-submodules https://github.com/cobbr/Covenant
wget https://download.visualstudio.microsoft.com/download/pr/c1a30ceb-adc2-4244-b24a-06ca29bb1ee9/6df5d856ff1b3e910d283f89690b7cae/dotnet-sdk-3.1.302-linux-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-3.1.302-linux-x64.tar.gz -C $HOME/dotnet
echo "export DOTNET_ROOT=$HOME/dotnet" >> ~/.bashrc
echo "export PATH=$PATH:$HOME/dotnet" >> ~/.bashrc

SESSION=covenant
tmux -2 new-session -d -s $SESSION
# Setup a window for starting covenant server
tmux split-window -h
tmux select-pane -t 1
tmux send-keys "cd ~/Covenant/Covenant && dotnet run" C-m
tmux select-pane -t 2
tmux send-keys "curl ip.42.pl/raw" C-m

