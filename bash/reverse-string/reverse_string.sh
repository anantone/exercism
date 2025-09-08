#!/usr/bin/env bash

main () {
    echo "$1" | rev
}

main "$@"
