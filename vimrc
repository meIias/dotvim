"	@github.com/meiias's .vimrc
"		-- always growing, always learning --

execute pathogen#infect()

"----------------------------------------------
set list
set listchars=tab:▸\ ,eol:¬

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
set guifont=M+\ 1mn\ medium:h12

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
"set cursorline
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
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
""autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
""autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"----------------------------------------------
" This disables the scratch preview on YCM
" preview doesn't seem to play nice with tab
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"----------------------------------------------
set statusline=%F%m%r%h%w\%=%{fugitive#statusline()}\ %([%{Tlist_Get_Tagname_By_Line()}]%)\ %y\ [%{&fileencoding?&fileencoding:&encoding}]\ [L:\%l\ C:\%c\ A:\%b\ H:\x%B\ P:\%p%%]

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
	let g:syntastic_error_symbol = '💥'
	"let g:syntastic_error_symbol = '😖'
	let g:syntastic_warning_symbol = '👉'
else
	let g:syntastic_warning_symbol = ':('
	let g:syntastic_error_symbol = ':('
endif

"----------------------------------------------
"map limelight to , lt
map <leader>lt :Limelight!!0.8 <cr>

"----------------------------------------------
