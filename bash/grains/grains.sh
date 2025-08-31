#!/usr/bin/env bash

main () {
    if [[ $1 > 0 && $1 < 65 ]]; then
      echo $(echo "2^($1-1)" | bc)
    elif [ $1 == "total" ]; then
      sum=0
      for ((i = 0 ; i < 64 ; i++)); do
        sum=$(echo "$sum + 2 ^ $i" | bc)
      done
      echo "$sum"
    else 
      echo "Error: invalid input"
      exit 1
    fi
}

main "$@"
