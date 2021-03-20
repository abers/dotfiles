"Standard {{{

set nocompatible
syntax on
set modelines=1
set encoding=utf-8
filetype plugin indent on
" }}}

"Basic settings {{{
"set cursorline
set ruler
set ignorecase
set smartcase
set autoread
set nofoldenable
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
set clipboard=unnamedplus
set nrformats= " All numbers treated as decimal
set scrolloff=3
set mouse=a
set fillchars+=vert:│

" save session
nnoremap <leader>s :mksession<CR>
" }}}

"Vim-Plug {{{
"Polyglot complains if this is not set first
let g:polyglot_disabled = ['markdown']

call plug#begin()

"Plug 'flazz/vim-colorschemes'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/Git/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'reedes/vim-pencil'
"Plug 'vimwiki/vimwiki'
"Plug 'michal-h21/vim-zettel'
"Plug 'tbabej/taskwiki'
Plug 'ervandew/supertab'
Plug 'mbbill/undotree'
Plug 'mboughaba/i3config.vim'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'jalvesaq/Nvim-R'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'fisadev/FixedTaskList.vim'
Plug 'sheerun/vim-polyglot'
Plug 'alok/notational-fzf-vim'
Plug 'lervag/vimtex'
Plug 'arcticicestudio/nord-vim'
"Plug 'vim-pandoc/vim-rmarkdown'
"Plug 'dpelle/vim-LanguageTool'
"Plug 'Konfekt/vim-langtool'

call plug#end()

" }}}

"Theme {{{
set termguicolors
" need to get gray relative numbers to work with gruvbox
" colorscheme 256-grayvim
"set background=dark
"let g:gruvbox_italics=1
"let g:gruvbox_guisp_fallback = "bg"
colorscheme nord
let g:nord_italic_comments = 1
let g:nord_underline = 1
highlight Comment cterm=italic
highlight Folded cterm=italic
" highlight SpellBad cterm=underline,bold ctermbg=red
let g:airline_theme='nord'

augroup nord-theme-overrides
  autocmd!
  "autocmd ColorScheme nord highlight Conceal ctermbg=None guibg=None
  "operates on Syntax as nord does not implement Conceal
  "autocmd Syntax pandoc highlight Conceal ctermbg=None guibg=None
  "need to add fg colour to above so know what is concealed
  "autocmd Syntax pandoc highlight Visual ctermbg=None guibg=None
  "Note - highlight is applied globally so for sytnax avoid Visual etc and use
  "pandocTitle etc
augroup END
" }}}

"Key mappings {{{

"Local leader
let maplocalleader = ','

"Toggle relative numbering
nnoremap <F2> :set relativenumber!<CR>

"NERDTree
nnoremap <F3> :NERDTreeToggle<CR>

"Tagbar
nnoremap <F4> :TagbarToggle<CR>

"Tab switching
nnoremap <F5> :tabprevious<CR>
nnoremap <F6> :tabnext<CR>

"TaskList
nnoremap <F7> :TaskList<CR>

"Buffer switching
nnoremap <F8> :bprev<CR>
nnoremap <F9> :bnext<CR>

" Undo
nnoremap <F10> :UndotreeToggle<cr>

" Quicker command by removing need for shift
nnoremap ; :
nnoremap : ;

" Enable folding with the spacebar
nnoremap <space> za
nnoremap <S-Space> zR

" Journal
nnoremap <leader>j :edit ~/Dropbox/personal/Journal/2021.cpt<CR>

" Fix syntax in vimwiki
nnoremap <leader>v :set syntax=vimwiki.markdown<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>

"}}}

" YouCompleteMe {{{

" Pandoc citekeys
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.pandoc = ['@']
let g:ycm_semantic_triggers.tex = ['@']

let g:ycm_filetype_blacklist = {
        \ 'tagbar': 1,
        \ 'qf': 1,
        \ 'notes': 1,
        \ 'unite': 1,
        \ 'infolog': 1,
        \ 'mail': 1,
        \ 'gitcommit': 1,
        \ 'markdown': 1,
        \ 'vimwiki': 1
        \}

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_goto_buffer_command = 'split-or-existing-window'
nnoremap <leader>g :tab YcmCompleter GoTo<cr>

" }}}

"Python {{{
au BufNewFile,BufRead *.py
   \ set autoindent fileformat=unix foldlevel=99

"}}}

"R {{{

" }}}

"Writing {{{

" Spelling & Grammar
"map <F5> :setlocal spell! spelllang=en_gb<CR>
"au BufRead,BufNewFile *.md ALEDisableBuffer
"nnoremap <leader>l :ALEEnableBuffer<CR>

"let g:langtool_jar='/home/alasdair/Applications/LanguageTool/languagetool-commandline.jar'
"let s:enablecategories = 'PUNCTUATION,TYPOGRAPHY,CASING,COLLOCATIONS,CONFUSED_WORDS,CREATIVE_WRITING,GRAMMAR,MISC,MISUSED_TERMS_EU_PUBLICATIONS,NONSTANDARD_PHRASES,PLAIN_ENGLISH,TYPOS,REDUNDANCY,SEMANTICS,TEXT_ANALYSIS,STYLE,GENDER_NEUTRALITY'
"let s:enable = 'AND_ALSO,ARE_ABLE_TO,ARTICLE_MISSING,AS_FAR_AS_X_IS_CONCERNED,BEST_EVER,BLEND_TOGETHER,BRIEF_MOMENT,CAN_NOT,CANT_HELP_BUT,COMMA_WHICH,EG_NO_COMMA,ELLIPSIS,EXACT_SAME,HONEST_TRUTH,HOPEFULLY,IE_NO_COMMA,IN_ORDER_TO,I_VE_A,NEGATE_MEANING,PASSIVE_VOICE,PLAN_ENGLISH,REASON_WHY,SENT_START_NUM,SERIAL_COMMA_OFF,SERIAL_COMMA_ON,SMARTPHONE,THREE_NN,TIRED_INTENSIFIERS,ULESLESS_THAT,WIKIPEDIA,WORLD_AROUND_IT'

"let g:langtool_parameters = ' --language en-GB' .
"    \ ' --enablecategories ' . s:enablecategories .
""    \ ' --enable' . s:enable

"Pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

"Goyo
nnoremap <leader>q :Goyo<CR>

"Limelight
let g:limelight_conceal_ctermfg = 239
let g:limelight_conceal_guifg = '#3c3836'
let g:limelight_default_coefficient = 0.7

" }}}

" Pandoc {{{
let g:pandoc#folding#mode = 'syntax'
let g:pandoc#filetypes#handled = ["pandoc", "markdown", "rst"]
let g:pandoc#modules#enabled = ["formatting", "folding", "toc", "command", "menu", "bibliographies", "completion", "keyboard"]
let g:pandoc#folding#fold_yaml=1
"let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ["python", "r"]
let g:pandoc#biblio#bibs = ["/home/alasdair/zettel/zettel.bib"]
let g:pandoc#syntax#conceal#use = 0

" }}}

"Tagbar {{{

"markdown support
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
    \ }

let g:tagbar_type_pandoc = {
    \ 'ctagstype' : 'pandoc',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
    \ }
" }}}

"NERDTree {{{
"open nerdtree with the current file selected
nnoremap <leader>t :NERDTreeFind<CR>
" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" }}}

"FZF {{{
let g:fzf_layout = {'window': { 'width': 0.9, 'height': 0.9} }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Label'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Label'],
  \ 'info':    ['fg', 'Comment'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Statement'],
  \ 'marker':  ['fg', 'Conditional'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" }}}

"Notational-FZF {{{
let g:nv_search_paths = ['~/Dropbox/notes/zettel', './docs']
let g:nv_ignore_pattern = ['_build', '_static', '_templates']
" }}}

" Airline {{{
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'pandoc', 'help', 'mail', 'org', 'rst', 'tex', 'text',
                                           \ 'markdown', 'vimwiki']

let g:airline#extensions#ale#enabled = 1

" }}}

" ALE {{{

let g:ale_fix_on_save = 1

let g:ale_python_auto_pipenv = 1
let g:ale_python_flake8_executable = 'pipenv'
let g:ale_python_pylama_executable = 'pipenv'
let g:ale_python_pydoctstyle_executable = 'pipenv'
let g:ale_python_black_options = '-l 80'

let g:ale_linter_aliases = {'pandoc': ['markdown']}
"let g:ale_linters = {'pandoc': ['vale', 'langtool']}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" }}}

" vim:foldmethod=marker:foldlevel=0
