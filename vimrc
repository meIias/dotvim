" -- @github.com/meiias's vimrc -- "
"----------------------------------------------

" bigger plugins may need more time to install
let g:plug_timeout=1000

let $PATH = '/usr/local/bin:'.$PATH

" install 'vim plug' to the autoload folder on fresh install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" install plugins to /plugged
call plug#begin('~/.vim/plugged')

" vim8 linting
Plug 'w0rp/ale'

" colorscheme
Plug 'fcpg/vim-fahrenheit'

" vim8 grep
" mapped to leader ac
Plug 'mhinz/vim-grepper'

"vim 8 completion
Plug 'lifepillar/vim-mucomplete'

" underline instances of word
Plug 'osyo-manga/vim-brightest'

" list buffers
Plug 'bling/vim-bufferline'

" easymotion moves through a buffer by typing ',,w'
Plug 'Lokaltog/vim-easymotion'

" press 'f' to highlight all possible line movements
Plug 'deris/vim-shot-f'

" highlights possible moves when pressing w, b
Plug 'boucherm/ShowMotion'

" lightweight and fast file finder
Plug 'ctrlpvim/ctrlp.vim'

" easy commenting '5,cc' comments 5 lines, '5,cu' uncomments
Plug 'scrooloose/nerdcommenter'

" file explorer plugin, opening instructions below
Plug 'scrooloose/nerdtree'

" git for vim, used in statuslines
Plug 'tpope/vim-fugitive'

" tracks changes in source controlled file, additions, deletes etc
Plug 'airblade/vim-gitgutter'

" matching braces and such
Plug 'kana/vim-smartinput'

" dims all text except the current paragraph
Plug 'junegunn/limelight.vim'

" distraction free mode
Plug 'junegunn/goyo.vim'

" close buffer with :BD and still leave window open
Plug 'vim-scripts/bufkill.vim'

call plug#end()

"----------------------------------------------
" no compatibility w/ vi
set nocompatible

"----------------------------------------------
"remap : to ; for commands
nore ; :
nore \ ;

"----------------------------------------------
" no list chars
set nolist

"----------------------------------------------
" file encoding default utf8
scriptencoding utf-8
set encoding=utf-8

"----------------------------------------------
" \d to open nerdtree and close after file open
" \D to open nerdtree and keep tree open after file open
nnoremap <Leader>d :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
nnoremap <Leader>D :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>

"----------------------------------------------
" remove help text at top of nerdtree window
let NERDTreeMinimalUI = 1
let NERDTreeIgnore=['\.pyc$','\.tags$']

"----------------------------------------------
" iterm scrolling
set mouse=a

"----------------------------------------------
" indent line
let g:indentLine_faster=1

"----------------------------------------------
" completion settings
set shortmess+=c
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noselect
let g:mucomplete#no_mappings = 1
let g:mucomplete#enable_auto_at_startup = 1
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
imap <tab> <plug>(MUcompleteFwd)
imap <s-tab> <plug>(MUcompleteBwd)

"----------------------------------------------
" bufferline
let g:bufferline_show_bufnr = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''

"----------------------------------------------
" leader is , for ease of motion
let mapleader=","

"----------------------------------------------
" settings for indentation, numbering and syntax
" currently using spaces of length 4
" commenting out relative number,
"  since it seems to cause a slowdown
"set relativenumber number
set number
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent

"----------------------------------------------
" colorscheme
set t_Co=256
colorscheme fahrenheit

"----------------------------------------------
" cursorline will match the bg
set nocul

"----------------------------------------------
" improved paste
nnoremap <Leader>p p`[v`]=

"----------------------------------------------
" For those plugins that need it to run
filetype plugin on

"----------------------------------------------
" Indent for different file/language types
filetype indent on

"----------------------------------------------
" add a status line, make it dark
set laststatus=2

"----------------------------------------------
" Remove annoying 'enter or type command..' msg
map <F5> :wall!<CR>:!sbcl --load foo.cl<CR><CR>

"----------------------------------------------
" custom statusline
set statusline=%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=\ %{fugitive#statusline()}
set statusline+=%=
set statusline+=\ \ %{ALEGetStatusLine()}
set statusline+=\ s%{WindowNumber()}
set statusline+=\ %l/%L,
set statusline+=%c

"----------------------------------------------
" map buffer switch to ctrlj ctrlk
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

"----------------------------------------------
" map limelight to , lt
map <silent> <leader>lt :Limelight!!0.8 <cr>

"----------------------------------------------
" view current buffer in nerdtree
map <silent> <leader>r :NERDTreeFind<cr>

"----------------------------------------------
" window management
" add numbers for each open window
" ,1-2-3-4-5 to change windows!
let i = 1
while i <= 9
  execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
  let i = i + 1
endwhile

" call this fn in statusline to show which windownumber current
function! WindowNumber()
  let str=tabpagewinnr(tabpagenr())
  return str
endfunction

"----------------------------------------------
" remove guivim scrollbars, toolbars
set guioptions-=L
set guioptions-=r
set guioptions-=T

"----------------------------------------------
" remove invisible chars in distraction free mode
function! s:goyo_enter()
  set nolist
endfunction

function! s:goyo_leave()
    call SetColors()
endfunction

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

let g:goyo_width=140

"----------------------------------------------
" goyo mapping
nnoremap <silent> <leader>z :Goyo<cr>

"----------------------------------------------
" distraction free (goyo) margins
let g:goyo_margin_top = 0
let g:goyo_margin_bottom = 0
let g:goyo_linenr = 0

"----------------------------------------------
" longer history since it's not 1999 anymore
set history=1000

"----------------------------------------------
" remap escape to jk kj
inoremap jk <Esc>
inoremap kj <Esc>

"----------------------------------------------
" remove bell sound
set noerrorbells
set vb t_vb=

"----------------------------------------------
" highlight search values
set hlsearch

"----------------------------------------------
" no swp file
set noswapfile
set nobackup

"----------------------------------------------
" no message when opening vim
set shortmess+=I

"----------------------------------------------
" place cursor at last position b4 close on open
autocmd BufReadPost * normal `"

"----------------------------------------------
" allow buffers to be hidden with unsaved changes
set hidden

"----------------------------------------------
" showmotion commands

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

" Show motion for chars:
nmap f <Plug>(show-motion-f)
nmap t <Plug>(show-motion-t)
nmap F <Plug>(show-motion-F)
nmap T <Plug>(show-motion-T)
nmap , <Plug>(show-motion-,)

"----------------------------------------------
" copy/paste from the system clipboard
set clipboard=unnamed

"----------------------------------------------
" paste mode default
set nopaste

"----------------------------------------------
" underlines all occurances of a word in the buffer
let g:brightest#highlight = {
      \ "group": "BrightestUnderline",
      \}

"--------------------------------------------
" Persistent Undo
let vimDir='$HOME/.vim'
let myUndoDir=expand(vimDir . '/undodir')
call system('mkdir -p ' . myUndoDir)
set undofile
let &undodir=myUndoDir
set undolevels=500
set undoreload=500

"--------------------------------------------
" speed up ctrlp
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 40000
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"--------------------------------------------
" search
set ignorecase

"--------------------------------------------
" ignore tags file from search
set wildignore+=*.tags
set wildignore+=*.pyc
set wildignore+=**/node_modules

"--------------------------------------------
" linting vim8
let g:ale_lint_delay = 100
let g:ale_lint_on_save = 1
let g:ale_sign_error = '⨉ '
let g:ale_sign_warning = '⚠ '
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['e%d', 'w%d', '']
highlight link ALEErrorSign NONE
highlight link ALEWarningSign NONE

"--------------------------------------------
" linting search
nmap <silent> <C-q> <Plug>(ale_previous_wrap)
nmap <silent> <C-w> <Plug>(ale_next_wrap)

"--------------------------------------------
" grepper options
nnoremap <leader>ac :Grepper<cr>

"--------------------------------------------
" backspaces . . .
set backspace=indent,eol,start

"--------------------------------------------
" trigger autoread
au FocusGained,BufEnter * :silent! !

"--------------------------------------------
" save on focus lost
au FocusLost,WinLeave * :silent! w

"--------------------------------------------
" function to set all colors
function! SetColors()
    hi StatusLine cterm=NONE ctermbg=bg ctermfg=244
    hi StatusLineNC cterm=NONE ctermbg=bg ctermfg=236
    hi CursorLine term=bold cterm=bold ctermbg=0 ctermfg=NONE
    hi CursorLineNR term=bold cterm=bold ctermbg=0 ctermfg=NONE
    hi NonText cterm=NONE ctermbg=bg ctermfg=bg
    hi VertSplit cterm=NONE ctermbg=244 ctermfg=244
    hi Directory ctermfg=243
    hi MatchParen cterm=bold ctermbg=none ctermfg=171
    hi ColorColumn ctermbg=NONE ctermfg=NONE
    hi LineNr ctermfg=236 ctermbg=NONE
endfunction

call SetColors()
