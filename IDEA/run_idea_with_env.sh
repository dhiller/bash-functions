#!/bin/bash

case "$1" in
    current|eap)
        ;;
    *)
        echo "Usage: $0 <current|eap>"
        exit 1
        ;;
esac

. ~/.wkd/auth

export IDEA_VM_OPTIONS="/opt/IDEA/idea.vmoptions"

/opt/IDEA/$1/bin/idea.sh
