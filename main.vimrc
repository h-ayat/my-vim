set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'sainnhe/edge'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'derekwyatt/vim-scala'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', {'do' : 'cd app & yarn install' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'chase/vim-ansible-yaml'

Plug 'ckipp01/coc-metals', {'do': 'yarn install --frozen-lockfile'}



call plug#end()

" set number
set ru
sy enable

colorscheme edge
"colorscheme tender
set termguicolors
set background=dark
set tgc

let g:javascript_plugin_flow = 1

au BufRead,BufNewFile *.sbt set filetype=scala

autocmd FileType json syntax match Comment +\/\/.\+$+

source ~/.vim/scala-coc.vimrc
source ~/.vim/my.vimrc

" Tab and shift tab for completion navigation
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"



