{pkgs, ...}: let
  tmux_sessionizer = pkgs.writeShellScriptBin "tmux-sessionizer" ''
    #!/bin/bash
    if [[ $# -eq 1 ]]; then
        selected=$1
    else
        selected=$(find ~/.config ~/dev ~/dev/repos ~/dev/repos/MSBarbieri -mindepth 0 -maxdepth 1 -type d -exec test -e '{}/.git' ';' -print -prune | fzf)
    fi

    if [[ -z $selected ]]; then
        exit 0
    fi

    selected_name=$(basename "$selected" | tr . _)
    tmux_running=$(pgrep tmux)
    sessions=$(tmux ls | awk '{split($1,a,":");print a[1]}')
    if [[ -z $TMUX ]] && [[ $sessions != *$selected_name* ]]; then
        tmux new-session -s $selected_name -c $selected
        exit 0
    fi

    if [[ -z $TMUX ]] && [[ -n $tmux_running ]]; then
        tmux attach-session -t $selected_name
        exit 0
    fi
    if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
        tmux new-session -s $selected_name -c $selected
        exit 0
    fi

    if ! tmux has-session -t=$selected_name 2> /dev/null; then
        tmux new-session -ds $selected_name -c $selected
    fi

    tmux switch-client -t $selected_name
  '';
in
  [tmux_sessionizer] ++ (import ./bootstrap.nix {inherit pkgs;})
