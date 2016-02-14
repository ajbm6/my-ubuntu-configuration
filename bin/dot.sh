#/bin/bash
if [[ ! $INSTALL_SCRIPT ]]; then
    echo "    ERROR: You must use the ./install.sh script"
    exit
fi

cp $PROJECT_FILE_PATH/.vimrc ~
cp $PROJECT_FILE_PATH/.bashrc ~
cp $PROJECT_FILE_PATH/.gitignore ~
cp $PROJECT_FILE_PATH/.hgignore ~
cp $PROJECT_FILE_PATH/.gitconfig ~
cp $PROJECT_FILE_PATH/.exports ~

# Reload bash config
source ~/.bashrc

# install vundle (form vim plugins)
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "    SUCCESS: Complete! Make sure to $ source ~/.bashrc"
echo "    SUCCESS: You may also run $ vim and type :PluginInstall"
echo "    SUCCESS: Make sure to change your ~/.gitconfig to your name and email"
