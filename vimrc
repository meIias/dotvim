" -- @github.com/meiias's vimrc -- "
"----------------------------------------------

" bigger plugins may need more time to install
let g:plug_timeout=1000

" install 'vim plug' to the autoload folder on fresh install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" install plugins to /plugged
call plug#begin('~/.vim/plugged')

" commands required after installing color coded
function! BuildColor_Coded(info)
  if a:info.status != 'installed'
    !cd ~/.vim/plugged/color_coded
    !mkdir build && cd build
    !cmake ..
    !make && make install
  endif
endfunction

" color-coded provides C/C++ semantic highlighting
"Plug 'jeaye/color_coded', {
"    \ 'do': function('BuildColor_Coded')
"    \ }

" css syntax plugin
" ctrl space to activate completion
Plug 'hail2u/vim-css3-syntax'

" fixes some css syntax highlighting issues
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" c++ additional syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" easymotion moves through a buffer by typing ',,w'
Plug 'Lokaltog/vim-easymotion'

" enhanced js syntax
Plug 'jelera/vim-javascript-syntax'

" press 'f' to highlight all possible line movements
Plug 'deris/vim-shot-f'

" auto update ctags on save
Plug 'craigemery/vim-autotag'

" press ',ww' in two buffers to swap them
Plug 'wesQ3/vim-windowswap'

" underlines all occurances of a word
" !! not working right now, so commenting
Plug 'osyo-manga/vim-brightest'

" hides messages associated with YCM, like 'not found'
Plug 'vim-scripts/noerrmsg.vim'

" highlights possible moves when pressing w, b
Plug 'boucherm/ShowMotion'

" when running remotely, can't use YCM since it's huge
" autocompletion for c family languages and js, commenting build step
Plug 'Valloric/YouCompleteMe'

"if has('macunix')
"    Plug 'Valloric/YouCompleteMe', {
"        \ 'do': './install.sh --clang-completer --omnisharp-completer'
"        \ }
"else
"    " shows completion menu, basic autocomplete
"    Plug 'vim-scripts/AutoComplPop'
"endif

" lightweight and fast file finder
Plug 'kien/ctrlp.vim'

" provides completion for various popular js libs
Plug 'othree/javascript-libraries-syntax.vim'

" easy commenting '5,cc' comments 5 lines, '5,cu' uncomments
Plug 'scrooloose/nerdcommenter'

" file explorer plugin, opening instructions below
Plug 'scrooloose/nerdtree'

" gives each variable a unique color. ',s' to use, not used often
Plug 'jaxbot/semantic-highlight.vim'

" my fork of the best colorscheme, written by junegunn
Plug 'meIias/seoul256.vim'

" best light colorscheme I've used in term vim
Plug 'vim-scripts/saturn.vim'

" tag outline viewer. ',tg' to open, shows fns, vars, classes, etc
Plug 'majutsushi/tagbar'

" works w/ YCM to provide semantic autocomplete for js
Plug 'marijnh/tern_for_vim'

" misc libraries used by vim plugins
Plug 'tomtom/tlib_vim'

" more libs used by vim plugins
Plug 'MarcWeber/vim-addon-mw-utils'

" shows all open buffers in the command window
Plug 'bling/vim-bufferline'

" async for plugins
Plug 'tpope/vim-dispatch'

" git for vim, used in statuslines
Plug 'tpope/vim-fugitive'

" tracks changes in source controlled file, additions, deletes etc
Plug 'airblade/vim-gitgutter'

" matching braces and such
Plug 'kana/vim-smartinput'

" ctrlj to add snippets
Plug 'garbas/vim-snipmate'

" write custom snippets, not used
Plug 'honza/vim-snippets'

" javascript linting, ',lj' to lint
Plug 'Shutnik/jshint2.vim'

" file scrollbar for the statusline
Plug 'gcavallanti/vim-noscrollbar'

" markdown syntax highlighting
Plug 'plasticboy/vim-markdown'

" dims all text except the current paragraph
Plug 'junegunn/limelight.vim'

" distraction free mode
Plug 'junegunn/goyo.vim'

" commenting and boilerplate
Plug 'mrtazz/DoxygenToolkit.vim'

" swap between cpp and h file with :a
Plug 'vim-scripts/a.vim'

" close buffer with :BD and still leave window open
Plug 'vim-scripts/bufkill.vim'

call plug#end()

"----------------------------------------------
" no compatibility w/ vi
set nocompatible

"----------------------------------------------
" show invisible chars
set list
set listchars=tab:▸\ ,eol:¬,trail:·

"----------------------------------------------
"remap : to ; for commands
nore ; :
nore \ ;

"----------------------------------------------
" python path for YCM C++ semantic autocompletion
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

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

"----------------------------------------------
" remove help at top of tagbar window
let g:tagbar_compact = 1

"----------------------------------------------
" iterm scrolling
set mouse=a

"----------------------------------------------
" leader is , for ease of motion
let mapleader=","

"----------------------------------------------
" global value for c family semantic support - youcompleteme
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"----------------------------------------------
" font
set guifont=M+\ 1mn\ medium:h10

"----------------------------------------------
" Basic settings for colorscheme and general look
if !has("gui_running")
  set t_Co=256
endif

"----------------------------------------------
" settings for indentation, numbering and syntax
" currently using spaces of length 4
set number
syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent

"----------------------------------------------
" best colorscheme I have seen
let g:seoul256_background = 233
colorscheme seoul256

"----------------------------------------------
" list chars colors
" hide list chars for now, can only see when cursor is over it
hi NonText guibg=bg guifg=bg gui=NONE ctermfg=bg ctermbg=bg

"----------------------------------------------
" cursorline will match the bg
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=233 guibg=bg gui=bold
hi CursorLineNR term=bold cterm=bold ctermbg=bg guibg=bg gui=bold

"----------------------------------------------
" For those plugins that need it to run
filetype plugin on

"----------------------------------------------
" Indent for different file/language types
filetype indent on

"----------------------------------------------
" add a status line, make it dark
set laststatus=2
hi StatusLine ctermbg=241 ctermfg=234 guibg=#242424 guifg=#242424
hi StatusLineNC ctermbg=234 ctermfg=234 guibg=#242424 guifg=#242424

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
" YCM completion
let g:ycm_min_num_of_chars_for_completion = 0

"----------------------------------------------
" custom statusline
set statusline=%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=\ %{fugitive#statusline()}
set statusline+=%=
set statusline+=\ %{noscrollbar#statusline(15,'―','█')}
set statusline+=\ \ \ [win:\ %{WindowNumber()}]
set statusline+=\ %y
set statusline+=\ [line:\ %4l\ of\ %4L]
set statusline+=\ [col:\ %3c]
set statusline+=\ [hex:\ 0x%04B]

"----------------------------------------------
" map buffer switch to ctrlj ctrlk
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

"----------------------------------------------
" bufferline don't echo in command bar
let g:bufferline_echo = 1
let g:bufferline_show_bufnr = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''

"----------------------------------------------
" snipmate triggers, can't be tab b/c of ycm
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

"----------------------------------------------
" error symbols
if !has('gui_running')
  " remove the highlighting for the gutter signs
  " no emojis in guivim annoyingly
  hi clear YcmErrorSign
  hi clear YcmWarningSign
  let g:syntastic_error_symbol = '💥'
  let g:syntastic_warning_symbol = '👉'
else
  let g:syntastic_warning_symbol = ':('
  let g:syntastic_error_symbol = ':('
endif

"----------------------------------------------
" map limelight to , lt
map <silent> <leader>lt :Limelight!!0.8 <cr>

"----------------------------------------------
" view current buffer in nerdtree
map <silent> <leader>r :NERDTreeFind<cr>

"----------------------------------------------
" map tagbar to ,tg to open/close it
nmap <leader>tg :TagbarToggle<CR>

"----------------------------------------------
" map dox comment generator to ,/
map <silent> <leader>/ :Dox <cr>

"----------------------------------------------
" taglist options
let g:tagbar_width = 38

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
" markdown hides everything for some reason
let g:vim_markdown_folding_disabled=1

"----------------------------------------------
" semantic highlight
map <silent> <leader>s :SemanticHighlightToggle<cr>

"----------------------------------------------
" remove guivim scrollbars, toolbars
set guioptions-=L
set guioptions-=r
set guioptions-=T

"----------------------------------------------
" match brackets with color not highlight
hi MatchParen guibg=NONE guifg=magenta gui=bold
hi MatchParen cterm=bold ctermbg=none ctermfg=172

"----------------------------------------------
" javascript lint mapping
map <silent> <leader>lj :JSHint<cr>

"----------------------------------------------
" remove invisible chars in distraction free mode
function! s:goyo_enter()
  set list!
endfunction

function! s:goyo_leave()
  " have to return a bunch of color settings after leaving goyo mode
  hi StatusLine ctermbg=242 ctermfg=234 guibg=#242424 guifg=#242424
  hi MatchParen cterm=bold ctermbg=none ctermfg=172
  hi LineNr ctermbg=233 ctermfg=239 guibg=bg guifg=#4e4e4e
  hi MatchParen guibg=NONE guifg=magenta gui=bold
  hi CursorLine term=bold cterm=bold ctermbg=233 guibg=bg gui=bold
  hi StatusLineNC ctermbg=234 ctermfg=234 guibg=#242424 guifg=#242424
  hi VertSplit ctermbg=234 ctermfg=234 guibg=#262626 guifg=#262626
  hi NonText guibg=bg guifg=bg gui=NONE ctermfg=bg ctermbg=bg
  hi CursorLineNR term=bold cterm=bold ctermbg=bg guibg=bg gui=bold
endfunction

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

let g:goyo_width=80

"----------------------------------------------
" goyo mapping
nnoremap <silent> <leader>z :Goyo<cr>

"----------------------------------------------
" distraction free (goyo) margins
let g:goyo_margin_top = 0
let g:goyo_margin_bottom = 0
let g:goyo_linenr = 0

"----------------------------------------------
" add javascript library syntax
let g:used_javascript_libs = 'jquery,angularjs,requirejs'

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
" trim whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"----------------------------------------------
" place cursor at last position b4 close on open
autocmd BufReadPost * normal `"

"----------------------------------------------
" allow buffers to be hidden with unsaved changes
set hidden

"----------------------------------------------
" showmotion commands
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

" Show motion for chars:
nmap f <Plug>(show-motion-f)
nmap t <Plug>(show-motion-t)
nmap F <Plug>(show-motion-F)
nmap T <Plug>(show-motion-T)
nmap , <Plug>(show-motion-,)

"----------------------------------------------
" limelight on enter b/c i like it a lot, unused currently
"autocmd VimEnter * Limelight0.8
"autocmd VimEnter * Goyo

"----------------------------------------------
" 80 columns
"set textwidth=80

"----------------------------------------------
" indentline settings, include vertical bars and horizontal
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1

"----------------------------------------------
" copy/paste from the system clipboard
set clipboard=unnamed

"----------------------------------------------
" no line number background
hi LineNr ctermbg=233 ctermfg=239 guibg=bg guifg=#4e4e4e

"----------------------------------------------
" vertical split bar for tabs
hi VertSplit ctermbg=234 ctermfg=234 guibg=#242424 guifg=#242424

"----------------------------------------------
" paste mode default
set nopaste

"----------------------------------------------
" underlines all occurances of a word in the buffer
let g:brightest#highlight = {
      \ "group": "BrightestUnderline",
      \}

"--------------------------------------------
"Persistent Undo
if exists("&undodir")
  set undofile
  let &undodir=&directory
  set undolevels=500
  set undoreload=500
endif

set noundofile
