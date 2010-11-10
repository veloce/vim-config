" Vim color scheme
" A port of the gedit oblivion theme for vim
" Original author: Paolo Borelli <pborelli@gnome.org>
"
" Name:         oblivion.vim
" Maintainer:   Vincent Velociter
" License:      GPL
" Version:      0.1

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "oblivion"

"GUI Colors
hi Normal       guifg=#d3d7cf guibg=#2e3436
hi Cursor		guibg=#ffffff guifg=#000000
hi CursorLine	guibg=#555753
hi CursorColumn	guibg=#464646

hi LineNr guibg=Black guifg=#555753
hi Folded guifg=#f1f3e8 guibg=#444444
hi Pmenu guibg=#84A7C1

"General Colors
hi Comment guifg=#888a85 gui=italic
hi Constant guifg=#fce94f
hi String guifg=#edd400
hi Boolean guifg=#ce5c00

hi Identifier guifg=#729fcf gui=NONE
hi Function guifg=#ad7fa8
hi Statement guifg=#eeeeec gui=bold
hi PreProc guifg=#ad7fa8
hi Type guifg=#8ae234 gui=bold
hi Special guifg=#c17d11

hi Error guifg=#eeeeec guibg=#cc0000 gui=bold
hi Todo guifg=#888a85 guibg=#fce94f gui=bold

hi clear Search
hi Search guibg=#1C3B79

" XML Colors
hi link xmlTag Identifier
hi link xmlEndTag xmlTag
hi link xmlTagName xmlTag
hi xmlString guifg=#edd400 gui=bold
"HTML Colors
hi link htmlSpecialChar PreProc
