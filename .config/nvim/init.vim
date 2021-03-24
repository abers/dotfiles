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

"Coc recommended settings
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif


" save session
nnoremap <leader>s :mksession<CR>
" }}}

"Vim-Plug {{{
"Polyglot complains if this is not set first
let g:polyglot_disabled = ['markdown']

"pyenv
let g:python3_host_prog = '/home/alasdair/.pyenv/versions/py3nvim/bin/python'

call plug#begin()

"Plug 'flazz/vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
"Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mhinz/neovim-remote'
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
"Plug 'ervandew/supertab'
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

"Both the below currently require nvim nightly (>0.5)
"Telescope
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Treesitter
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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

" Telescope {{{

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" }}}

"Coc {{{
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<c-Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
" }}}

"Python {{{
au BufNewFile,BufRead *.py
   \ set autoindent fileformat=unix foldlevel=99

"}}}

"R {{{
let g:rmd_fenced_languages = ['r', 'python']
let g:markdown_fenced_languages = ['r', 'python']
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
"let g:ale_python_black_options = '-l 80'

let g:ale_linter_aliases = {'pandoc': ['markdown']}
"let g:ale_linters = {'pandoc': ['vale', 'langtool']}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" }}}

" vim:foldmethod=marker:foldlevel=0
