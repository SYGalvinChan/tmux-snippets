# Tmux Snippets
This plugin allows you to store commonly used commands in a `.yaml` file and access them using a tmux menu.

This is especially useful if combined with git to allow multiple computers to share the same snippets directory

## Installation

Install using `TPM`:

```
set -g @plugin 'SYGalvinChan/tmux-snippets'
```


## Options

| Option Name | Default | Description|
| --- | --- | --- |
| `@snippet_key` | `P` | Key binding used to open the snippet menu |
| `@snippets_dir` | `~/.snippets` | Directory where all the snippet files are stored |

## Snippet File
A snippet file is a `.yaml` file containing a list of `snippet`.

A `snippet` has 3 fields: `name`, `shortcut`, `command`.

Note:
Take care to use yaml escape blocks for `command` if there are special characters.

## Snippet Directory
This plugin will read snippet files from a directory. A nested directory structure is allowed. 
