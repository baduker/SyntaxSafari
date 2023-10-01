#!/bin/bash

# This script is used to generate the list of files to be included in the project

# List of languages to be included in the project; add new languages here
languages=(Perl Go Rust C Bash AWK Erlang Zig V Haskell Wren C++)

# Loop through each language
for language in "${languages[@]}"; do
	if [ -d "$language" ]; then
		echo "Directory $language already exists, skipping..."
		continue
	fi

  mkdir -p "$language/code"

  touch "$language/NOTES.md"
  touch "$language/RESOURCES.md"
  touch "$language/DIARY.md"
done
