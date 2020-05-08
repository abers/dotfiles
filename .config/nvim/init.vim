"Standard {{{

set nocompatible
syntax on
set modelines=1
set encoding=utf-8
" }}}

"Vim-Plug {{{
call plug#begin()

" Test:


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
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'
Plug 'tbabej/taskwiki'
Plug 'ervandew/supertab'
Plug 'mbbill/undotree'
Plug 'mboughaba/i3config.vim'
"Plug 'dpelle/vim-LanguageTool'
"Plug 'Konfekt/vim-langtool'
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

call plug#end()
filetype plugin indent on

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
  autocmd Syntax pandoc highlight Conceal ctermbg=None guibg=None
  "need to add fg colour to above so know what is concealed
  "autocmd Syntax pandoc highlight Visual ctermbg=None guibg=None
  "Note - highlight is applied globally so for sytnax avoid Visual etc and use
  "pandocTitle etc
augroup END
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
set clipboard=unnamedplus
set foldenable
set nrformats= " All numbers treated as decimal

set scrolloff=3

set mouse=a

set fillchars+=vert:│

" save session
nnoremap <leader>s :mksession<CR>
" }}}

" Markdown {{{

let g:polyglot_disabled = ['markdown']
"let g:vim_markdown_conceal = 2
"let g:vim_markdown_conceal_code_blocks = 0
"let g:vim_markdown_fenced_languages = ['python=py', 'viml=vim', 'c++=cpp', 'ini=dosini']
"let g:vim_markdown_follow_anchor = 1
"let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"
"let g:vim_markdown_math = 1
"let g:vim_markdown_frontmatter = 1
"let g:vim_markdown_toml_frontmatter =1
"let g:vim_markdown_json_frontmatter = 1
"let g:vim_markdown_strikethrough = 1
"let g:vim_markdown_new_list_item_ident = 2
"let g:vim_markdown_no_extensions_in_markdown = 1

" }}}

"Global key mappings {{{

"Buffer switching
nnoremap <F8> :bprev<CR>
nnoremap <F9> :bnext<CR>

"Tab switching
nnoremap <F5> :tabprevious<CR>
nnoremap <F6> :tabnext<CR>

"Toggle relative numbering
nnoremap <F2> :set relativenumber!<CR>

" Quicker command by removing need for shift
nnoremap ; :
nnoremap : ;

" Enable folding with the spacebar
nnoremap <space> za
nnoremap <S-Space> zR

" Journal
nnoremap <leader>j :edit ~/Dropbox/personal/Journal/2020.cpt<CR>

" Fix syntax in vimwiki
nnoremap <leader>v :set syntax=vimwiki.markdown<CR>

" Undo
nnoremap <F10> :UndotreeToggle<cr>
" Below don't work as conflict with fullscreen and yuquake

"}}}

" YouCompleteMe {{{

" Pandoc citekeys
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.pandoc = ['@']
let g:ycm_semantic_triggers.vimwiki = ['@']
let g:ycm_semantic_triggers.tex = ['@']

let g:ycm_filetype_blacklist = {
        \ 'tagbar': 1,
        \ 'qf': 1,
        \ 'notes': 1,
        \ 'unite': 1,
        \ 'infolog': 1,
        \ 'mail': 1,
        \ 'gitcommit': 1,
        \ 'pandoc': 1,
        \ 'markdown': 1,
        \ 'vimwiki': 1
        \}

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_goto_buffer_command = 'split-or-existing-window'
nnoremap <leader>g :tab YcmCompleter GoTo<cr>

" }}}

"Python {{{
au BufNewFile,BufRead *.py
   \ set autoindent fileformat=unix foldlevel=99

"}}}

"R {{{

" }}}

"Pencil & Markdown {{{
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Goyo
nnoremap <leader>q :Goyo<CR>

" Limelight
let g:limelight_conceal_ctermfg = 239
let g:limelight_conceal_guifg = '#3c3836'
let g:limelight_default_coefficient = 0.7

" }}}

" Pandoc {{{
let g:pandoc#folding#mode = 'syntax'
let g:pandoc#filetypes#handled = ["pandoc", "markdown", "rst"]
let g:pandoc#modules#enabled = ["formatting", "folding", "toc", "command", "menu", "bibliographies", "completion"]
let g:pandoc#folding#fold_yaml=1
let g:pandoc#syntax#conceal#urls=1
let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ["python"]
let g:pandoc#biblio#bibs = ["/home/alasdair/zettel/zettel.bib"]

au BufRead,BufNewFile *.md ALEDisableBuffer
" }}}

"Tagbar {{{
nnoremap <F4> :TagbarToggle<CR>

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
nnoremap <F3> :NERDTreeToggle<CR>
"open nerdtree with the current file selected
nnoremap <leader>t :NERDTreeFind<CR>
" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" }}}

"Tasklist {{{
nnoremap <F7> :TaskList<CR>
" }}}

"FZF {{{

" }}}

"Notational-FZF {{{
let g:nv_search_paths = ['~/Dropbox/notes/zettel', './docs']
let g:nv_ignore_pattern = ['_build', '_static', '_templates']
" }}}

" VimWiki {{{
" default vimwiki is <leader>ww

" Set VimWiki to use pandoc highlighting
" & set pandoc to recognise python code blocks
" au FileType vimwiki set syntax=vimwiki.markdown
au FileType vimwiki call pandoc#completion#Init()
au FileType vimwiki set syntax=pandoc | set foldexpr=pandoc#folding#FoldExpr()
let g:vimwiki_folding='expr'
au FileType vimwiki set nospell
au FileType vimwiki set foldlevel=20
let g:vimwiki_global_ext= 0
let g:vimwiki_list = [
                        \{'path': '~/vimwiki/',
                        \ 'syntax': 'markdown', 'ext': '.md',
                        \ 'python': 'python', 'markdown': 'markdown'},
                        \{'path': '~/zettel/',
                        \ 'syntax': 'markdown', 'ext': '.md'},
                        \{'path': '~/.disintegration/',
                        \ 'syntax': 'markdown', 'ext': '.md'},
                    \]


"Hotkey for zettel
nmap <leader>z 2<leader>ww
nmap <leader>d 3<leader>ww

let g:zettel_options = [
                         \{},
                         \ {"front_matter" : {"tags" : ""}, "template" : "~/Dropbox/notes/zettel/template.tpl"}]
" }}}

" TaskWiki {{{
let g:taskwiki_markup_syntax = "markdown"
" }}}

" Spelling & Grammar {{{
"map <F5> :setlocal spell! spelllang=en_gb<CR>

nnoremap <leader>l :ALEEnableBuffer<CR>

"let g:langtool_jar='/home/alasdair/Applications/LanguageTool/languagetool-commandline.jar'
"let s:enablecategories = 'PUNCTUATION,TYPOGRAPHY,CASING,COLLOCATIONS,CONFUSED_WORDS,CREATIVE_WRITING,GRAMMAR,MISC,MISUSED_TERMS_EU_PUBLICATIONS,NONSTANDARD_PHRASES,PLAIN_ENGLISH,TYPOS,REDUNDANCY,SEMANTICS,TEXT_ANALYSIS,STYLE,GENDER_NEUTRALITY'
"let s:enable = 'AND_ALSO,ARE_ABLE_TO,ARTICLE_MISSING,AS_FAR_AS_X_IS_CONCERNED,BEST_EVER,BLEND_TOGETHER,BRIEF_MOMENT,CAN_NOT,CANT_HELP_BUT,COMMA_WHICH,EG_NO_COMMA,ELLIPSIS,EXACT_SAME,HONEST_TRUTH,HOPEFULLY,IE_NO_COMMA,IN_ORDER_TO,I_VE_A,NEGATE_MEANING,PASSIVE_VOICE,PLAN_ENGLISH,REASON_WHY,SENT_START_NUM,SERIAL_COMMA_OFF,SERIAL_COMMA_ON,SMARTPHONE,THREE_NN,TIRED_INTENSIFIERS,ULESLESS_THAT,WIKIPEDIA,WORLD_AROUND_IT'

"let g:langtool_parameters = ' --language en-GB' .
"    \ ' --enablecategories ' . s:enablecategories .
""    \ ' --enable' . s:enable

" }}}

" Airline {{{
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'help', 'mail', 'markdown', 'org', 'rst', 'tex', 'text',
                                           \ 'pandoc', 'vimwiki']

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

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" }}}

" Supertab {{{
" disabled as conflicts with vim-pandoc citations
"let g:SuperTabDefaultCompletionType="<c-x><c-o>"

" }}}

" GnuPG {{{

let g:GPGPreferSymmetric=1
let g:GPGUseAgent=1

" }}}

augroup CPT
  au!
  au BufReadPre  *.cpt setl bin viminfo= noswapfile
  au BufReadPost *.cpt let $CPT_PASS = inputsecret("Password: ")
  au BufReadPost *.cpt silent 1,$!ccrypt -cb -E CPT_PASS
  au BufReadPost *.cpt set nobin
  au BufWritePre *.cpt set bin
  au BufWritePre *.cpt silent! 1,$!ccrypt -e -E CPT_PASS
  au BufWritePost *.cpt silent! u
  au BufWritePost *.cpt set nobin
  au BufRead,BufNewFile *.cpt set filetype=pandoc | nnoremap <buffer> j gjh | nnoremap <buffer> k gkh | let g:ycm_auto_trigger=0 | ALEDisableBuffer | Goyo
augroup END

" vim:foldmethod=marker:foldlevel=0
