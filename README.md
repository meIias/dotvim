#Install
	git clone http://github.com/meIias/dotvim.git ~/.vim

#Create Symlinks
	ln -s ~/.vim/vimrc ~/.vimrc

#Add plugins
	cd ~/.vim
	git submodule init
	git submodule update

##Extra
	cd ~/.vim/bundle/YouCompleteMe
	./install.sh --clang-completer
