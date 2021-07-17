---
title: format-utils
author: drfailer
tag: [haskell, markdown utils]
---


vimrc setup
-----------

```vim
function! Format()
  call system('~/.scripts/utils/format-util/format-util "$(xclip -o -selection clipboard)" | xclip -selection clipboard')
  sleep 100m
  execute "norm p"
endfunction

map <silent> <leader>= d:call Format()<cr>
```
