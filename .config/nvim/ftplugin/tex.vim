function! s:TexView()
    let s:dir = expand('%:p:h') . '/build/'
    let s:file = expand('%:t:r') . '.pdf'
    let s:pdf = s:dir . s:file
    echom "!evince " . s:pdf . "&"
    silent execute "!evince " . s:pdf . "&"
endfunction
set conceallevel=0
command! -nargs=0 View call s:TexView()
