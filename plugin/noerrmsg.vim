" Vim global plugin to hide ErrorMsg while in insert-mode
" Last Change:	2013 Nov 13
" Maintainer:	Hector Arciga
" License:  This file is placed in the public domain.

if exists("g:loaded_noerrmsg")
  finish
endif
let g:loaded_noerrmsg = 1

let s:save_cpo = &cpo
set cpo&vim

autocmd InsertEnter * call <SID>hideErrorMsg()
autocmd InsertLeave,WinLeave * call <SID>showErrorMsg()

function s:hideErrorMsg()
    if (has('gui_running')) 
      let w:mode = "gui"
    else
      let w:mode = "cterm"
    endif
    let l:Normal = synIDattr(hlID("Normal"), "bg", w:mode) " Get current colorscheme's background color
    let w:fgErrorMsg = synIDattr(hlID("ErrorMsg"), "fg", w:mode) " Get and save current colorscheme's ErrorMsg foreground color
    let w:bgErrorMsg = synIDattr(hlID("ErrorMsg"), "bg", w:mode) " Get and save current colorscheme's ErrorMsg background color

    exe "hi ErrorMsg" w:mode."fg=".l:Normal
    exe "hi ErrorMsg" w:mode."bg=".l:Normal
endfunction

function s:showErrorMsg()
  if exists("w:fgErrorMsg") && strlen(w:fgErrorMsg)
    exe "hi ErrorMsg" w:mode."fg=".w:fgErrorMsg
  endif
  if exists("w:bgErrorMsg") && strlen(w:bgErrorMsg)
    exe "hi ErrMsg" w:mode."bg=".w:bgErrorMsg
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
