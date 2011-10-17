set backspace=indent,eol,start
set nohlsearch
set noshowmatch
set ruler
set scrolloff=999
set winheight=999
set wmh=0
set listchars=eol:$,tab:;.,trail:!

map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

nnoremap i :noh<CR>i
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

syntax on
set t_Co=256
colo inkpot
