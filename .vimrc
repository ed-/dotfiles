" :help oneoftheseoptions for more info.
set backspace=indent,eol,start
set expandtab
set hlsearch
set ignorecase
set listchars=eol:$,tab:;.,trail:!,precedes:~,extends:~,nbsp:_
set noshowmatch
set ruler
set scrolloff=999
set shiftwidth=4
set softtabstop=4
set splitright
set tabstop=4
set wildmenu
set wildmode=longest:full
set winheight=999
set winminheight=0

" I don't like seeing .filename.swp files everywhere.
set backupdir=~/.vim/backup
set directory=~/.vim/swap

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

" make j and k move up and down one visual line, not one text line
map j gj
map k gk

" kill highlights when I jump to insert mode. press n to see them again.
nnoremap i :noh<CR>i

" Custom file search function wildfind
nnoremap <Leader>w :setlocal buftype=nofile<CR>:%!wildfind<Space>

" \d will find the <<< === >>> boundaries in a conflict.
nnoremap <Leader>d /^<<<\\|^===\\|^>>><CR>

" \f will open the file under the cursor in a right-split.
nnoremap <Leader>f :vertical wincmd f<CR>

" F5 will just run the current script, assuming it's executable.
nnoremap <F5> :!clear; ./%<CR>

syntax on
set t_Co=256
colo inkpot

" There's probably a better way to do this.
" Open a buffer with :sp git-diff, and MAGIC will happen!
function! UpdateGitDiff()
	setlocal buftype=nofile
	setlocal noswapfile
	silent :%!git diff
    set ft=diff
endfunction

au BufEnter git-diff :call UpdateGitDiff()

nnoremap <Leader>g :leftabove vsp git-diff<CR>

" now! is replaced with the current date, a newline, and a tab.
iab <expr> now! strftime("%A, %d %B %Y %I:%M%p\n\t")
