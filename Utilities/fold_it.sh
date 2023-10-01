#!/usr/bin/env bash

# This script 'folds' lines in a Markdown file at a given column width.
# By default, it folds at 80 characters.

DEFAULT_COLUMN_WIDTH=80

#######################################
# script's usage
# Globals:
#   DEFAULT_COLUMN_WIDTH
# Arguments:
#   None
#######################################
usage() {
  echo "Usage: $0 [-w column_width] [-b] file"
  echo "  -w    Specify column width (default: $DEFAULT_COLUMN_WIDTH)"
  echo "  -b    Backup the original file"
  echo "  file  Markdown file to fold"
  exit 1
}

# Check for command line options
while getopts ":w:b" opt; do
  case $opt in
    w)
      column_width="$OPTARG"
      ;;
    b)
      backup=true
      ;;
    *)
      usage
      ;;
  esac
done

# Shift off the options and operands
shift $((OPTIND - 1))

# If no file is specified, display usage and exit
if [ $# -eq 0 ]; then
  usage
fi

# Check if file exists
if [ ! -f "$1" ]; then
  echo "Error: File '$1' not found."
  exit 1
fi

# If column width wasn't specified, use default
column_width=${column_width:-$DEFAULT_COLUMN_WIDTH}

# Backup the original file if requested
if [ "$backup" = true ]; then
  cp "$1" "$1.bak"
fi

# Fold the file
fold -s -w "$column_width" "$1" >"$1.tmp" && mv "$1.tmp" "$1"

echo "File '$1' folded at column width $column_width."

exit 0
