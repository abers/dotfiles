"Standard {{{
execute pathogen#infect()
set nocompatible
syntax on
filetype plugin indent on
set modelines=1
" }}}

"Theme {{{
set termguicolors
" need to get gray relative numbers to work with gruvbox
colorscheme 256-grayvim
set background=dark
let g:gruvbox_italics=1
colorscheme gruvbox
highlight Comment cterm=italic
highlight Folded cterm=italic
let g:airline_theme='gruvbox'
" }}}

"Basic settings {{{
"set cursorline
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
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

"Leader keys
map <leader>f :Goyo 120<CR>
" }}}

" Pandoc {{{
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 1
au FileType markdown call pandoc#folding#Init()
let g:pandoc#folding#fold_yaml=1
" }}}


"Tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}}

" VimWiki {{{
" default vimwiki is <leader>ww

" Set VimWiki to use pandoc highlighting
" & set pandoc to recognise python code blocks
au FileType vimwiki set syntax=markdown.pandoc
let g:vimwiki_global_ext= 0
let g:vimwiki_folding='expr'
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
