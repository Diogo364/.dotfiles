#!/bin/bash

SOURCER_FILE=".sourcer"

sourcer_init(){
    $EDITOR $SOURCER_FILE
}

sourcer(){
    source $SOURCER_FILE
}

[ -n "${SOURCER}" -a -f $SOURCER_FILE ] && sourcer
