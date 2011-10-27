set guioptions=cg
set guifont=Consolas:h9
cd ~/Projects/reddwarf
colo vividchalk
NERDTree

function! Gigantic ()
    set guifont=Consolas:h24
endfunction

function! Larger ()
    set guifont=Consolas:h18
endfunction

function! Regular ()
    set guifont=Consolas:h9
endfunction

nmap <Leader>+ :call Gigantic()<CR>
nmap <Leader>= :call Larger()<CR>
nmap <Leader>- :call Regular()<CR>
