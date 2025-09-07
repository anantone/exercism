#!/usr/bin/env bash

TOTAL_GRAINS_ON_BOARD=18446744073709551615

main () {
    if [ $1 == ""total"" ]; then
      echo "$TOTAL_GRAINS_ON_BOARD"
    elif [[ $1 -gt 0 && $1 -lt 65 ]]; then
      bc <<< "2^($1-1)"
    else 
      echo "Error: invalid input" >&2
      exit 1
    fi
}

main "$@"
