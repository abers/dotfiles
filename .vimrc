"Standard {{{
execute pathogen#infect()
set nocompatible
syntax on
filetype plugin indent on
set modelines=1
" }}}

"Theme {{{
set termguicolors
colorscheme 256-grayvim
set background=dark
let g:gruvbox_italics=1
colorscheme gruvbox
highlight Comment cterm=italic
highlight Folded cterm=italic
let g:airline_theme='gruvbox'
" }}}

"Basic settings {{{
set ruler
set ignorecase
set smartcase
set autoread
set shortmess+=I
set showcmd
set showmatch " highlight matching [{()}]
set incsearch
set hlsearch
" and to turn off search highlighting -
nnoremap <leader><space> :nohlsearch<CR>
set nowrap
set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=4
set number relativenumber
set wildmenu
set lazyredraw
setlocal cm=blowfish2

" save session
nnoremap <leader>s :mksession<CR>
" }}}

"Global key mappings {{{

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Quicker command by removing need for shift
nnoremap ; :
 
" Enable folding with the spacebar
nnoremap <space> za

"}}}

"Pencil & Markdown {{{
let g:pandoc#folding#fdc = 0

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

"Leader keys
map <leader>f :Goyo 120<CR>
" }}}

"Tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}}

"Python {{{
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1

let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6

let g:pymode_python = 'python3'

let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']

let g:pymode_lint_todo_symbol = 'WW'                                        
let g:pymode_lint_comment_symbol = 'CC'                                     
let g:pymode_lint_visual_symbol = 'RR'                                      
let g:pymode_lint_error_symbol = 'EE'                                       
let g:pymode_lint_info_symbol = 'II'                                        
let g:pymode_lint_pyflakes_symbol = 'FF'

let g:pymode_rope = 1

let g:pymode_rope_goto_definition_bind = '<leader>pg'
let g:pymode_rope_rename_bind = '<leader>pr'
let g:pymode_rope_organize_imports_bind ='<leader>pi'

let g:pymode_syntax_print_as_function = 0

" }}} 

" VimWiki {{{
" default vimwiki is <leader>ww

" Set VimWiki to use pandoc highlighting
" & set pandoc to recognise python code blocks
au FileType vimwiki set syntax=markdown.pandoc
let g:pandoc#syntax#codeblocks#embeds#langs = ["python"]

let g:vimwiki_list = [
                        \{'path': '~/vimwiki/',
                        \ 'syntax': 'markdown', 'ext': '.md',
                        \ 'python': 'python'},
                        \{'path': '~/zettel/',
                        \ 'syntax': 'markdown', 'ext': '.md'},
                    \]

"Hotkey for zettel
nmap <leader>z 2<leader>ww

let g:vimwiki_use_mouse =1

" }}}

" vim:foldmethod=marker:foldlevel=0
