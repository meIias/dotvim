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


	!! Make these changes in seoul256.vim colorscheme (lines 250-260)

	" Popup menu
	"call s:hi('Pmenu', [s:dark_bg + 1, 238], [224, 224])
	"call s:hi('PmenuSel', [252, 252], [89, 89])
	"call s:hi('PmenuSbar', ['', ''''], [65, 65])
	"call s:hi('PmenuThumb', ['', ''''], [23, 23])
	
	call s:hi('Pmenu', [s:dark_bg + 1, 238], [95,95])
	call s:hi('PmenuSel', [252, 252], [173, 173])
	call s:hi('PmenuSbar', ['',''''], [65,65])
	call s:hi('PmenuThumb', ['',''''], [23, 23])

##Screenshots

![alt tag](https://raw.github.com/meIias/dotvim/master/screenshots/screenshot3.png)
![alt tag](https://raw.github.com/meIias/dotvim/master/screenshots/screenshot1.png)
![alt tag](https://raw.github.com/meIias/dotvim/master/screenshots/screenshot2.png)
