"" Plugins and plugin configuration

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Undo/Redo Tree
"Plugin 'sjl/gundo.vim'

Plugin 'luochen1990/rainbow'            " Rainbow parenthesis coloring
let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'tex': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \       },
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \       },
            \       'vim': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \       'html': {
            \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \       'css': 0,
            \   }
            \}

" vim and tmux integration
Plugin 'benmills/vimux'
let g:VimuxOrientation = "h"
let g:VimuxHeight = "35"

" Smarter '.'
"Plugin 'tpope/vim-repeat'

" Explorer for buffers
"Plugin 'jlanzarotta/bufexplorer'

" Automatic space alignment
"Plugin 'godlygeek/tabular'

" <p>Surrond</p>
"Plugin 'tpope/vim-surround'

" Ctrl A/X increase/descrease on steroids
"Plugin 'tpope/vim-speeddating'

" [ and ] mappings on steroids
"Plugin 'tpope/vim-unimpaired'

" Dipatch build/test
"Plugin 'tpope/vim-dispatch'

" Fugitive Git Wrapper
Plugin 'tpope/vim-fugitive'

" Set directory to vim root
"Plugin 'airblade/vim-rooter'

" Phabricator Arcanist Wrapper
"Plugin 'phleet/vim-arcanist'

" Doxygen comments
Plugin 'DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName="Shijie Li <lishijie0602@gmail.com>"

" Clang format for C/C++/ObjC
"Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
autocmd FileType python nnoremap <buffer><Leader>cf :<C-u>pyf /usr/local/bin/clang-format.py<CR>
autocmd FileType python inoremap <Leader>cf <ESC>:pyf /usr/local/bin/clang-format.py<CR>i

" Diff signs in gutter for Git index/working diffs
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_max_signs = 1000

" Git Exploration plugin
"Plugin 'gregsexton/gitv'

" NERDTree for silesystem exploation
Plugin 'scrooloose/nerdtree'
if g:platform == "AIX"
    let NERDTreeDirArrows=0
endif
let NERDTreeShowBookmarks=1

" ctrlP Plugin
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" NERDCommenter for easy commenting
Plugin 'scrooloose/nerdcommenter'

" Airline for pretty status/tab lines
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin '
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1 " git gutter
let g:airline_theme='base16_pop'
if g:platform == "Linux" || g:platform == "Darwin" || g:platform == "SunOS"
    " Use Patched fonts on Linux and Sun
    let g:airline_powerline_fonts = 1
endif

" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
Plugin 'flazz/vim-colorschemes'

" Makes GVim colorscheme available in the terminal
"Plugin 'godlygeek/csapprox'

" Syntax checking
Plugin 'scrooloose/syntastic'

if g:platform != "AIX"
    let g:syntastic_error_symbol = '✗✗'
    let g:syntastic_style_error_symbol = '✠✠'
    let g:syntastic_warning_symbol = '∆∆'
    let g:syntastic_style_warning_symbol = '≈≈'
endif
if g:platform == "Darwin"
    let g:syntastic_cpp_compiler = 'g++'
    let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
endif

" ListToggle for display of quickfix/location list
Plugin 'Valloric/ListToggle'

" Alternate for C/C++ Header/Source navigation
Plugin 'a.vim'

" Easymotion for superquick motions
"Plugin 'Lokaltog/vim-easymotion'

" Easy Ctag explorer
Plugin 'majutsushi/tagbar'

" Tmux movement mappings
Plugin 'christoomey/vim-tmux-navigator'

" Linux-Only plug-ins
if g:platform == "Linux" || g:platform == "Darwin"
    " Autocompletion and semantic completion
    Plugin 'Valloric/YouCompleteMe'
    "let g:ycm_server_log_level = 'debug'
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_always_populate_location_list = 1
    let g:ycm_global_ycm_extra_conf = '~/.ycm_default_conf.py'

    " Show Location list output in airline
    Plugin 'asenac/vim-airline-loclist'
    let g:airline#extensions#loclist#enabled = 1

    " Nice airline-like bash prompt
    Plugin 'edkolev/promptline.vim'

    " Nice airline-like tmux prompt
    Plugin 'edkolev/tmuxline.vim'

        " Snippets
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    " Trigger configuration. Do not use <tab>.
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="vertical"
endif

"" Stuff I want to try
"Plugin 'tpope/vim-vinegar'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'xolox/vim-session'
"Plugin 'junegunn/vim-easy-align'
"Plugin 'rhysd/clever-f.vim'

call vundle#end()
filetype plugin indent on

" =========== promptline config and help
    " help - store the generated 'file', run it in zshrc
    " :PromptlineSnapshot [file] [theme] [preset]
    "
let g:promptline_powerline_symbols = 1
let g:promptline_theme = 'jelly'
let g:promptline_preset = {
    \ 'a':  [ '%M' ],
    \ 'b':  [ promptline#slices#cwd({'dir_limit':1}) ],
    \ 'x':  [ promptline#slices#vcs_branch() ],
    \ 'warn': [ promptline#slices#last_exit_code() ]}

" =========== tmuxline config and help
    " tmuxline command help 
    " step 1) set the theme
    " :Tmuxline [themem] [preset]
    " step 2) generate scripts which can run in tmux.conf
    ":TmuxlineSnapshot tmux_prompt.sh
    "
let g:tmuxline_powerline_separators = 1
let g:tmuxline_theme = 'jellybeans'
let g:tmuxline_separators = {
    \ 'left': '',
    \ 'left_alt': '>',
    \ 'right': '',
    \ 'right_alt': '<',
    \ 'space' : ' '}
let g:tmuxline_preset = {
    \ 'a'    :   '#[fg=colour231,bg=colour28] #S #[fg=colour22,bg=colour233,nobold,nounderscore,noitalics]',
    \ 'cwin' :   '#[fg=colour39,bg=colour235] #I> #[fg=colour39,bg=colour235,nobold,noitalics] #W ',
    \ 'win'  :   '#[fg=colour231,bg=colour233] #I> #[fg=colour231,bg=colour233,nobold,noitalics] #W ',
    \ 'x'    :   '#[fg=colour39,bg=colour235,nobold,nounderscore,noitalics] %a %H:%M %Y-%m-%d',
    \ 'y'    :   '#[fg=colour210,bg=colour231, italics] |Love TT|'}


" Brief help for Vbundle
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
