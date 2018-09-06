syntax on
filetype plugin indent on

set backspace=indent,eol,start " more powerful backspacing
set tabstop=2 " set the default tabstop
set softtabstop=2
set shiftwidth=2 " set the default shift width for indents
set expandtab " make tabs into spaces (set by tabstop)
set smarttab " smarter tab levels

let &titlestring = @%
set title

set swapfile " move swapfiles to tmp dir
set dir=~/tmp

set hlsearch

set number

" Use prettier formatting in javascript 
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd BufWritePre *.js :normal gggqG
autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

" specify directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'chrisbra/NrrwRgn'

Plug 'https://github.com/wesQ3/vim-windowswap'

Plug 'w0rp/ale'

Plug 'https://github.com/ctrlpvim/ctrlp.vim'

Plug 'https://github.com/scrooloose/nerdtree'

call plug#end()

" setup ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" autostart plugins
"   NERDTree
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() === 0 && !exists("s:std_in") | NERDTree | endif
map <C-N> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

