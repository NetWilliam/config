succeed=true

Error() {
    succeed=false
    echo -e "\e[31;1m [$1] \e[0m"
}

Info() {
    echo -e "\e[32;1m [$1] \e[0m"
}

CopyFile() {
    cp -r $1 $2

    if [ $? == 0 ]; then
        Info "$1 configurated done"
    else
        Error "$1 configurated error!"
    fi
}


CopyFile vimrc ~/.vimrc

if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi

CopyFile vim/\* ~/.vim

if [ $succeed == true ]; then
    Info "DONE!"
else
    Error "ERROR!"
fi
