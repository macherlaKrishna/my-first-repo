#!/usr/bin/env bash
# guessinggame.sh — continuously prompt until the user guesses file count.
# Usage: bash guessinggame.sh

# Return the count of regular files in the current directory (includes dotfiles).
get_file_count() {
  find . -maxdepth 1 -type f | wc -l
}

# Check if input is a nonnegative integer.
is_integer() {
  [[ "$1" =~ ^[0-9]+$ ]]
}

# Prompt helper.
prompt() {
  echo "How many files are in the current directory?"
  printf "Enter your guess: "
}

main() {
  local target guess
  target="$(get_file_count)"

  while true; do
    prompt
    read -r guess

    if ! is_integer "$guess"; then
      echo "Please enter a non-negative integer."
      continue
    fi

    if (( guess < target )); then
      echo "Too low! Try again."
    elif (( guess > target )); then
      echo "Too high! Try again."
    else
      echo "ð Congratulations! $guess is correct."
      break
    fi
  done
}

main
