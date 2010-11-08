" Indent PHP templates as HTML files
nmap <leader>= :set ft=html<cr>mhgg=G'h:set ft=php<cr>
" Indent whole PHP file
nmap <leader>i <Esc>mygg=G'y

" phpdoc
nnoremap <C-S-D> :call PhpDocSingle()<CR> 
"inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
"vnoremap <C-P> :call PhpDocRange()<CR> 
let g:pdv_cfg_Author = "Vincent Velociter"

"Folding
nmap <buffer> <F5> <Esc>:EnableFastPHPFolds<Cr>
nmap <buffer> <C-F5> <Esc>:EnablePHPFolds<Cr>
nmap <buffer> <F6> <Esc>:DisablePHPFolds<Cr>
let g:DisableAutoPHPFolding = 1

"PHP Colors
highlight link phpVarSelector Identifier
highlight link phpIdentifier Identifier
highlight link phpParent Normal
highlight link phpFunctions Function
highlight link phpSpecial Keyword
highlight link phpMemberSelector Special
