# Tmux Snippets
This plugin allows you to store commonly used commands in a `.yaml` file and access them using a tmux menu.

This is especially useful if combined with git to allow multiple computers to share the same snippets directory

## Installation

Install using (TPM)[https://github.com/tmux-plugins/tpm]:

```
set -g @plugin 'SYGalvinChan/tmux-snippets'
```

## Prerequisite
This plugin depends on (yq)[https://github.com/mikefarah/yq]


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

Refer to `cmds/basic.yaml` for example.

## Snippet Directory
This plugin will read snippet files from a directory. A nested directory structure is allowed. 
```
.snippet (can be configured)
├── dir
│   ├── file3.yaml
│   └── file4.yaml
├── file1.yaml
└── file2.yaml
```
