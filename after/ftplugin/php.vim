" Indent PHP templates as HTML files
nmap <leader>= :set ft=html<cr>mhgg=G'h:set ft=php<cr>
" Indent whole PHP file
nmap <leader>i <Esc>mygg=G'y

" phpdoc
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 
let g:pdv_cfg_Author = "Vincent Velociter"

"Folding
nmap <buffer> <F5> <Esc>:EnableFastPHPFolds<Cr>
nmap <buffer> <C-F5> <Esc>:EnablePHPFolds<Cr>
nmap <buffer> <F6> <Esc>:DisablePHPFolds<Cr>
let g:DisableAutoPHPFolding = 1

