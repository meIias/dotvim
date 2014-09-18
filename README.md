#Install
	git clone http://github.com/meIias/dotvim.git ~/.vim

#Create Symlinks
	ln -s ~/.vim/vimrc ~/.vimrc

#Add plugins
	cd ~/.vim
	git submodule init
	git submodule update

##Extra
	need to adjust .ycm_extra_conf.py if not on osx
