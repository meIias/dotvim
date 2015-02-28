"	@github.com/meiias's .vimrc
"		-- always growing, always learning --

let g:plug_timeout=1000
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'Lokaltog/vim-easymotion'
Plug 'deris/vim-shot-f'
Plug 'wesQ3/vim-windowswap'
Plug 'bling/vim-airline'
Plug 'osyo-manga/vim-brightest'
Plug 'vim-scripts/noerrmsg.vim'
Plug 'boucherm/ShowMotion'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --omnisharp-completer' }
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'meIias/seoul256.vim'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-smartinput'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'Shutnik/jshint2.vim'
Plug 'Yggdroot/indentLine'
Plug 'gcavallanti/vim-noscrollbar'
Plug 'digitaltoad/vim-jade'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'mrtazz/DoxygenToolkit.vim'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/bufkill.vim'

call plug#end()

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
"remove help at top of tagbar window
let g:tagbar_compact = 1

"----------------------------------------------
"iterm scrolling
set mouse=a

"----------------------------------------------
let mapleader=","

"----------------------------------------------
" global value for c family semantic support - youcompleteme
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

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
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

"----------------------------------------------
let g:seoul256_background = 233
colorscheme seoul256

"----------------------------------------------
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=233 guibg=bg gui=bold

"----------------------------------------------
" For nerd commenter
filetype plugin on

"----------------------------------------------
" Indent for different file/language types
filetype indent on

"----------------------------------------------
" add a status line
set laststatus=2
hi StatusLine ctermbg=233 ctermfg=233 guibg=#000000 guifg=#000000

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
set statusline=%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=\ %{fugitive#statusline()}
set statusline+=%=
set statusline+=\ %{noscrollbar#statusline(30,'―','█')}
set statusline+=\ \ \ [win:%{WindowNumber()}]
set statusline+=\ %y
set statusline+=\ %l/%L
set statusline+=,%c\ 0x%04B


"----------------------------------------------
" map buffer switch to ctrlj ctrlk
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

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
let g:vim_markdown_folding_disabled=1

"----------------------------------------------
"semantic highlight
map <silent> <leader>s :SemanticHighlightToggle<cr>

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
  set list!
endfunction

function! s:goyo_leave()
  hi MatchParen cterm=bold ctermbg=none ctermfg=172
  hi LineNr ctermbg=233 ctermfg=239 guibg=bg guifg=#4e4e4e
  hi MatchParen guibg=NONE guifg=magenta gui=bold
  hi CursorLine term=bold cterm=bold ctermbg=233 guibg=bg gui=bold
  hi StatusLine ctermbg=233 ctermfg=233 guibg=#000000 guifg=#000000
  hi VertSplit guibg=#000000 guifg=#000000
endfunction

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
set nobackup

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

hi SM_SmallMotionGroup cterm=italic ctermbg=53 gui=italic guibg=#5f005f
hi SM_BigMotionGroup cterm=italic,bold ctermbg=54 gui=italic,bold guibg=#5f0087
hi SM_CharSearchGroup cterm=italic,bold ctermbg=4 gui=italic,bold guibg=#3f6691

"*** Highlights both big and small motions
nmap w <Plug>(show-motion-both-w)
nmap W <Plug>(show-motion-both-W)
nmap b <Plug>(show-motion-both-b)
nmap B <Plug>(show-motion-both-B)
nmap e <Plug>(show-motion-both-e)
nmap E <Plug>(show-motion-both-E)

"*** Only highlights motions corresponding to the one you typed
nmap w <Plug>(show-motion-w)
nmap W <Plug>(show-motion-W)
nmap b <Plug>(show-motion-b)
nmap B <Plug>(show-motion-B)
nmap e <Plug>(show-motion-e)
nmap E <Plug>(show-motion-E)

"Show motion for chars:
nmap f <Plug>(show-motion-f)
nmap t <Plug>(show-motion-t)
nmap F <Plug>(show-motion-F)
nmap T <Plug>(show-motion-T)
nmap , <Plug>(show-motion-,)

"----------------------------------------------
"limelight on enter b/c i like it a lot
"autocmd VimEnter * Limelight0.8
"autocmd VimEnter * Goyo

"----------------------------------------------
"80 columns
set textwidth=80
set colorcolumn=80

"----------------------------------------------
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_indentLevel = 15
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

"----------------------------------------------
set clipboard=unnamed

"----------------------------------------------
"no line number background
hi LineNr ctermbg=233 ctermfg=239 guibg=bg guifg=#4e4e4e
"vertical split bar for tabs
hi VertSplit guibg=#000000 guifg=#000000

"----------------------------------------------
" paste
set nopaste

"----------------------------------------------
"
let g:brightest#highlight = {
  \ "group": "BrightestUnderline",
  \}

"---------------------------------------------
"airline settings
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='wombat'
let g:airline_left_alt_sep=''
let g:airline_right_alt_sep=''

