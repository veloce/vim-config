call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ***********
" * General *
" ***********
set nocompatible
filetype indent plugin on
syntax on

set history=1000
set hidden                            " Change buffer without saving
set wildmenu                          " Better command-line completion 
set wildmode=list:longest             
set wildignore=*/cache/**,*/logs/**

set ignorecase " Case-insensitive searching.
set smartcase " But case-sensitive if expression contains a capital letter.
set incsearch " Highlight matches as you type.
set hlsearch " Highlight matches.

set mouse=a                           " Enable use of the mouse for all modes

set backup
set backupdir=~/.vim/backup

set directory=~/.vim/tmp              " directory to put swap files

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Strip trailing whitespaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTWS call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.php,*.c,*.py,*.js :call <SID>StripTrailingWhitespaces()

" lowercase to modulized 
nnoremap <leader>_ bf_x~

" syntastic
let g:syntastic_enable_signs=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ********
" Visual *
" ********
set t_Co=256
colorscheme desert

" Show syntax highlighting groups for word under cursor
" see vimcast.org/episodes/creating-colorschemes-for-vim/
nmap <S-M-p> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


" ******************
" * User interface *
" ******************
set ruler
set laststatus=2    " always display status line
" statusline : see http://vim.wikia.com/wiki/Showing_syntax_highlight_group_in_statusline
set statusline=[%n]\ %f\ %h%m%r%w\ (%{(&fenc==\"\"?&enc:&enc)})(%{&ff}){%Y}[%L]\ %=%-16(\ %l,%c-%v\ %)%P
set showcmd         " Show partial commands in the last line of the screen
set showmode
set cmdheight=2     " command bar height
set number

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Lusty
map <leader>lp :LustyJugglePrevious<cr>

" *******************
" * Text formatting *
" *******************
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" indent settings
set autoindent
set expandtab
set smartindent

set tabstop=4
set shiftwidth=4
set softtabstop=4

" easy switch for indent spaces
nmap <leader>2 :set tabstop=2<cr>:set shiftwidth=2<cr>:set softtabstop=2<cr>
nmap <leader>4 :set tabstop=4<cr>:set shiftwidth=4<cr>:set softtabstop=4<cr>

" CTAGS 
nnoremap <silent> <C-F7> :silent !ctags-exuberant -h ".php" --PHP-kinds=+cf --recurse --exclude=*/cache/* --exclude=*/logs/* --exclude=*/data/* --exclude="\.git" --exclude="\.svn" --languages=PHP<cr>

" taglist plugin
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" open files in the same directory as the current file (see vimcasts.org)
nmap <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" read files in the same directory as the current file
nmap <leader>rw :r <C-R>=expand("%:p:h") . "/" <CR>

" ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-dir=cache --ignore-dir=logs"

" Detect twig filetype
au BufNewFile,BufRead *.twig setf htmljinja
