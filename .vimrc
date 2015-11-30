execute pathogen#infect()
syntax on
filetype plugin indent on
set noswapfile

" colorscheme
colorscheme seoul256-light

" tab stuff
set expandtab ts=2 sw=2 ai

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" easier copy/paste
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p

" add a $ character to end of a change
set cpoptions+=$

" correct php comments
au Bufenter *.php set comments=sl:/*,mb:*,elx:*/

" easier split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" sexy invisible chars
set list listchars=tab:▸\ ,trail:.,eol:¬

" lustyjuggler complaining stop
set hidden

" airline fonts
let g:airline_powerline_fonts = 1

" syntastic PHP
let g:syntastic_php_checkers      = ['php']
let g:syntastic_haskell_checkers  = ['ghc-mod', 'hlint']

" php documentor
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
autocmd BufRead,BufNewFile *.php nnoremap <buffer> <C-c> :call pdv#DocumentWithSnip()<CR>

" ultisnips list snippets
let g:UltiSnipsListSnippets = "<C-l>"

" just a bit better autocomplete for php
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
set completeopt=longest,menuone
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" don't match <> in .php files
au FileType php let b:delimitMate_matchpairs = "(:),[:],{:}"

" taggatron
let g:tagcommands = {
      \    "php" : {"tagfile":".php.tags","args":"-R", "cmd": "ctags"},
      \    "javascript" : {"tagfile":".js.tags","args":"-R"} 
      \}
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <C-n> :Ag<SPACE>

