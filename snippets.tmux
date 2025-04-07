#!/usr/bin/env bash

get_option() {
	local res=$(tmux show-option -gqv "$1")
	echo "${res:-$2}"
}

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

snippet_key=$(get_option "@snippet_key" p)
snippets_dir=$(get_option "@snippets_dir" "~/.snippets")

mkdir -p ~/.snippets
tmux bind p run-shell "$CURRENT_DIR/popup.sh ~/.snippets"
