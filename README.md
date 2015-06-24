#Install
    git clone http://github.com/meIias/dotvim.git ~/.vim

#Create Symlinks
    ln -s ~/.vim/vimrc ~/.vimrc

#Install plugins
    > open vim (ignore the errors)
    > run :PlugInstall

#Install YCM autocompletion
    > cd plugged/YouCompleteMe
    > ./install.sh (or ./install.sh --clang-completer --omnisharp-completer for c completion)

#Install JS autocompletion
    > cd plugged/tern_for_vim
    > npm install

