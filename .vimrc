"Standard {{{

set nocompatible
syntax on
set modelines=1
set encoding=utf-8
" }}}

"Vundle {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'python-mode/python-mode'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'reedes/vim-pencil'
Plugin 'vimwiki/vimwiki'
Plugin 'michal-h21/vim-zettel'
Plugin 'tbabej/taskwiki'
Plugin 'ervandew/supertab'
Plugin 'mbbill/undotree'
Plugin 'chrisbra/Colorizer'
Plugin 'mboughaba/i3config.vim'
Plugin 'rhysd/vim-grammarous'
Plugin 'dpelle/vim-LanguageTool'
Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

" }}}

"Theme {{{
set termguicolors
" need to get gray relative numbers to work with gruvbox
" colorscheme 256-grayvim
set background=dark
let g:gruvbox_italics=1
let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox
highlight Comment cterm=italic
highlight Folded cterm=italic
" highlight SpellBad cterm=underline,bold ctermbg=red
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
set clipboard=unnamedplus
set foldenable

set mouse=a

set fillchars+=vert:│

" save session
nnoremap <leader>s :mksession<CR>
" }}}

"Global key mappings {{{

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Buffer switching
nmap <F8> :bprev<CR>
nmap <F9> :bnext<CR>

"Toggle relative numbering
nnoremap <F4> :set relativenumber!<CR>

" Quicker command by removing need for shift
nnoremap ; :
 
" Enable folding with the spacebar
nnoremap <space> za
nnoremap <S-Space> zR

" Journal
nnoremap <leader>j :edit ~/Dropbox/personal/journal/2019.md<CR>

" Fix syntax in vimwiki
nnoremap <leader>v :set syntax=vimwiki.markdown<CR>

" Undo
nnoremap <F10> :UndotreeToggle<cr>
" Below don't work as conflict with fullscreen and yuquake
nnoremap <F11> :earlier<cr>
nnoremap <F12> :later<cr>

"}}}

" YouCompleteMe {{{

" Pandoc citekeys
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.pandoc = ['@']
let g:ycm_semantic_triggers.vimwiki = ['@']

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

" }}}

"Python {{{
au BufNewFile,BufRead *.py
   \ set autoindent fileformat=unix foldlevel=99

"Jedi
"let g:jedi#use_splits_not_buffers = "left"
"let g:jedi#show_call_signatures = "1"

"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>R"

"let g:jedi#popup_on_dot = 0

"Python-mode

"turn-off rope to prevent jedi conflicts
"let g:pymode_rope = 0

"let g:pymode_trim_whitespaces = 1
"let g:pymode_options_max_line_length = 79
"let g:pymode_options_color_column = 1

"let g:pymode_python = 'python3'

"let g:pymode_indent = 1
"let g:pymode_folding = 1

"let g:pymode_motion = 1

"let g:pymode_virtualenv = 1

"let g:pymode_run = 1
"let g:pymode_run_bind = '<F5>'
"imap <F5> <Esc>:w<CR>!clear;python %<CR>

"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'
"let g:pymode_breakpoint_cmd = ''

"let g:pymode_lint = 1
"let g:pymode_lint_unmodified = 1
"let g:pymode_lint_message = 1
"let g:pymode_lint_checkers = ['pyflakes', 'pep8']
"let g:pymode_lint_ignore = ["E501"]
"let g:pymode_lint_cwindow = 1

"let g:pymode_syntax = 1
"let g:pymode_syntax_slow_sync = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_space_errors = 0

"}}}

"Pencil & Markdown {{{
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
 
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Goyo
map <leader>f :Goyo 120<CR>

" Limelight
let g:limelight_conceal_ctermfg = 239
let g:limelight_conceal_guifg = '#3c3836'
let g:limelight_default_coefficient = 0.7

" }}}

" Pandoc {{{
let g:pandoc#folding#mode = 'syntax'
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#folding#mode = 'syntax'
let g:pandoc#modules#enabled = ["formatting", "folding", "toc", "command", "menu", "bibliographies", "completion"]
let g:pandoc#folding#fold_yaml=1
let g:pandoc#syntax#conceal#urls=1
let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ["python"]
let g:pandoc#completion#bib#mode = 'citeproc'
" }}}

"Tagbar {{{
nmap <F7> :TagbarToggle<CR>
" }}}

" VimWiki {{{
" default vimwiki is <leader>ww

" Set VimWiki to use pandoc highlighting
" & set pandoc to recognise python code blocks
" au FileType vimwiki set syntax=vimwiki.markdown
au FileType vimwiki call pandoc#completion#Init()
au FileType vimwiki set syntax=markdown.pandoc | set foldexpr=pandoc#folding#FoldExpr()
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
                         \ {"front_matter" : {"tags" : ""}, "template" : "~/Dropbox/notes/zettel/.zettel.tpl"},
                         \{}]
" }}}

" TaskWiki {{{
let g:taskwiki_markup_syntax = "markdown"
" }}}

" Spelling & Grammar {{{
map <F5> :setlocal spell! spelllang=en_gb<CR>
map <F6> :LanguageToolCheck<CR>


let g:languagetool_jar='$HOME/Applications/LanguageTool/languagetool-commandline.jar'
let g:languagetool_lang='en-GB'
let g:languagetool_enable_categories = 'PUNCTUATION,TYPOGRAPHY,CASING,COLLOCATIONS,CONFUSED_WORDS,CREATIVE_WRITING,GRAMMAR,MISC,MISUSED_TERMS_EU_PUBLICATIONS,NONSTANDARD_PHRASES,PLAIN_ENGLISH,TYPOS,REDUNDANCY,SEMANTICS,TEXT_ANALYSIS,STYLE,GENDER_NEUTRALITY'
let g:languagetool_enable_rules = 'AND_ALSO,ARE_ABLE_TO,ARTICLE_MISSING,AS_FAR_AS_X_IS_CONCERNED,BEST_EVER,BLEND_TOGETHER,BRIEF_MOMENT,CAN_NOT,CANT_HELP_BUT,COMMA_WHICH,EG_NO_COMMA,ELLIPSIS,EXACT_SAME,HONEST_TRUTH,HOPEFULLY,IE_NO_COMMA,IN_ORDER_TO,I_VE_A,NEGATE_MEANING,PASSIVE_VOICE,PLAN_ENGLISH,REASON_WHY,SENT_START_NUM,SERIAL_COMMA_OFF,SERIAL_COMMA_ON,SMARTPHONE,THREE_NN,TIRED_INTENSIFIERS,ULESLESS_THAT,WIKIPEDIA,WORLD_AROUND_IT'

let g:grammarous#enabled_categories = {'*' : ['PUNCTUATION', 'TYPOGRAPHY', 'CASING', 'COLLOCATIONS', 'CONFUSED_WORDS', 'CREATIVE_WRITING', 'GRAMMAR', 'MISC', 'PLAIN_ENGLISH', 'TYPOS', 'REDUNDANCY', 'SEMANTICS', 'TEXT_ANALYSIS', 'STYLE', 'GENDER_NEUTRALITY']}
let g:grammarous#enabled_rules = {'*' : ['AND_ALSO', 'ARE_ABLE_TO', 'ARTICLE_MISSING', 'AS_FAR_AS_X_IS_CONCERNED', 'BEST_EVER', 'BLEND_TOGETHER', 'BRIEF_MOMENT', 'CAN_NOT', 'CANT_HELP_BUT', 'COMMA_WHICH', 'EG_NO_COMMA', 'ELLIPSIS', 'EXACT_SAME', 'HONEST_TRUTH', 'HOPEFULLY', 'IE_NO_COMMA', 'IN_ORDER_TO', 'I_VE_A', 'NEGATE_MEANING', 'PASSIVE_VOICE', 'PLAN_ENGLISH', 'REASON_WHY', 'SENT_START_NUM', 'SERIAL_COMMA_OFF', 'SERIAL_COMMA_ON', 'SMARTPHONE', 'THREE_NN', 'TIRED_INTENSIFIERS', 'ULESLESS_THAT', 'WIKIPEDIA', 'WORLD_AROUND_IT']}

" }}}

" Airline {{{
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'help', 'mail', 'markdown', 'org', 'rst', 'tex', 'text',
                                           \ 'pandoc', 'vimwiki']

let g:airline#extensions#ale#enabled = 1

" }}}

" ALE {{{

" Disable lint whilst typing
let g:ale_python_auto_pipenv = '1'
let g:ale_fix_on_save = 1

let g:ale_linter_aliases = {'pandoc': ['markdown']}

" }}}

" Supertab {{{
let g:SuperTabDefaultCompletionType="<c-x><c-o>"

" }}}

" vim:foldmethod=marker:foldlevel=0
