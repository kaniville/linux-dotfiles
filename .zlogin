# Launch Sway
if [[ -z $DISPLAY ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
    exec sway
fi

# Launch Tmux
if [ -n $SSH_CLIENT ]; then
    if [ -z $TMUX ]; then
	    tmux attach || tmux new
    fi
fi
