function! wordcount#CountWordsLatex() abort
    let output = system('latexcount ' . expand('%'))
    echo output
    return output
endfunction
