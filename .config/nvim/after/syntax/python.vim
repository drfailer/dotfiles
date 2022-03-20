" syntax concealing for python based on: https://github.com/khzaw/vim-conceal
if exists('g:no_vim_conceal') || !has('conceal') || &enc != 'utf-8'
  finish
endif

" comparators
syntax match pyOperator "<=" conceal cchar=≤
syntax match pyOperator ">=" conceal cchar=≥
syntax match pyOperator "!=" conceal cchar=≢

" pi
syntax match pyKeyword "\<\%(math\.\)\?pi\>" conceal cchar=π

" lambda
syntax keyword pyStatement lambda conceal cchar=λ

hi link pyOperator Operator
hi link pyStatement Statement
hi link pyKeyword Keyword
hi! link Conceal Operator

setlocal conceallevel=1
