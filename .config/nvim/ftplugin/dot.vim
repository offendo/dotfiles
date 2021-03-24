
command! -nargs=0 MakeAsync
         \ call jobstart("make", {
         \    'on_exit': { j,d,e ->
         \       execute('echom "make finished with exit status '.d.'"', '')
         \    }
         \ })
au BufWrite *.dot MakeAsync
