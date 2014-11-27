" Vim color scheme
" Name:            aport.vim

let g:colors_name = "aport"
" Custom highlight function (from aldmeris)
if has("gui_running")
    let s:hi_args = ['guibg', 'guifg', 'gui', 'guisp']
else
    let s:hi_args = ['ctermbg', 'ctermfg', 'cterm']
endif
function! s:Hi(name, ...)
    let command = 'hi ' . a:name
    for i in range(0,len(a:000)-1)
        let command .= ' ' . s:hi_args[i] . '=' . a:000[i]
    endfor
    exe command
endfunc

" GUI and term palette
if has("gui_running")
    let s:butter1     = "#fce94f"
    let s:butter2     = "#edd400"
    let s:chameleon1  = "#8ae234"
    let s:chameleon2  = "#4e9a06"
    let s:chameleon3  = "#4e9a06"
    let s:orange1     = "#fcaf3e"
    let s:orange2     = "#f57900"
    let s:orange3     = "#ce5c00"
    let s:skyblue1    = "#729fcf"
    let s:skyblue2    = "#3465a4"
    let s:plum1       = "#ad7fa8"
    let s:plum2       = "#75507b"
    let s:scarletred1 = "#ef2929"
    let s:scarletred2 = "#cc0000"
    let s:aluminium1  = "#eeeee6"
    let s:aluminium2  = "#d3d7cf"
    let s:aluminium3  = "#babdb6"
    let s:aluminium4  = "#888a85"
    let s:aluminium5  = "#555753"
    let s:aluminium6  = "#2e3436"
    let s:black       = "#000000"
    let s:white       = "#ffffff"
elseif &t_Co == 256
    let s:butter1     = "215"
    let s:orange1     = "215"
    let s:orange2     = "166"
    let s:skyblue1    = "12"
    let s:skyblue2    = "32"
    let s:plum1       = "139"
    let s:plum2       = "97"
    let s:scarletred1 = "203"
    let s:aluminium1  = "231"
    let s:aluminium2  = "253"
    let s:aluminium3  = "249"
    let s:aluminium4  = "246"
    let s:aluminium5  = "241"
    let s:black       = "16"
    let s:white       = "231"
endif

" Groups
call s:Hi('Normal',     s:white,         s:aluminium5)
call s:Hi('Comment',    s:white,         s:aluminium4)
call s:Hi('Constant',   s:white,         s:plum1)
call s:Hi('Boolean',    s:white,         s:orange1)
call s:Hi('Identifier', s:white,         s:skyblue1,      "NONE")
call s:Hi('Statement',  s:white,         s:aluminium5,    "bold")
call s:Hi('PreProc',    s:white,         s:orange1)
call s:Hi('Type',       s:white,         s:skyblue1,      "bold")
call s:Hi('Special',    s:white,         s:orange1)
call s:Hi('SpecialChar',s:white,         s:plum2)
call s:Hi('Underlined', s:white,         s:skyblue1,      "underline")
call s:Hi('Error',      s:scarletred1,   s:aluminium1,    "bold")
call s:Hi('Todo',       s:butter1,       s:aluminium5,    "bold")
call s:Hi('SpecialKey', s:white,         s:aluminium2)
call s:Hi('NonText',    s:white,         s:aluminium2)
call s:Hi('MatchParen', s:plum1,         s:aluminium5)
call s:Hi('StatusLine', s:white,         s:aluminium5,    "bold,reverse")
call s:Hi('Search',     s:plum1,         s:aluminium5)
call s:Hi('Visual',     s:aluminium4,    s:aluminium1)
call s:Hi('Cursor',     s:aluminium4,    s:white)

call s:Hi('Class',      s:white,         s:skyblue2,      "bold")
