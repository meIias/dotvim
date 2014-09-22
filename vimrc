"	@github.com/meiias's .vimrc
"		-- always growing, always learning --

execute pathogen#infect()

"----------------------------------------------
set list
set listchars=tab:▸\ ,eol:¬

"----------------------------------------------
"remap : --> ; for commands
nore ; :
nore \ ;

"----------------------------------------------
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

"----------------------------------------------
scriptencoding utf-8
set encoding=utf-8

"----------------------------------------------
" \d to open nerdtree and close after file open
" \D to open nerdtree and keep tree open after file open
" ctrl + w + w to cycle between tree and open file
nnoremap <Leader>d :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
nnoremap <Leader>D :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>

"----------------------------------------------
"remove help text at top of nerdtree window
let NERDTreeMinimalUI = 1

"----------------------------------------------
"remove help at top of tagbar window
let g:tagbar_compact = 1

"----------------------------------------------
"max width, horizontal on gvim
set fuopt=maxvert,maxhorz

"----------------------------------------------
"iterm scrolling
set mouse=a

"----------------------------------------------
let mapleader=","

"----------------------------------------------
" global value for c family semantic support - youcompleteme
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"----------------------------------------------
" Do not display "Pattern not found" messages during YouCompleteMe completion
" Patch: https://groups.google.com/forum/#!topic/vim_dev/WeBBjkXE8H8
"try
"  set shortmess+=c
"  catch /E539: Illegal character/
"endtry

"----------------------------------------------
"font
set guifont=M+\ 1mn\ medium:h10

"----------------------------------------------
" Basic settings for colorscheme and general look
set background=dark

"----------------------------------------------
set number
syntax on

"----------------------------------------------
""set smartindent
set tabstop=4
set shiftwidth=4
"set expandtab
set smarttab
set autoindent

"----------------------------------------------
let g:seoul256_background = 233
colorscheme  seoul256

"----------------------------------------------
set cursorline
"set cursorcolumn
"hi CursorLine term=bold cterm=bold guibg=Grey40
"hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE

"----------------------------------------------
" For nerd commenter
filetype plugin on

"----------------------------------------------
" Indent for different file/language types
filetype indent on

"----------------------------------------------
" add a status line
set laststatus=2

"----------------------------------------------
" Remove annoying 'enter or type command..' msg
map <F5> :wall!<CR>:!sbcl --load foo.cl<CR><CR>

"----------------------------------------------
""set title
" configure title to look like: Vim /path/to/file
""set titlestring=%-.55F\ 

"----------------------------------------------
" This disables the scratch preview on YCM
" preview doesn't seem to play nice with tab
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"----------------------------------------------
set statusline=%F%m%r%h%w\%=%{fugitive#statusline()}\ %{tagbar#currenttag('[%s]','')}\ %y\ [Win:%{WindowNumber()}]\ [%{&fileencoding?&fileencoding:&encoding}]\ [L:\%l\ C:\%c\ A:\%b\ H:\x%B\ P:\%p%%]\ [%{strftime(\"%m.%d.%Y\//%I:%M%p\//Day:%j\")}]

"----------------------------------------------
" Process taglist without opening
let Tlist_Process_File_Always = 1

"----------------------------------------------
" map buffer switch to ctrlj ctrlk
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

"----------------------------------------------
"make a session to save
"Plus, you can save sessions of vim
"
":mksession! ~/today.ses
"The above command saves the current open file buffers and settings to
"~/today.ses. You can load that session by using
"
"vim -S ~/today.ses

"----------------------------------------------
" for limelight.vim
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

"----------------------------------------------
" use :SemanticHighlight to get full variable highlights, :e to undo
" use :Goyo to get distraction free mode, :Goyo! to undo
" use :Limelight to get lighting paragraphs, :Limelight! to undo

"----------------------------------------------
"bufferline don't echo in command bar
"let g:bufferline_echo = 0

"----------------------------------------------
"let g:ctrlp_map = '<leader>t'
"let g:ctrlp_working_path_mode = 'c'

"----------------------------------------------
"snipmate triggers, can't be tab b/c of ycm
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

"----------------------------------------------
"error symbols
if !has('gui_running')
	" remove the highlighting for the gutter signs
	hi clear YcmErrorSign
	hi clear YcmWarningSign
	"let g:syntastic_error_symbol = '💥'
	let g:syntastic_error_symbol = '🔺'
	"let g:syntastic_error_symbol = '😖'
	let g:syntastic_warning_symbol = '👉'
else
	let g:syntastic_warning_symbol = ':('
	let g:syntastic_error_symbol = ':('
endif

"----------------------------------------------
"map limelight to , lt
map <silent> <leader>lt :Limelight!!0.8 <cr>

"----------------------------------------------
"view current buffer in nerdtree
 map <silent> <leader>r :NERDTreeFind<cr>

"----------------------------------------------
" use :BD (caps) to close a buffer but leave the window open(for nerdtree w/mult. files).

"----------------------------------------------
"map tagbar to ,tg to open/close it
nmap <leader>tg :TagbarToggle<CR>
"nmap <leader>tg :TlistToggle<CR>


"----------------------------------------------
"map dox comment generator to ,/
map <silent> <leader>/ :Dox <cr>

"----------------------------------------------
"taglist options
"let Tlist_Use_Right_Window = 1
"let Tlist_WinWidth = 35
"let Tlist_Display_Prototype = 1
let g:tagbar_width = 38

"----------------------------------------------
" a.vim guide

" :A switches to the header file corresponding to the current file being
" edited (or vise versa) 
" :AS splits and switches 
" :AV vertical splits and switches 
" :AT new tab and switches 
" :AN cycles through matches 
" :IH switches to file under cursor 
" :IHS splits and switches 
" :IHV vertical splits and switches 
" :IHT new tab and switches 
" :IHN cycles through matches 
" <Leader>ih switches to file under cursor 
" <Leader>is switches to the alternate file of file under cursor (e.g. on
" <foo.h> switches to foo.cpp) 
" <Leader>ihn cycles through matches 

"----------------------------------------------
" window management
"  add numbers for each open window
" ,1-2-3-4-5 to change windows!

let i = 1
while i <= 9
	execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
	let i = i + 1
endwhile

function! WindowNumber()
	let str=tabpagewinnr(tabpagenr())
	return str
endfunction

"----------------------------------------------
"vertical line spacing for gui
"set linespace=2

"----------------------------------------------
"remove guivim scrollbars, toolbars
set guioptions-=L
set guioptions-=r
set guioptions-=T

"----------------------------------------------
"change color in gvim based on insert or normal mode
"au InsertEnter * hi StatusLine guibg=Red
"au InsertLeave * hi StatusLine guibg=#ccdc90

"----------------------------------------------
"match brackets with color not highlight
hi MatchParen guibg=NONE guifg=orange gui=bold
hi MatchParen cterm=bold ctermbg=none ctermfg=172

"----------------------------------------------
"semantic highlight toggle
nnoremap <silent> <Leader>s :SemanticHighlightToggle<cr>

"----------------------------------------------
"alternate vim mapping h, cpp
nnoremap <Leader>h :A<cr>
nnoremap <Leader>hv :AV<cr>

"----------------------------------------------
"javascript lint mapping
map <silent> <leader>lj :JSHint<cr>

"----------------------------------------------
"set gvim transparency
"set transparency=15

"----------------------------------------------
"set transparency mapping
 map <silent> <Leader>t4 :set transparency=0 <CR>
 map <silent> <Leader>t5 :set transparency=15 <CR>

"----------------------------------------------
"remove cursorline in distraction free mode
function! s:goyo_enter()
	set cursorline!
	set list!
endfunction

function! s:goyo_leave()
	set cursorline
	set list
endfunction

autocmd! User GoyoEnter
autocmd  User GoyoEnter nested setlocal list! cursorline!

"autocmd! User GoyoEnter
"autocmd! User GoyoLeave
"autocmd  User GoyoEnter nested call <SID>goyo_enter()
"autocmd  User GoyoLeave nested call <SID>goyo_leave()

"----------------------------------------------
"cursorline mapping
 map <silent> <Leader>kl :set cursorline! <CR>

"----------------------------------------------
"set list mapping
 map <silent> <Leader>ll :set list! <CR>

"----------------------------------------------
"goyo mapping
nnoremap <silent> <leader>z :Goyo<cr>

"----------------------------------------------
"add javascript library syntax
let g:used_javascript_libs = 'jquery,angularjs,requirejs'

"----------------------------------------------
"use the mouse to scroll horizontally
if has('gui_running')
	set nowrap
endif

"----------------------------------------------
"longer history since it's not 1999 anymore
set history=1000
