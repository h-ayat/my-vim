set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'sainnhe/edge'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'derekwyatt/vim-scala'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf.vim'

call plug#end()

" set number
set ru
sy enable

colorscheme edge
set termguicolors
set background=dark
set tgc

let g:javascript_plugin_flow = 1

au BufRead,BufNewFile *.sbt set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+

source ~/.vim/scala-coc.vimrc

" Tab and shift tab for completion navigation
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
nnoremap <C-p> :FZF<CR>
nnoremap <C-S-f> :Ag<Space>
nnoremap <C-b> :Buffers<CR>


