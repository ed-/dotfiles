" Other tricks
set nocompatible
set path+=**

" Storage Settings
set viminfo='0,:0,<0,@0,f0,/0,%0

" Display
set ruler " show the status bar at the bottom
set scrolloff=999 " work to make the cursor at least 999 lines from the top and bottom of the screen unless we're at the top or bottom
set backspace=indent,eol,start " change backspace so it will cross over autoindents, linebreaks, and the beginning of an edit.
set listchars=eol:$,tab:;.,trail:!,precedes:~,extends:~,nbsp:_ " representation of a few invisible characters with :set list
set nowrap
set modeline " honor modelines.
set nonumber

" Syntax Highlighting
syntax on " please use syntax highlighting
set t_Co=256 " I use a terminal with a 256-color palette.
"colo vividchalk " https://github.com/tpope/vim-vividchalk
colo inkpot

" Tab
set expandtab " automatically turn tabs into spaces
set shiftwidth=4 " autoindent tabs are 4 spaces wide
set softtabstop=4 " manually inserted tabs are 4 spaces wide
set tabstop=4 " tabs already in the document are 4 spaces
set autoindent " please autoindent

" Search
set hlsearch " highlight all instances of /-searched phrases
set ignorecase " /-searching ignores cases
set noshowmatch " do not jump to a matching () [] {} et cetera, even for a moment.

" kill highlights when I jump to insert mode. press n to see them again.
nnoremap i :noh<CR>i

" Autocomplete
set wildmenu " show me all the matches in a popup menu when using autocomplete
set wildmode=longest:full " show me the longest match first, and show me the wildmenu

" Windows
set splitright " when I split my windows, put the new one right of the current one
set winheight=999 " expand a window as wide as possible
set winminheight=0 " compact other windows to just their title bar

" File Explorer - I use NetRW.
let g:netrw_altv=1 " specific to NetRW, split new windows to the right
let g:netrw_browse_split=4 " Open file in the last buffer opened.
let g:netrw_liststyle=3 " Use tree-mode by default.
let g:netrw_preview=1 " Show preview in a vertical split.
let g:netrw_winsize=20 "Use 20% of the window for the browser, 80% for previews.

" Annoyances
set paste " Do the paste right.
nnoremap <F1> <Esc>

" I don't like seeing .filename.swp files everywhere.
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo

" Ctrl + hjkl moves to the window in that direction.
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_

" So does just pressing an arrow key.
map <Up> <C-W>k<C-W>_
map <Down> <C-W>j<C-W>_
map <Left> <C-W>h<C-W>_
map <Right> <C-W>l<C-W>_

" But not in insert mode.
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

" Shift left and right will push a window to that side.
" Good for maintaining two-column views.
map <S-Left> <C-W>H<C-W>_
map <S-Right> <C-W>L<C-W>_

" Shift pagedown and pageup will do :cn and :cN
map <C-PageDown> :cn<CR>
map <C-PageUp> :cN<CR>

" Make j and k move up and down rows, not lines.
map j gj
map k gk

" \d will find the <<< === >>> boundaries in a conflict.
nnoremap <Leader>D /^<<<<<<<\\|^=======\\|^>>>>>>><CR>

" F5 will just run the current script, assuming it's executable.
nnoremap <F5> :!clear; ./%<CR>

" There's probably a better way to do this.
" Open a buffer called git-diff, and MAGIC will happen!
function! UpdateGitDiff()
	setlocal buftype=nofile
	setlocal noswapfile
    silent :%!git diff --patience --ignore-space-change
    set ft=diff
endfunction

function! UpdateGitDiff1()
	setlocal buftype=nofile
	setlocal noswapfile
    silent :%!git diff --patience --ignore-space-change HEAD~1
    set ft=diff
endfunction

function! UpdateGitDiffHead()
	setlocal buftype=nofile
	setlocal noswapfile
    silent :%!git diff --patience --ignore-space-change HEAD
    set ft=diff
endfunction

function! UpdateGitDiffDevelop()
	setlocal buftype=nofile
	setlocal noswapfile
    silent :%!git diff --patience --ignore-space-change develop
    set ft=diff
endfunction

function! UpdateGitDiffMaster()
	setlocal buftype=nofile
	setlocal noswapfile
    silent :%!git diff --patience --ignore-space-change master
    set ft=diff
endfunction

function! TreeHere()
	setlocal buftype=nofile
	setlocal noswapfile
	"silent :%!tree -J -f --charset ascii | jq '.'
	silent :%!tree -f --charset ascii
    "set ft=json
    set foldmethod=indent
endfunction

" Autoupdate the buffer git-diff with the diff.
au BufEnter git-diff :call UpdateGitDiff()
au BufEnter git-diff-1 :call UpdateGitDiff1()
au BufEnter git-diff-head :call UpdateGitDiffHead()
au BufEnter git-diff-develop :call UpdateGitDiffDevelop()
au BufEnter git-diff-master :call UpdateGitDiffMaster()

" Autoupdate the buffer tree with the diff.
au BufNewFile tree :call TreeHere()

au BufRead Vagrantfile set ft=ruby
au BufRead Jenkinsfile set ft=groovy
au BufRead *.html.template set ft=html
au BufRead *.p8 set ft=lua
au BufRead *.vue set ft=javascript
au BufRead startup.log set ft=messages
au BufRead *.sls set ft=yaml
au BufRead reactor.conf set ft=yaml

ab abcz abcdefghijklmnopqrstuvwxyz

set grepprg=ag\ --vimgrep\ $*\ .
set ambiwidth=double
set ruler " show the status bar at the bottom
