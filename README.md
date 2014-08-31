cd ~
#Install
	git clone http://github.com/username/dotvim.git ~/.vim

#Create Symlinks
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

#Add plugins
	cd ~/.vim
	git submodule init
	git submodule update

