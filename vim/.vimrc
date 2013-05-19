" Setup my favourite colour scheme
" With 256 colour compatibility for some platforms
set t_Co=256
color zenburn

" Allow hidden buffers (everyone says to do this)
set hidden

" Set up tabs
set expandtab
set tabstop=4
set shiftwidth=4

" C style indenting
set cindent
" Turn on syntax highlighting
syntax on

" Map paste toggle to F2
set pastetoggle=<F2>

" Show line numbers
set nu
" Show the current command in the status bar
set showcmd
" If possible, set the terminal window title to the vim file title
set title

" Turn on incremental searching and search highligts
set incsearch
set hlsearch

" Make / style searched case sensitive, only if there is a capital letter
" in the search term
set ignorecase
set smartcase

" Turn on completion for vi commands and file lists
set wildmenu

" Get pathogen to load all plugins
execute pathogen#infect()
execute pathogen#helptags()

