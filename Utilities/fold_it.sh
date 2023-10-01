#!/bin/bash

: "
This script 'folds' lines in a Markdown file at a given column width.
By default, it folds at 80 characters.

It takes one argument, the file to fold. It does its thing, outputs the result
to a temporary file, and then replaces the original file with the temporary one.

It's not perfect, but it works well enough for my purposes.
"

column_width=80

if [ $# -eq 0 ]; then
		echo "No file specified."
		exit 1
fi

fold -s -w $column_width "$1" > "$1".tmp && mv "$1".tmp "$1"
