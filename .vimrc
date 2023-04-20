"" Customize vimrc files with specific files
syntax on
set exrc

"" Files backup, UNDO, REDO.
set nocompatible                "" disable vi compatibility mode
set history=1000                "" increase history size
set noswapfile                  "" don't create a swapfiles
set nobackup                    "" don't backup, use git

"" Enable filetype.
filetype indent plugin on

"" Persist undo history between file editing sessions.
set undodir=~/.vim/undodir
set undofile

"" Install vim-gtk to support clipboard between SO and Vim
set clipboard=unnamedplus		"" enable register + to export internal Vim Clipboard
set clipboard+=unnamed			"" enable register "" to import extern Clipboard

"" Cursor and columns and search
set mouse=a                     "" active mouse scroll
set cursorline
set guicursor=
set nohlsearch
set incsearch
set scrolloff=10
set colorcolumn=100
set fillchars+=vert:\┊

"" Buffers
set encoding=utf-8
set hidden

"" Turn off bells
set noerrorbells
set belloff=all

"" Indent and tabulations
set tabstop=4 softtabstop=4
set shiftwidth=4
"set expandtab
set cindent
set smartindent
set autoindent

""set signcolumn=yes
set noshowmode
"set noruler         "" no ruler
set noshowcmd
set nowrap          "" no limit in line
set laststatus=0    "" always show status bar
set wildmenu        "" enable visual menu
set relativenumber  "" realite number in column
set nu              "" enable number of column
set numberwidth=4
set showmatch       "" highlight matching parentheses and brackets

"" Mark trailing spaces depending on whether we have a fancy terminal or not.
if &t_Co > 2
    highlight ExtraWhitespace ctermbg=1
    match ExtraWhitespace /\s\+$/
else
    set listchars=trail:~
    set list
endif

let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

"" Move in the windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>r :wincmd r<CR>

"" Resize windows (not font)
nnoremap <leader>== :resize +12<CR>
nnoremap <leader>-- :resize -12<CR>
nnoremap <leader>,, :vertical resize -15<CR>
nnoremap <leader>.. :vertical resize +15<CR>

"" Limiters auto_close
""inoremap ( ()<ESC>i
""inoremap () ()
""inoremap { {}<ESC>i
""inoremap {} {}
""inoremap [ []<ESC>i
""inoremap [] []
""inoremap < <><ESC>i
""inoremap <> <>
""inoremap ' ''<ESC>i
""inoremap '' ''
""inoremap " ""<ESC>i
""inoremap "" ""
inoremap {<CR> {<CR>}<ESC>O

"" HTML Auto-Complete
""autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"" Emmet shortcuts
let g:user_emmet_mode='n'			"only enable normal mode functions.
let g:user_emmet_leader_key=','
