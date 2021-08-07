#!/bin/bash

if [ ! -f ~/.google_authenticator ]; then
    /usr/local/bin/google-authenticator -t -f -d --label="${USER}@ubuntu" --qr-mode=ANSI -r 3 -R 30 -w 1 --secret=/home/${USER}/.google_authenticator
fi
