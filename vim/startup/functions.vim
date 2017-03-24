" Functions

function! StripTabsAndTrailingWhitespaces()
    exec "normal ms"
    let _s=@/
    retab
    %s/^M//ge
    %s/\s\+$//e
    let @/=_s
    exec "normal `s"
endfunction

" toggle syntax on/off
function ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction

" toggle absolute/relative numbering
function ToggleNumbering()
    set relativenumber!
endfunction

" Get OS Platform
function GetPlatform()
    if has('win32') || has('win64')
        return "Windows"
    elseif has("unix")
        return substitute(system("uname"), "\n", "", "g")
    else
        return "Unknown"
    endif
endfunction

" cd to the root directory of the current git repo
function CdRoot()
    cd %:h
    exec "cd " . system("git rev-parse --show-toplevel")
    pwd
endfunction
