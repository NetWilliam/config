
CopyFile() {
    cp -r $1 $2

    if [ $? == 0 ]; then
        echo "$1 configurated done!"
    else
        echo "$1 configurated error!"
    fi
}


CopyFile vimrc ~/.vimrc

if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi
CopyFile colors ~/.vim

echo Done
