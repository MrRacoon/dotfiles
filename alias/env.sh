ssh-id-copy () {
    [[ -z $1 ]] && echo "You must provide a hostname" && exit
    if [[ -z $2 ]]; then
        cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir .ssh/ 2> /dev/null; cat >> ~/.ssh/authorized_keys"
    else
        cat $2 | ssh $1 "mkdir .ssh/; cat >> ~/.ssh/authorized_keys"
    fi
}

ssh-id-new () {
    ssh-keygen -b 4096 -C "$USER@$HOST" -a 1000
}
