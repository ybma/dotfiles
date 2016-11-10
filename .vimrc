"pathogen to install vim plugins
"execute pathogen#infect()
set nocompatible
filetype off
"filetype plugin indent on
"syntax on

"Set up Vundle:
"$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'rking/ag.vim'
Bundle 'ervandew/supertab'
" Track the engine.
Bundle 'SirVer/ultisnips'
Plugin 'rdnetto/YCM-Generator'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'

Plugin 'vim-airline/vim-airline-themes'
" ... easy align
Plugin 'junegunn/vim-easy-align'

"... file type plugin to help edit xml
Plugin 'sukima/xmledit'

"...rails plugin
Plugin 'tpope/vim-rails'

"...managing code snippets
"Plugin 'garbas/vim-snipmate'

"... vim-ruby
Plugin 'vim-ruby/vim-ruby'

Plugin 'flazz/vim-colorschemes'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'vimwiki/vimwiki'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"...
"Unite
"   depend on vimproc
"   ------------- VERY IMPORTANT ------------
"   you have to go to .vim/plugin/vimproc.vim and do a ./make
"   -----------------------------------------
let g:unite_source_history_yank_enable = 1
try
let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
"search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async:~../..<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" type ** to search the word in all files in the current dir
" nmap * :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag<space>

set nu
" select something with the mouse will result in a visual mode selection
"set mouse=a
set wrap
set encoding=utf-8
set linebreak
set syntax=on
" set tabs to have 4 spaces
set ts=4
" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
set softtabstop=4
set hlsearch
set incsearch
set nobackup
set noswapfile
set ignorecase
set tags=tags;
set autochdir
set smartindent
set clipboard=unnamed
set backspace=indent,eol,start
" enable folding
set foldmethod=indent
set foldlevel=99
" vim-airline
set laststatus=2
" set color term to 256 colors
set t_Co=256
" show the matching part of the pair for [] {} and ()
set showmatch

autocmd FileType * setlocal formatoptions-=cro
" let NerdTreDTreeShowHidden=1
" Start NERDTree
autocmd vimenter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

map ,/ </<C-X><C-O>

syntax on
colorscheme jellybeans
" colorscheme elflord
" Shortcut to rapidly toggle `set list`
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Fix Whitespace color settings
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif


" Ramap 'jj' to excape insert mode
inoremap jj <Esc>

" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding with the spacebar
nnoremap <space> za


"cursor shape settings
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" In visual mode, use Y to copy to system clipboard
"vnoremap Y "*y
"
" " In normal mode, do the same with the current line
"nnoremap Y "*yy

"vimwiki settings
let g:vimwiki_list = [{'path': '/Users/jenkins/Documents/OneDrive/vimwiki', 'path_html': '~/public_html/'}]
let g:vimwiki_hl_headers = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe (YCM) config {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When this option is set to 1, YCM's identifier completer will also
" collect
" identifiers from strings and comments. Otherwise, the text in comments and
" strings will be ignored.
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" source: https://github.com/Valloric/YouCompleteMe

" disable preview window on auto-complete:
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0


" try to fix random freeze on autocomplete:
let g:ycm_register_as_syntastic_checker = 0

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" source:
" https://github.com/Valloric/YouCompleteMe#i-get-a-weird-window-at-the-top-of-my-file-when-i-use-the-semantic-engine

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe (YCM), SuperTab, and UltiSnips config {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"  autocomplete window goes away when you’re done with it
let g:ycm_autoclose_preview_window_after_completion=1
" space-g will goto definition of currently on
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<S-tab>"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" from ultisnips help:
" Supertab - UltiSnips has built-in support for Supertab. Just use a
" recent
" enough version of both plugins and <tab> will either expand a snippet
" or defer
" to Supertab for expansion.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SimpylFold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SimpylFold_docstring_preview=1

" python syntax checking
let python_highlight_all=1
syntax on

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"
" Python PEP8 Indentation
"

"au BufRead,BufNewFile *.js set sw=2 sts=2

au BufNewFile,BufRead *.py
    \ set tabstop=4         |
    \ set softtabstop=4     |
    \ set shiftwidth=4      |
    \ set textwidth=79      |
    \ set expandtab         |
    \ set autoindent        |
    \ set fileformat=unix

au BufNewFile,BufRead *.js set sw=2 sts=2
au BufRead,BufNewFile *.html set sw=2 sts=2
au BufRead,BufNewFile *.css set sw=2 sts=2


