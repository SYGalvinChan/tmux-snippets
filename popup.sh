#!/bin/bash

function handle_dir {
    local dir="$1"
    local items=("$dir"/*)

    local menu_items=()
    for i in "${!items[@]}"; do
        menu_items+=("$(basename "${items[$i]}")")
        menu_items+=("$i")
        menu_items+=("run '$0 ${items[$i]}'")
    done

    if [ ${#menu_items[@]} -eq 0 ]; then
        tmux display-message "Empty directory: $dir"
    else
        tmux display-menu "${menu_items[@]}"
    fi
}

function handle_file {
    local file="$1"

    local menu_items=()
    local commands_count=$(yq e '. | length' $file)
    for ((i=0; i<commands_count; i++)); do
        name=$(yq e ".[$i].name" $file)
        shortcut=$(yq e ".[$i].shortcut" $file)
        menu_items+=("$name")
        menu_items+=("$shortcut")
        menu_items+=("run '$0 $file $i'")
    done

    if [ ${#menu_items[@]} -eq 0 ]; then
        tmux display-message "empty file: $file"
    else
        tmux display-menu "${menu_items[@]}"
    fi
}

function handle_command {
    local file="$1"
    local index="$2"
    local cmd=$(yq e ".[$index].command" $file)

    tmux send-keys "$cmd"
    tmux send-keys "C-m"
}

# Verify yq installed
if ! command -v yq >/dev/null 2>&1; then
    tmux display-message "yq is not installed"
    echo "fatal: yq is not installed"
    exit 1
fi


if [ -d "$1" ]; then
    handle_dir "$1"
elif [ $# -eq 1 ]; then
    handle_file $1
else
    handle_command $1 $2
fi
