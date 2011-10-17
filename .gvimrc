set guioptions=cg
set guifont=Consolas:h11
cd ~/Projects/reddwarf
colo vividchalk
NERDTree

function Gigantic ()
    set guifont=Consolas:h24
endfunction

function Regular ()
    set guifont=Consolas:h11
endfunction

function Flyspeck ()
    set guifont=Consolas:h9
endfunction

nmap <Leader>+ :call Gigantic()<CR>
nmap <Leader>- :call Flyspeck()<CR>
nmap <Leader>= :call Regular()<CR>