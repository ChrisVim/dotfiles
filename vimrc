set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-misc'
Plugin 'lervag/vimtex'

" Plugins for Python
Plugin 'jiangmiao/auto-pairs'
Plugin 'xolox/vim-session'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'

" Snippet wrapper and Snippet files
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

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

" set vim look
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" don't show docstring window for jedi-autocompletion
autocmd FileType python setlocal completeopt-=preview

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=131 guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" set theme
syntax enable
colorscheme gruvbox
set background=dark    " Setting dark mode

" Showing line numbers and length
" set relativenumber  " show line numbers
set number  " show line numbers
set tw=79   " width of document (used by gd)
set colorcolumn=80
highlight ColorColumn ctermbg=237
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" set tabs and spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" map NerdTreee button
map <C-n> :NERDTreeToggle<CR>

" easier moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easier moving between tabs
let mapleader = ","
nnoremap <Leader>m <esc>:tabnext<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"

" Fast wrap for auto pairs
let g:AutoPairsShortcutFastWrap = '<F5>'

" configure powerline
set laststatus=2
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" show definitions on right split (, - d)
let g:jedi#use_splits_not_buffers = "right"

" snippet configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEditSplit="vertical"

" open .tex files as latex
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'zathura'

" change latex completion to space ctrl
autocmd FileType tex inoremap <buffer> <C-@> <C-x><C-o>

" use j and k for swiping through the completion
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
