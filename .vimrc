"pathogen to install vim plugins
"execute pathogen#infect()
set nocompatible
filetype off
"filetype plugin indent on
"syntax on

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

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

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required


"Colorscheme
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
call plug#end()
" -- solarized personal conf
set background=dark
try
   colorscheme solarized
   catch
endtry

"Fix Whitespace color settings
if (exists('+colorcolumn'))
        set colorcolumn=80
            highlight ColorColumn ctermbg=9
endif

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

" Ramap 'jj' to excape insert mode
inoremap jj <Esc>

" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>

set nu
set mouse=a
set wrap
set linebreak
set syntax=on
set ts=2
set expandtab
set shiftwidth=2
set softtabstop=2
set hlsearch
set incsearch
set nobackup
set noswapfile
set ignorecase
set autoindent
set tags=tags;
set autochdir
set smartindent
set clipboard=unnamed
set backspace=indent,eol,start
" vim-airline
set laststatus=2
autocmd FileType * setlocal formatoptions-=cro
autocmd vimenter * NERDTree
" color darkblue

map ,/ </<C-X><C-O>

"cursor shape settings
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" In visual mode, use Y to copy to system clipboard
"vnoremap Y "*y
"
" " In normal mode, do the same with the current line
"nnoremap Y "*yy

"vimwiki settings
let g:vimwiki_list = [{'path': '/Users/yubao/OneDrive/vimwiki', 'path_html': '~/public_html/'}]
let g:vimwiki_hl_headers = 1


