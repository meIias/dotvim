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

	!! need to adjust .ycm_extra_conf.py if not on osx

##Screenshots

![alt tag](https://raw.github.com/meIias/dotvim/master/screenshot3.png)
![alt tag](https://raw.github.com/meIias/dotvim/master/screenshot1.png)
![alt tag](https://raw.github.com/meIias/dotvim/master/screenshot2.png)
