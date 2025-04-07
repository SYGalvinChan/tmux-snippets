get_option() {
	local res=$(tmux show-option -gqv "$1")
	echo "${res:-$2}"
}

script_dir=$(dirname "$0")
script_dir=$(
	cd "$script_dir"
	pwd
)

snippet_key=$(get_option "@snippet_key" p)
snippets_dir=$(get_option "@snippets_dir" "~/.snippets")
mkdir -p $snippets_dir
tmux bind $snippet_key run-shell "$script_dir/popup.sh"
