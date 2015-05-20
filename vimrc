" Bundles
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'shougo/vimproc.vim'
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'lokaltog/vim-easymotion'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-airline'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'junegunn/vim-easy-align'
Bundle 'Chiel92/vim-autoformat'
Bundle 'shougo/unite.vim'
Bundle 'raimondi/delimitMate'

filetype plugin indent on

" Leader
let mapleader=','
let maplocalleader=','

" Sync pastebuffers
if has ('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
end

" Plugin settings
let g:ycm_key_list_select_completion = ['<Down>']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:syntastic_c_check_header = 1
let g:syntastic_java_javac_config_file_enabled = 1
let g:airline_powerline_fonts=1

" General options
syntax on
set number
set autoindent
set smartindent
set encoding=utf-8
set backspace=indent,eol,start
set scrolloff=8 "keep 8 lines below/above cursor

" Trailing whitespaces
set list
set listchars=tab:\ \ ,trail:·

" Indenting settings
set expandtab               " use spaces for indentation
set shiftround              " round space shifts
set tabstop=4               " 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4

"" Fixes ailine
set laststatus=2

" Backups and undo
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup                       " enable backups
set backupskip=/tmp/*,/private/tmp/*"

" Language specific indenting
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType coffee setlocal shiftwidth=2 softtabstop=2
autocmd FileType haml setlocal shiftwidth=2 softtabstop=2
autocmd FileType hs setlocal shiftwidth=8 softtabstop=8 tabstop=8

" Keep selection after indenting
vnoremap > >gv
vnoremap < <gv

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" edit and source vimrc easily
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" rewrite file with sudo
cmap w!! w !sudo tee % >/dev/null

" toggle nerdtree 
nnoremap <leader>n :NERDTreeToggle<CR>

" autoformat
nnoremap <leader>f :Autoformat<CR>

" unite
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=files -start-insert file<cr>

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Colorscheme
set t_Co=256
syntax enable
colorscheme lucius
LuciusBlack
