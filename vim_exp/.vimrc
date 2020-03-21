""" Get startup time for Vim
" vim --startuptime /tmp/vim_debug.log
"" Alternatively
" python ~/git/vim-plugins-profile/vim-plugins-profile.py -r 2
"" vim-startuptime plugin :StartupTime
""" Load base plugin system and non plugin items
if empty(glob("~/.vim/autoload/plug.vim"))
  silent !curl -fLko ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  auto VimEnter * PlugInstall
endif

if has('nvim')
  if empty(glob("~/.config/nvim/autoload/plug.vim"))
    silent !curl -fLko ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    auto VimEnter * PlugInstall
  endif
endif

let s:undoDir = $HOME . "/.vim/undodir"
if !isdirectory(s:undoDir)
  call mkdir(s:undoDir, "", 0700)
endif
let &undodir=s:undoDir
set undofile

set nocompatible
autocmd!

call plug#begin('~/.vim/plugged')
filetype plugin indent on
" File manager stuff
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeToggle', 'NERDTreeFind' ] } " lazy load saves 9+
" Plug 'vifm/vifm.vim'
" Plug 'mcchrish/nnn.vim'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'                                           " 0.03
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'                                   " requires pynvim module
endif
Plug 'kristijanhusak/defx-icons'                                    " 0.67
Plug 'justinmk/vim-gtfo'                                            " 0.11
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   " Install fzf for user
Plug 'junegunn/fzf.vim'                                             " Fzf vim plugin
Plug 'junegunn/vim-slash'                                           " 0.18
Plug 'junegunn/vim-peekaboo'                                        " 0.16
Plug 'blueyed/vim-qf_resize'
Plug 'machakann/vim-sandwich'                                       " 0.6 + 0.3 + 0.3
Plug 'myusuf3/numbers.vim'
Plug 'dstein64/vim-startuptime'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'                                         " commenter             0.2
Plug 'axelf4/vim-strip-trailing-whitespace'                         " as its name suggests 0.27

""" history
Plug 'mbbill/undotree'
Plug 'farmergreg/vim-lastplace'                                     " remember position 0.10

""" Alignment
Plug 'Yggdroot/indentLine'                                          " show tab indent line
Plug 'junegunn/vim-easy-align'                                      " alignment 0.1

""" GIT stuff
Plug 'airblade/vim-gitgutter'                                       " git gutter (has realtime updates + nosave)
" Plug 'tpope/vim-fugitive'                                           " Git integration 2.06
" Plug 'junegunn/gv.vim'                                              " requires fugitive 0.22
Plug 'iberianpig/tig-explorer.vim'                                  " 0.09

""" Motion
Plug 'justinmk/vim-sneak'                                           " 1.5
" Plug 'rhysd/clever-f.vim'                                           " 0.2 this is good but I'm remapping f to sneak
" Plug 'mg979/vim-visual-multi'


""" Completion
" Plug 'ervandew/supertab'                                            " auto completion  1.2
Plug 'ajh17/VimCompletesMe'                                         " auto completer 0.3
" Plug 'maralla/completor.vim'                                        " completor 0.3
" Plug 'davidhalter/jedi-vim'                                         " auto completer 0.9
" Plug 'tmsvg/pear-tree'                                              " complete pairs 0.29
Plug 'KaraMCC/vim-gemini'                                           " adds closing brackets etc 0.15

""" Linting / Syntax / Language
Plug 'dense-analysis/ale'                                           " linting 1.6
Plug 'pearofducks/ansible-vim'
Plug 'hdima/python-syntax'
Plug 'rodjek/vim-puppet'                                            " puppet syntax
Plug 'mrk21/yaml-vim'                                               " For hieradata
" Plug 'sheerun/vim-polyglot'                                        " might be too heavy for me 4+
" Plug 'wellle/context.vim'                                          " excessive CPU

""" Tabs / Status line
" Plug 'mkitt/tabline.vim'                                            " Cleaner tabs
" Plug 'junegunn/rainbow_parentheses.vim'                             " 0.05
Plug 'luochen1990/rainbow'                                          " 0.05
Plug 'RRethy/vim-illuminate'                                        " highlight current word and find
Plug 'miyakogi/conoline.vim'                                        " 0.14
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'                                         " liter alternative to airline
" Plug 'itchyny/vim-gitbranch'                                         " git branch in lightline
Plug 'liuchengxu/eleline.vim'                                        " liter again than lightline 0.36

""" Appearance / themes
Plug 'junegunn/seoul256.vim'
Plug 'sickill/vim-monokai'
Plug 'nlknguyen/papercolor-theme'
Plug 'reedes/vim-colors-pencil'
Plug 'freeo/vim-kalisi'
Plug 'lifepillar/vim-solarized8'
Plug 'sickill/vim-sunburst'
Plug 'adelarsq/vim-grimmjow'
Plug 'bluz71/vim-moonfly-colors'
Plug 'rakr/vim-one'
Plug 'trevordmiller/nova-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
" Plug 'gruvbox-community/gruvbox'                                   " Maintained but 6 ms slower
" Plug 'sainnhe/gruvbox-material', { 'branch': 'master' }
Plug 'lifepillar/vim-gruvbox8'                                      " substantially faster than original gruvbox
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'arzg/vim-colors-xcode'
call plug#end()

" Basic settings
set viminfo='10,\"100,:20,%
if has('nvim')
  set viminfo+=n~/.local/share/vim/viminfo
endif
syn keyword shTodo contained TODO NOTE XXX FIXME
syn keyword pythonTodo contained TODO NOTE XXX FIXME
set backup
set backupdir=~/.vim/undodir
set directory=~/.vim/undodir
set et
set expandtab
set hidden
set history=1000                                " remember more commands and search history
set hlsearch                                    " highlight search terms
set ignorecase                                  " Case insensitive searching
set incsearch                                   " show search matches as you type
set laststatus=2
set listchars=tab:<-
set modeline
set modelines=3
set noai
set noerrorbells                                " don't beep
set pheader=%<%f%h%m\ %40{strftime(\"%c\",getftime(expand(\"%%\")))}%=Page\ %N
"set ruler
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set shiftwidth=4
set showcmd                                     " Show me the vi command in the ruler
set showmatch                                   " Show me matching close braces
set smartcase                                   " Unless I really mean case sensitive
set softtabstop=4
set tabstop=4
set title                                       " change the terminal's title
set ttyfast         " Fast, nice updating
set undolevels=1000                             " use many muchos levels of undo
set vb
set visualbell                                  " don't beep
set wildignore=*.swp,*.bak,*.pyc
set wildmenu                                    " Turn on completion for vi commands and file lists
set splitbelow
set splitright

set pastetoggle=<F2>
nnoremap <F5> :UndotreeToggle<cr>
nmap <silent> <F6> :call ToggleMouse()<CR>
nnoremap <silent> <F7> :call NumbersToggle()<bar>:call NumbersOnOff()<CR>

set background=dark
colorscheme gruvbox8                     " 6

if has("gui_running")
  set co=140
  set lines=32
  let g:seoul256_background = 233
  set background=dark
  colorscheme gruvbox
  let g:airline_theme = 'luna'

  "set guioptions-=m     " Remove file menu
  "set guioptions-=T     " Remove the toolbar and menubar
  "set guioptions-=r     " Remove right- and left-hand scrollbars
  "set guioptions-=L
  "set guioptions+=c     " Console-based dialogs for simple queries
  set guifont=Iosevka\ Regular\ 14

  " or to start blinking after some msecs.
  "       set gcr=i:ver30-blinkwait9000
  set gcr=i:ver30-blinkon0
  "       set gcr=i:blinkwait20000
  set nomousehide
  au! BufNewFile,BufRead * hi Comment gui=italic
  au! BufNewFile,BufRead notes hi Comment gui=NONE
endif

" =====================
" custom hacks
" =====================
" Open terminal window below
command Bt :belowright terminal ++rows=10<cr>
" open lazygit in terminal
command Lg :terminal ++curwin lazygit

" https://sharats.me/posts/automating-the-vim-workplace-2/#jumping-over-paragraphs
noremap <silent> <expr> <C-k> (line('.') - search('^\n.\+$', 'Wenb')) . 'kzv^'
noremap <silent> <expr> <C-j> (search('^\n.', 'Wen') - line('.')) . 'jzv^'

" https://sharats.me/posts/automating-the-vim-workplace-2/#vertical-line-selection
nnoremap <expr> vm <SID>VisualVLine()
fun! s:VisualVLine() abort
    let [_, lnum, col; _] = getcurpos()
    let line = getline('.')
    let col += strdisplaywidth(line) - strwidth(line)

    let [from, to] = [lnum, lnum]
    while strdisplaywidth(getline(from - 1)) >= col
        let from -= 1
    endwhile

    while strdisplaywidth(getline(to + 1)) >= col
        let to += 1
    endwhile

    return "\<C-v>" .
                \ (to == lnum ? '' : (to - lnum . 'jo')) .
                \ (from == lnum ? '' : (lnum - from . 'k'))
endfun

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

" =====================
" numbers
" =====================
let g:numbers_exclude = ['unite', 'tagbar', 'defx', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree']

" =====================
" IndentLine hides quotes in json
" =====================
" let g:indentLine_enabled = 1
let g:indentLine_faster = 1
"let g:indentLine_char_list = ['┆', '┊']
autocmd Filetype json let g:indentLine_enabled = 0

" Work around for defx issue
" let g:indentLine_bufTypeExclude = ['defx']         " this doesnt seem to work
" let g:indentLine_bufNameExclude = ['defxplorer']   " this doesnt seem to work
" let g:indentLine_fileTypeExclude = ['defx']        " works but is broken
" autocmd Filetype defx let g:indentLine_enabled = 0 " doesnt seem to work
" maybe wrap this ??
let g:indentLine_fileTypeExclude = ['defx']
let g:indentLine_setConceal = 0
let g:indentLine_concealcursor = ''

" =====================
" vifm
" =====================
"noremap <silent> <F3> :Vifm<CR>
let g:vifm_embed_term = 0
let g:vifm_embed_split = 1

" =====================
" nnn
" =====================
" Opens the nnn window in a split
let g:nnn#layout = 'new' " or vnew, tabnew etc.

" Or pass a dictionary with window size
let g:nnn#layout = { 'left': '~20%' } " or right, up, down

" =====================
" NERDTree stuff
" =====================
let g:NERDTreeMapActivateNode = '<tab>'
let g:NERDTreeWinSize=35
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.pyc$', '\.swp$', '\.git$', '\.ecryptfs$', '\.Private$', '\.retry$']
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! NERDTreeRefresh()
  if &filetype == "nerdtree"
    silent exe substitute(mapcheck("R"), "<CR>", "", "")
  endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" =====================
" hack for NERDTree / Defx
" =====================
" FIXME this is sooo heavy adds buckets of time to startup
""if has('python3')
"  let pyver=system("python3 --version | cut -d' ' -f2")
"  if pyver == "3.6.9\n"
"    noremap <silent> <F3> :Defx -toggle<CR>
"    nnoremap <silent> <F4> :<C-u>Defx -resume -search=`expand('%:p')` `getcwd()`<CR>
"  elseif pyver == "3.8.1\n"
""    noremap <silent> <F3> :Defx -toggle<CR>
""    nnoremap <silent> <F4> :<C-u>Defx -resume -search=`expand('%:p')` `getcwd()`<CR>
""#  else
noremap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> <F4> :NERDTreeFind<CR>
"  endif
"endif

" =====================
" defx
" =====================
" Set appearance like NERDTree
call defx#custom#option('_', {
  \ 'winwidth': 35,
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 0,
  \ 'buffer_name': 'defxplorer',
  \ 'columns': 'icon:indent:icons:filename',
  \ 'resume': 1,
  \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
  nnoremap <silent><buffer><expr> yy defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> l defx#do_action('open')
  nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> dd defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  " nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

" defx icons
call defx#custom#column('icon', {
  \ 'directory_icon': '▸',
  \ 'opened_icon': '▾',
  \ })

let g:defx_icons_enable_syntax_highlight = 0

augroup defx-extensions
  autocmd!
  " Close defx if it's the only buffer left in the window
  autocmd WinEnter * if &ft == 'defx' && winnr('$') == 1 | q | endif
  autocmd FileType defx do WinEnter | call s:defx_my_settings()
augroup END

" =====================
" lens
" =====================
let g:lens#disabled = 0
let g:lens#animate = 0
let g:lens#disabled_filetypes = ['defx', 'fzf', 'nerdtree']
let g:lens#disabled_buftypes = ['defxplorer', 'defx']

" " Resize Max Height
" " When resizing don't go beyond the following height
" let g:lens#height_resize_max = 20

" " Resize Min Height
" " When resizing don't go below the following height
" let g:lens#height_resize_min = 5

" " Resize Max Width
" " When resizing don't go beyond the following width
" let g:lens#width_resize_max = 80

" " Resize Min Width
" " When resizing don't go below the following width
" let g:lens#width_resize_min = 20

" =====================
" Animate.vim
" =====================
let g:animate#duration = 300.0
let g:animate#easing_func = 'animate#ease_linear'
" nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
" nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
" nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
" nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>

" =====================
" WhichKey
" =====================
" let g:mapleader = "\<Space>"
" let g:maplocalleader = ','
" set timeoutlen=500
" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" let g:which_key_map = {}
" let g:which_key_map['w'] = {
"       \ 'name' : '+windows' ,
"       \ 'w' : ['<C-W>w'     , 'other-window']          ,
"       \ 'd' : ['<C-W>c'     , 'delete-window']         ,
"       \ '-' : ['<C-W>s'     , 'split-window-below']    ,
"       \ '|' : ['<C-W>v'     , 'split-window-right']    ,
"       \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
"       \ 'h' : ['<C-W>h'     , 'window-left']           ,
"       \ 'j' : ['<C-W>j'     , 'window-below']          ,
"       \ 'l' : ['<C-W>l'     , 'window-right']          ,
"       \ 'k' : ['<C-W>k'     , 'window-up']             ,
"       \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
"       \ 'J' : ['resize +5'  , 'expand-window-below']   ,
"       \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
"       \ 'K' : ['resize -5'  , 'expand-window-up']      ,
"       \ '=' : ['<C-W>='     , 'balance-window']        ,
"       \ 's' : ['<C-W>s'     , 'split-window-below']    ,
"       \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
"       \ '?' : ['Windows'    , 'fzf-window']            ,
"       \ }

" =====================
" netrw configuration
" =====================
" disable netrw completely for vifm etc
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" =====================
" vim-easy-align
" =====================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" =====================
" tig-explorer
" =====================
" open tig with current file
nnoremap <Leader>T :TigOpenCurrentFile<CR>

" open tig with Project root path
nnoremap <Leader>t :TigOpenProjectRootDir<CR>

" open tig grep
nnoremap <Leader>g :TigGrep<CR>

" resume from last grep
nnoremap <Leader>r :TigGrepResume<CR>

" open tig grep with the selected word
vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>

" open tig grep with the word under the cursor
nnoremap <Leader>cg :<C-u>:TigGrep<Space><C-R><C-W><CR>

" open tig blame with current file
nnoremap <Leader>b :TigBlame<CR>

" =====================
" undotree
" =====================
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 4
endif
" relative timestamp
if !exists('g:undotree_RelativeTimestamp')
    let g:undotree_RelativeTimestamp = 1
endif

" =====================
" gitgutter stuff
" =====================
set updatetime=200          " update the gutter near realtime
" let g:gitgutter_grep = 'ag'

" =====================
" qf_resize
" =====================
let g:qf_resize_max_height = 8

" =====================
" agriculture
" =====================
let g:agriculture#rg_options = '--smart-case'

" =====================
" fzf config
" =====================
nmap <C-p> :Files<cr>|          " fuzzy find files in the working directory
nmap <C-b> :Buffers<cr>|        " fuzzy find an open buffer
nmap <C-_> :BLines<cr>|         " fuzzy find lines in the current file
nmap <C-l> :Lines<cr>|          " fuzzy find lines in open buffers
nmap <C-n> :FZFNeigh<cr>|       " fuzzy find files in parent dir of current file

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Use BAT for previews
let g:fzf_files_options = '--preview "bat --theme=\"OneHalfDark\" --style=numbers,changes --color always {} | head -50"'

"let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '20split enew' }

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

" Prettier silver searcher output
command! -nargs=* Ag call fzf#run({
  \ 'source':  printf('ag -U --nogroup --column --color "%s"',
  \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
  \ 'sink*':    function('<sid>ag_handler'),
  \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
  \            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
  \            '--color hl:68,hl+:110',
  \ 'down':    '50%'
  \ })

" RipGrep
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" fzf find files in parent of current file
function! s:fzf_neighbouring_files()
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'ag -g "" -f ' . cwd . ' --depth 0'

  call fzf#run({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s --preview "bat --theme=\"OneHalfDark\" --style=numbers,changes --color always {} | head -50" ',
        \ 'window':  'enew' })
endfunction

command! FZFNeigh call s:fzf_neighbouring_files()

" function! s:line_handler(l)
"   let keys = split(a:l, ':\t')
"   exec 'buf' keys[0]
"   exec keys[1]
"   normal! ^zz
" endfunction
"
" function! s:buffer_lines()
"   let res = []
"   for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
"     call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
"   endfor
"   return res
" endfunction
"
" command! FZFLines call fzf#run({
" \   'source':  <sid>buffer_lines(),
" \   'sink':    function('<sid>line_handler'),
" \   'options': '--extended --nth=3..',
" \   'down':    '40%'
" \})
"

" fzf in popup/floating window for vim/nvim
if (version >= 802 && has('patch191')) || has('nvim')
    fu s:snr() abort
        return matchstr(expand('<sfile>'), '.*\zs<SNR>\d\+_')
    endfu
    let s:snr = get(s:, 'snr', s:snr())
    let g:fzf_layout = {'window': 'call '..s:snr..'fzf_window(0.9, 0.6, "Comment")'}

    fu s:fzf_window(width, height, border_highlight) abort
        let width = float2nr(&columns * a:width)
        let height = float2nr(&lines * a:height)
        let row = float2nr((&lines - height) / 2)
        let col = float2nr((&columns - width) / 2)
        let top = '┌' . repeat('─', width - 2) . '┐'
        let mid = '│' . repeat(' ', width - 2) . '│'
        let bot = '└' . repeat('─', width - 2) . '┘'
        let border = [top] + repeat([mid], height - 2) + [bot]
        if has('nvim')
            let frame = s:create_float(a:border_highlight, {
                \ 'row': row,
                \ 'col': col,
                \ 'width': width,
                \ 'height': height,
                \ })
            call nvim_buf_set_lines(frame, 0, -1, v:true, border)
            call s:create_float('Normal', {
                \ 'row': row + 1,
                \ 'col': col + 2,
                \ 'width': width - 4,
                \ 'height': height - 2,
                \ })
            exe 'au BufWipeout <buffer> bw '..frame
        else
            let frame = s:create_popup_window(a:border_highlight, {
                \ 'line': row,
                \ 'col': col,
                \ 'width': width,
                \ 'height': height,
                \ 'is_frame': 1,
                \ })
            call setbufline(frame, 1, border)
            call s:create_popup_window('Normal', {
                \ 'line': row + 1,
                \ 'col': col + 2,
                \ 'width': width - 4,
                \ 'height': height - 2,
                \ })
        endif
    endfu

    fu s:create_float(hl, opts) abort
        let buf = nvim_create_buf(v:false, v:true)
        let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
        let win = nvim_open_win(buf, v:true, opts)
        call setwinvar(win, '&winhighlight', 'NormalFloat:'..a:hl)
        return buf
    endfu

    fu s:create_popup_window(hl, opts) abort
        if has_key(a:opts, 'is_frame')
            let id = popup_create('', #{
                \ line: a:opts.line,
                \ col: a:opts.col,
                \ minwidth: a:opts.width,
                \ minheight: a:opts.height,
                \ zindex: 50,
                \ })
            call setwinvar(id, '&wincolor', a:hl)
            exe 'au BufWipeout * ++once call popup_close('..id..')'
            return winbufnr(id)
        else
            let buf = term_start(&shell, #{hidden: 1})
            call popup_create(buf, #{
                \ line: a:opts.line,
                \ col: a:opts.col,
                \ minwidth: a:opts.width,
                \ minheight: a:opts.height,
                \ zindex: 51,
                \ })
            exe 'au BufWipeout * ++once bw! '..buf
        endif
    endfu
endif

" =====================
" gtfo
" =====================
" let g:gtfo#terminals = { 'unix': '' }

" =====================
" LeaderF
" =====================
let g:Lf_WindowPosition = 'popup'

" =====================
" clever-f
" =====================
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms        = 3000

" =====================
" vim-sneak
" =====================
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" =====================
" vim-sandwich
" =====================
" to use vim-surround keymap
" runtime macros/sandwich/keymap/surround.vim

" =====================
" rainbow brackets
" =====================
let g:rainbow_active = 1
" let g:rainbow#max_level = 16
" let g:rainbow#pairs = [['(', ')'], ['[', ']']]

" List of colors that you do not want. ANSI code or #RRGGBB
" let g:rainbow#blacklist = [233, 234]

" Highlight jump points
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" snippet trigger key
let g:UltiSnipsExpandTrigger="<C-R><tab>"

" vimtex
let g:vimtex_view_general_viewer = 'zathura'

" instant markdown
let g:instant_markdown_slow = 1

syntax enable

let g:seoul256_background = 233

" =====================
" Conoline use the colorscheme defaults for all
" =====================
let g:conoline_use_colorscheme_default_insert=1
let g:conoline_use_colorscheme_default_normal=1

" =====================
" eleline
" =====================
let g:eleline_powerline_fonts = 1

" =====================
" paired with trailing-whitespace
" =====================
" highlight trailing whitespace
match Todo /\s\+$/

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us
set complete+=kspell

""" https://coreyja.com/vim-spelling-suggestions-fzf/
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

" =====================
" ALE syntax checker
" =====================
let g:ale_linters = {
  \  'python':     ['flake8'],
  \  'yaml':       ['yamllint']
  \}

" \  'css':        ['csslint'],
" \  'javascript': ['standard'],
" \  'json':       ['jsonlint'],
" \  'ruby':       ['standardrb'],
" \  'scss':       ['sasslint'],
" \}
"
let g:ale_fixers = {
  \ 'python':      ['black', 'isort']
  \}
" \  'javascript': ['prettier-standard'],
" \  'json':       ['prettier'],
" \  'ruby':       ['standardrb'],
" \  'scss':       ['prettier'],
" \  'yml':        ['prettier']
" \}
" let g:ale_linters_explicit = 1
" let g:ale_open_list = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_python_flake8_options = '--ignore="E501"'
let g:ale_yaml_yamllint_options = '-d "{extends: relaxed, rules: {line-length: disable}}"'
" nmap <Leader>l    <Plug>(ale_lint)
" nmap <Leader>f    <Plug>(ale_fix)
" nmap <Leader><BS> <Plug>(ale_reset_buffer)
"let g:ale_linters = {'java': [], 'yaml': [], 'scala': [], 'clojure': []}
"let g:ale_fixers = {'ruby': ['rubocop']}
"let g:ale_lint_delay = 1000

autocmd BufNewFile *.sh 0r!code_head %
autocmd BufNewFile *.py 0r!code_head %
autocmd BufNewFile *.pl 0r!code_head %

" =====================
" Tabular options
" =====================
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" =====================
" vim-slash
" =====================
if has('timers')
  " Blink 3 times with 50ms interval
  noremap <expr> <plug>(slash-after) 'zz'.slash#blink(3, 50)
endif

augroup ansible_vim_ft
  au!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
  autocmd BufNewFile,BufRead *.yml set filetype=ansible.yaml
  autocmd BufNewFile,BufRead *.yml set syntax=yaml
augroup END

augroup GPGASCII
  au!
  au BufReadPost *.asc  :%!gpg -q -d
  au BufReadPost *.asc  |redraw
  au BufWritePre *.asc  :%!gpg -q -e -a
  au BufWritePost *.asc u
  au VimLeave *.asc :!clear
augroup END

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff <wouter@blub.net>
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
  " We don't want a swap file, as it writes unencrypted data to disk
  autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre      *.gpg set bin
  autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
  autocmd BufReadPre,FileReadPre      *.gpg let shsave=&sh
  autocmd BufReadPre,FileReadPre      *.gpg let &sh='sh'
  autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost    *.gpg '[,']!gpg --decrypt --default-recipient-self 2> /dev/null
  autocmd BufReadPost,FileReadPost    *.gpg let &sh=shsave
  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost    *.gpg set nobin
  autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
  " Convert all text to encrypted text before writing
  autocmd BufWritePre,FileWritePre    *.gpg set bin
  autocmd BufWritePre,FileWritePre    *.gpg let shsave=&sh
  autocmd BufWritePre,FileWritePre    *.gpg let &sh='sh'
  autocmd BufWritePre,FileWritePre    *.gpg '[,']!gpg --encrypt --default-recipient-self 2>/dev/null
  autocmd BufWritePre,FileWritePre    *.gpg let &sh=shsave
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost  *.gpg silent u
  autocmd BufWritePost,FileWritePost  *.gpg set nobin
augroup END
