"	@github.com/meiias's .vimrc
"		-- always growing, always learning --

execute pathogen#infect()

"----------------------------------------------
"no compatibility w/ vi
set nocompatible

"----------------------------------------------
set list
set listchars=tab:▸\ ,eol:¬,trail:·
"set listchars=tab:┊\ ,eol:¬,trail:·

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
if !has("gui_running")
	set t_Co=256
endif


"----------------------------------------------
set number
syntax on

"----------------------------------------------
""set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

"----------------------------------------------
let g:seoul256_background = 233
colorscheme seoul256

"colorscheme saturn

if has ('gui_running')
	colorscheme vydark
endif

"----------------------------------------------
"set cursorline
"set cursorcolumn
"hi CursorLine term=bold cterm=bold guibg=Grey40
"hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
"hi StatusLine ctermbg=NONE

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
" This disables the scratch preview on YCM
" preview doesn't seem to play nice with tab
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"----------------------------------------------
"set statusline=%F%m%r%h%w\%=%{fugitive#statusline()}\ %{tagbar#currenttag('[%s]','')}\ %y\ [Win:%{WindowNumber()}]\ [%{&fileencoding?&fileencoding:&encoding}]\ [L:\%l\ C:\%c\ A:\%b\ H:\x%B\ P:\%p%%]\ [%{strftime(\"%m.%d.%Y\//%I:%M%p\//Day:%j\")}]
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}%=%{noscrollbar#statusline(20,'―','█')}\ \ \ %l,%c\ x%B

"----------------------------------------------
" map buffer switch to ctrlj ctrlk
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

"----------------------------------------------
" for limelight.vim
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

"----------------------------------------------
"bufferline don't echo in command bar
let g:bufferline_echo = 1
let g:bufferline_show_bufnr = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''


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
	let g:syntastic_error_symbol = '💥'
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

"----------------------------------------------
"map dox comment generator to ,/
map <silent> <leader>/ :Dox <cr>

"----------------------------------------------
"taglist options
let g:tagbar_width = 38

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
set transparency=0

"----------------------------------------------
"remove guivim scrollbars, toolbars
set guioptions-=L
set guioptions-=r
set guioptions-=T

"----------------------------------------------
"match brackets with color not highlight
hi MatchParen guibg=NONE guifg=magenta gui=bold
hi MatchParen cterm=bold ctermbg=none ctermfg=172

"----------------------------------------------
"javascript lint mapping
map <silent> <leader>lj :JSHint<cr>

"----------------------------------------------
"remove cursorline in distraction free mode
function! s:goyo_enter()
	"Limelight0.8
	"set cursorline!
	set list!
endfunction

function! s:goyo_leave()
	hi MatchParen cterm=bold ctermbg=none ctermfg=172
	"hi StatusLine ctermbg=NONE
    hi LineNr ctermbg=233 ctermfg=235
	hi MatchParen guibg=NONE guifg=magenta gui=bold
	"set cursorline
	"set list
endfunction

"autocmd! User GoyoEnter
"autocmd  User GoyoEnter nested setlocal list! cursorline!
"autocmd  User GoyoEnter nested setlocal list!


autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

"----------------------------------------------
"goyo mapping
nnoremap <silent> <leader>z :Goyo<cr>
let g:goyo_margin_top = 0
let g:goyo_margin_bottom = 0
let g:goyo_linenr = 0

"----------------------------------------------
"add javascript library syntax
let g:used_javascript_libs = 'jquery,angularjs,requirejs'

"----------------------------------------------
"longer history since it's not 1999 anymore
set history=1000

"----------------------------------------------
"remap escape to jk kj
inoremap jk <Esc>
inoremap kj <Esc>

"----------------------------------------------
"remove bell sound
set noerrorbells
set vb t_vb=

"----------------------------------------------
"highlight search values
set hlsearch

"----------------------------------------------
"no swp file
set noswapfile

"----------------------------------------------
"no message when opening vim
set shortmess+=I

"----------------------------------------------
"trim whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"----------------------------------------------
"place cursor at last position b4 close on open
autocmd BufReadPost * normal `"

"----------------------------------------------
"allow buffers to be hidden with unsaved changes
set hidden

"----------------------------------------------
"showmotion commands
"Show motion for words:
nnoremap <silent> w w:call g:Highw()<CR>:call g:HighW()<CR>
nnoremap <silent> W W:call g:Highw()<CR>:call g:HighW()<CR>
nnoremap <silent> b b:call g:Highb()<CR>:call g:HighB()<CR>
nnoremap <silent> B B:call g:Highb()<CR>:call g:HighB()<CR>
nnoremap <silent> e e:call g:Highe()<CR>:call g:HighE()<CR>
nnoremap <silent> E E:call g:Highe()<CR>:call g:HighE()<CR>

""Show motion for chars:
nnoremap f :call g:FindChar( 'f', "forward" )<CR>
nnoremap t :call g:FindChar( 't', "forward" )<CR>
nnoremap F :call g:FindChar( 'F', "backward" )<CR>
nnoremap T :call g:FindChar( 'T', "backward" )<CR>

"----------------------------------------------
"limelight on enter b/c i like it a lot
autocmd VimEnter * Limelight0.8
"autocmd VimEnter * Goyo

"----------------------------------------------
"80 columns
"set textwidth=80

"----------------------------------------------
let g:indentLine_char = '┊'
let g:indentLine_faster = 1
let g:indentLine_color_term = 236

"----------------------------------------------
"no line number background
hi LineNr ctermbg=233 ctermfg=235

