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

	!! need to adjust .ycm_extra_conf.py if not on osx or linux

	!! get latest goyo.vim plugin
