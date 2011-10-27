set backspace=indent,eol,start
set expandtab
set hlsearch
set ignorecase
set listchars=eol:$,tab:;.,trail:!
set noshowmatch
set ruler
set scrolloff=999
set shiftwidth=4
set softtabstop=4
set tabstop=4
set wildmenu
set wildmode=full
set winheight=999
set wmh=0

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
nnoremap <Leader>n :NERDTreeToggle<CR>

syntax on
set t_Co=256
colo inkpot

function! UpdateGitDiff()
	silent :%!git diff
endfunction

function! GitDiff()
	vnew
	setlocal buftype=nofile
	setlocal noswapfile
	file git-diff
	set filetype=diff
    call UpdateGitDiff()
endfunction

au BufEnter git-diff :call UpdateGitDiff()
nnoremap <Leader>g :call GitDiff()<CR>

au BufRead nova.log set ft=novalog
au BufRead nova.log set autoread
