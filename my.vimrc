inoremap jj <Esc>


" Airline settings
let g:airline#extensions#tabline#enabled = 1 " tablike buffers
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Scala metals settings
:command MetalsImport :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'build-import' })
:command MetalsDoctor :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'doctor-run' })
:command! -nargs=1 SC execute ":! bloop compile " string(<q-args>)
:command! -nargs=1 ST execute ":! bloop test " string(<q-args>)

" Nerd tree settings
" map <C-a><C-t> :NERDTreeToggle<CR>
nnoremap <silent> <expr> <C-t> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

let g:NERDTreeWinSize=60
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"map <C-n> :NERDTreeToggle<CR>
" see https://shapeshed.com/vim-netrw/
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vexplore
    endif
endfunction

" Add your own mapping. For example:
" noremap <silent> <C-E> :call ToggleNetrw()<CR>
"map <C-a><C-t> :Vex<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25


:command YankUp :call writefile(getreg('"', 1, 1), '/tmp/cl.vi') | exec ':!cat /tmp/cl.vi | xclip -selection clipboard'
nnoremap <C-a><C-v> :YankUp<CR><CR>

" General configs
set number relativenumber
set ru
sy enable
set autowriteall

" fzf config

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
nnoremap <C-p> :FZF<CR>
nnoremap <C-a><C-f> :Ag<Space>
nnoremap <C-b> :Buffers<CR>
let g:fzf_layout = { 'up': '~30%' }

let g:fzf_action = {
  \ 'ctrl-v': 'vsplit' }

let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" Yaml config
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au BufRead,BufNewFile *.yaml set filetype=ansible
au BufRead,BufNewFile *.yml set filetype=ansible


" My other config
execute "set <M-j>=\ej"
execute "set <M-J>=\eJ"
nnoremap <M-j> :bn<CR>
nnoremap <M-J> :bp<CR>

" Compatibility with kitty
if has('gui_running') || has('nvim') 
    hi Normal 		guifg=#f6f3e8 guibg=#242424 
else
    " Set the terminal default background and foreground colors, thereby
    " improving performance by not needing to set these colors on empty cells.
    hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#141414\007"
    let &t_te = &t_te . "\033]110\007\033]111\007"
endif

