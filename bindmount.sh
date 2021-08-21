#!/bin/bash
# File mounted as: /etc/sftp.d/bindmount.sh
# Just an example (make your own)

function bindmount() {
    if [ -d "$1" ]; then
        mkdir -p "$2"
    fi
    mount --bind $3 "$1" "$2"
}

# Remember permissions, you may have to fix them:
# chown -R :users /data/common

# BIND DATA DIRECTORY TO USERS DIRECTORY
bindmount /data/musics /home/admin/musics
bindmount /data/files /home/admin/files
bindmount /data/musics /home/musicwrite/musics
bindmount /data/musics /home/musicread/musics --read-only
bindmount /data/files /home/filewrite/files
bindmount /data/files /home/fileread/files --read-only