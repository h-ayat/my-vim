inoremap jj <Esc>


" Airline settings
let g:airline#extensions#tabline#enabled = 1 " tablike buffers
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Scala metals settings
:command MetalsImport :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'build-import' })
:command MetalsDoctor :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'doctor-run' })

" Nerd tree settings
map <C-a><C-t> :NERDTreeToggle<CR>
"map <C-n> :NERDTreeToggle<CR>

