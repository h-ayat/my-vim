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
map <C-a><C-t> :NERDTreeToggle<CR>
"map <C-n> :NERDTreeToggle<CR>

" General configs
set number relativenumber
set ru
sy enable

" fzf config

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
nnoremap <C-p> :FZF<CR>
nnoremap <C-a><C-f> :Ag<Space>
nnoremap <C-b> :Buffers<CR>
let g:fzf_layout = { 'down': '~40%' }

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


