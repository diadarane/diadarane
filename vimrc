set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('/home/diadarane/.vim/plugged')

Plug 'chiel92/vim-autoformat'
Plug 'vim-scripts/FastFold'
Plug 'sirVer/ultisnips'
Plug 'powerline/powerline'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-abolish'
Plug 'easymotion/vim-easymotion'
Plug 'ap/vim-css-color'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'davidhalter/jedi-vim'
Plug 'dbeniamine/todo.txt-vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'plasticboy/vim-markdown'
Plug 'python-mode/python-mode'
Plug 'reedes/vim-wordy'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc'
Plug 'fatih/vim-go'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'w0rp/ale'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'tbastos/vim-lua'
Plug 'leafo/moonscript-vim'
Plug 'vim-scripts/bash-support.vim'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'rstudio/rmarkdown'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-unimpaired'
Plug 'raimondi/delimitmate'
Plug 'toml-lang/toml'
Plug 'elzr/vim-json'
Plug 'rrethy/vim-illuminate'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'sirver/ultisnips'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'kitagry/asyncomplete-tabnine.vim', { 'do': './install.sh' }
Plug 'gelguy/wilder.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()

syntax enable
filetype plugin indent on
set number
set ruler
set ttyfast
set relativenumber
set wildignore+=*/vendor,*/node_modules/*,_site,*/__pycache__,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk
set encoding=utf-8
set textwidth=88
set tabstop=4 shiftwidth=4 expandtab
set smarttab
set backspace=indent,eol,start
" Enable folding
set foldlevel=99
" Search settings
set incsearch
set hlsearch
set cursorline
set showmatch
set completeopt=longest,menuone

"------------------------------------------------------------
" mappings
"------------------------------------------------------------
" jump through errors
nnoremap <C-e> :lnext
"split navigations
noremap <F3> :Autoformat<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
"map leadlead-F to ctrl-j to quickly acejump
nnoremap <C-;> <leader><leader>f
nnoremap <Shift-C-;> <leader><leader>f
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
vnoremap <C-c> "*y
" Enable folding with the spacebar
nnoremap <space> za

" Popup menu settings
" change the behavior of the <Enter> key when the popup menu is visible. In that case
" the Enter key will simply select the highlighted menu item, just as <C-Y>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" open omni completion menu closing previous if open and opening new menu without
" changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without
" changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

"------------------------------------------------------------
" WEB / HTML / CSS SETUP
"------------------------------------------------------------
autocmd BufRead,BufNewFile *.json,*.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}

"------------------------------------------------------------
" diary / notes
"------------------------------------------------------------
"autocmd BufEnter,BufRead,BufNewFile *.md Goyo

"-----------------------------------------------------------
" Asyncomplete
"-----------------------------------------------------------
if executable('pyls')
        " pip install python-language-server
        au User lsp_setup call lsp#register_server({
            \ 'name': 'pyls',
            \ 'cmd': {server_info->['pyls']},
            \ 'allowlist': ['python'],
            \ })
endif

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 1

set completeopt=menuone,noinsert,noselect,preview

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>

inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

imap <c-space> <Plug>(asyncomplete_force_refresh)
" For Vim 8 (<c-@> corresponds to <c-space>):
" " imap <c-@> <Plug>(asyncomplete_force_refresh)

let g:asyncomplete_auto_popup = 1

"-----------------------------------------------------------
" Tabnine
"-----------------------------------------------------------
call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
    \ 'name': 'tabnine',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#tabnine#completor'),
    \ 'config': {
        \   'line_limit': 1000,
    \   'max_num_result': 20,
    \  },
    \ }))

"-----------------------------------------------------------
" Tmux-complete
"-----------------------------------------------------------
let g:tmuxcomplete#asyncomplete_source_options = {
                  \ 'name':      'tmuxcomplete',
              \ 'whitelist': ['*'],
              \ 'config': {
                  \     'splitmode':      'words',
              \     'filter_prefix':   1,
              \     'show_incomplete': 1,
              \     'sort_candidates': 0,
              \     'scrollback':      0,
              \     'truncate':        0
              \     }
              \ }

" By default, tmux-complete sets Vim's completefunc, that can be invoked with <C-X><C-U>
let g:tmuxcomplete#trigger = 'completefunc'

" Alternatively, you can use Vim's omnifunc, that can be invoked with <C-X><C-O>. This
" setting also integrates with YouCompleteMe so you can see Tmux completions when
" hitting <C-Space>
let g:tmuxcomplete#trigger = 'omnifunc'

"-----------------------------------------------------------
" Airline
"-----------------------------------------------------------
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"------------------------------------------------------------
" Illuminate
"------------------------------------------------------------
let g:Illuminate_delay = 0
let g:Illuminate_highlightUnderCursor = 1

"------------------------------------------------------------
" Indent Guides
"------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"------------------------------------------------------------
" JSON
"------------------------------------------------------------
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
    autocmd!
    autocmd FileType json set autoindent
    autocmd FileType json set formatoptions=tcq2l
    autocmd FileType json set textwidth=78 shiftwidth=2
    autocmd FileType json set softtabstop=2 tabstop=8
    autocmd FileType json set expandtab
    autocmd FileType json set foldmethod=syntax
augroup END

"------------------------------------------------------------
" YouCompleteMe PLUGIN SETUP
"------------------------------------------------------------
let g:ycm_filetype_blacklist = {}
let g:ycm_filetype_whitelist = {
        \ 'text': 1,
        \ 'markdown': 1,
        \ 'notes': 1
        \}
let g:ycm_filetype_specific_completion_to_disable = {
        \ 'gitcommit': 1
        \}
let g:ycm_always_populate_location_list = 1
let g:ycm_cache_omnifunc = 1
let g:ycm_show_diagnostic_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:syntastic_enable_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:syntastic_echo_current_error = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_auto_trigger = 1
let g:ycm_use_ultisnips_completer = 1


"------------------------------------------------------------
" Ale
"
"------------------------------------------------------------
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" You should not turn this setting on if you wish to use ALE as a completion
" " source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1

" ALE provides omni-completion function you can use for trigger completion
" manually with <C-x><C-o>
set omnifunc=ale#completion#OmniFunc

" ALE supports automatic imports from external modules
let g:ale_completion_autoimport = 1

" ALE supports jumping to the definition of words under your cursor with the
" :ALEGoToDefinition command using any enabled Language Server Protocol linters and
" tsserver.
"
" See :help ale-go-to-definition for more information.


"------------------------------------------------------------
" Vim Latex Live Preview
"------------------------------------------------------------
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'pdflatex'
let g:livepreview_use_biber = 1

"------------------------------------------------------------
" ultisnips PLUGIN SETUP
"------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"------------------------------------------------------------
" syntastic PLUGIN SETUP
"------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Syntastic Statusline configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"------------------------------------------------------------
" Rust
"------------------------------------------------------------
let g:rustfmt_autosave = 1

"------------------------------------------------------------
" Powerline
"------------------------------------------------------------
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
" set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

"------------------------------------------------------------
" nerdtree PLUGIN SETUP
"------------------------------------------------------------
let NERDTreeWinSize=26
autocmd StdinReadPre * let s:std_in=1
"ignore some files
let NERDTreeRespectWildIgnore=1
" close nerdtree on close
autocmd VimLeave * NERDTreeClose
"auto open nerdtree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

"------------------------------------------------------------
" easyalign PLUGIN SETUP
"------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"------------------------------------------------------------
" tmuxline
"------------------------------------------------------------
let g:tmuxline_preset = 'full'

"------------------------------------------------------------
" Promptline
"------------------------------------------------------------
let g:promptline_preset = 'full'
let g:promptline_theme = 'airline'

"------------------------------------------------------------
" Bash
"------------------------------------------------------------
" Add command :Bash [<args>] to run the interpreter with arguments.
" Add command :BashCheck. the run the syntax checker.
" Add command :BashDirectRun to run executable scripts without g:BASH_Executable.
" Add command :BashOutputMethod to set the output destination for :Bash.
" Add command :BashExecutable to set the executable during runtime

"------------------------------------------------------------
" FastFold PLUGIN SETUP
"------------------------------------------------------------
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook              = 1
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']
"let g:markdown_folding               = 1
let g:tex_fold_enabled               = 1
let g:vimsyn_folding                 = 'af'
let g:xml_syntax_folding             = 1
let g:javaScript_fold                = 1
let g:sh_fold_enabled                = 7

"------------------------------------------------------------
" ctrlp PLUGIN SETUP
"------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"------------------------------------------------------------
" ditto.vim PLUGIN SETUP
"------------------------------------------------------------
" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
"au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
"nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto	       " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto	       " Call Ditto on operator movement

"nmap =d <Plug>DittoNext                " Jump to the next word
"nmap -d <Plug>DittoPrev                " Jump to the previous word
"nmap +d <Plug>DittoGood                " Ignore the word under the cursor
"nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
"nmap ]d <Plug>DittoMore                " Show the next matches
"nmap [d <Plug>DittoLess                " Show the previous matches

"------------------------------------------------------------
" Wordy PLUGIN SETUP
"------------------------------------------------------------
noremap <silent> <F8> :<C-u>NextWordy<cr>
let g:wordy#ring = [
  \ ['weak', 'weasel', 'opinion', 'adverbs', 'adjectives'],
  \ 'weak',
  \ ['being', 'passive-voice', ],
  \ 'business-jargon',
  \ 'weasel',
  \ 'puffery',
  \ ['problematic', 'redundant', ],
  \ ['colloquial', 'idiomatic', 'similies', ],
  \ 'art-jargon',
  \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
  \ 'adjectives',
  \ 'adverbs',
  \ ]

"------------------------------------------------------------
" Goyo PLUGIN SETUP
"------------------------------------------------------------
" Width
let g:goyo_width=120
autocmd BufRead, BufNewFile QuickNote.md Goyo
"------------------------------------------------------------
" todo.txt-vim PLUGIN SETUP
"------------------------------------------------------------
"au filetype todo setlocal omnifunc=todo#complete
let g:Todo_txt_prefix_creation_date=1

"------------------------------------------------------------
" vim-markdown PLUGIN SETUP
"------------------------------------------------------------
let g:vim_markdown_new_list_item_indent = 1
set conceallevel=0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 4

"------------------------------------------------------------
" vim-markdown PLUGIN SETUP
"------------------------------------------------------------
:let g:notes_directories    = ['~/Documents/Syncthing/Default Folder/Notebooks']
:let g:notes_suffix         = '.md'
:let g:notes_conceal_code   = 0
:let g:notes_conceal_italic = 0
:let g:notes_conceal_bold   = 0
:let g:notes_conceal_url    = 0

"------------------------------------------------------------
" LATEX SETUP
"------------------------------------------------------------
let g:vimtex_enabled=1
let g:vimtex_complete_recursive_bib=1
"let g:vimtex_fold_manual=1
let g:vimtex_fold_enabled =1
"autocmd BufEnter *.tex set foldmethod=expr
"autocmd BufEnter *.tex set foldexpr=vimtex#fold#level(v:lnum)
"autocmd BufEnter *.tex set foldtext=vimtex#fold#text()
"

let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'jobs',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

autocmd BufEnter *.py set foldmethod=indent
"------------------------------------------------------------
"PYTHON COMPATIBILITY
"------------------------------------------------------------
"pymode mappings
let g:pymode_rope_rename_bind = '<C-c>rr'
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
let g:pymode_rope_extract_method_bind = '<C-c>rm'
let g:pymode_rope_extract_variable_bind = '<C-c>rl'
"au BufNewFile,BufRead *.py
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set textwidth=120
"set expandtab
"set autoindent
"set fileformat=unix

" disable pymode linting because we use syntastic
"let g:pymode_lint_on_write = 0
"let g:pymode = 1
"let g:pymode_options_max_line_length = 120
"let g:pymode_rope_completion = 1
"let g:pymode_rope_complete_on_dot = 1
"let g:pymode_rope_completion_bind = '<C-Space>'
"let g:pymode_rope_autoimport = 1
"let g:pymode_rope_autoimport_import_after_complete = 1
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1 "highlight python like crazy

"------------------------------------------------------------
"vim custom functions
"------------------------------------------------------------
command! SpellOn set spell spelllang=en_us
command! SpellOff set nospell
command! Bgd set background=dark
command! Bgl set background=light
"command -nargs=1 PadRight <f-args>s/.*/\=printf('%-72s',submatch(0))
command! Date r !date

" DELETE FILES
function! DeleteFile(...)
  if(exists('a:1'))
    let theFile=a:1
  elseif ( &ft == 'help' )
    echohl Error
    echo "Cannot delete a help buffer!"
    echohl None
    return -1
  else
    let theFile=expand('%:p')
  endif
  let delStatus=delete(theFile)
  if(delStatus == 0)
    echo "Deleted " . theFile
  else
    echohl WarningMsg
    echo "Failed to delete " . theFile
    echohl None
  endif
  return delStatus
endfunction
"delete the current file
com! Rm call DeleteFile()
"delete the file and quit the buffer (quits vim if this was the last file)
com! RM call DeleteFile() <Bar> q!

"------------------------------------------------------------
" vim-lsp
"------------------------------------------------------------
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup end

let g:lsp_fold_enabled = 0

"------------------------------------------------------------
" Vim lsp-settings
"------------------------------------------------------------
let g:lsp_diagnostic_enable = 1
let g:lsp_document_highlight_enable = 1

highlight lspReference ctermfg=red ctermbg=green

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

"------------------------------------------------------------
" Ultisnips
"------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"------------------------------------------------------------
" Wider wildmenu enhance
"------------------------------------------------------------
" Key bindings can be changed, see below
call wilder#setup({'modes': [':', '/', '?']})

call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ 'enable_cmdline_enter': 1,
      \ })

"------------------------------------------------------------
"vim custom functions END
"------------------------------------------------------------


"------------------------------------------------------------
"vim custom remaps
"------------------------------------------------------------
"------------------------------------------------------------
"vim custom remamps END
"------------------------------------------------------------

iab h1. ################################################################################
\<CR>################################################################################

iab h2. ********************************************************************************
\<CR>********************************************************************************

ab h3. ================================================================================
ab h4. --------------------------------------------------------------------------------
ab h5. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
ab h6. """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
