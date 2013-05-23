" Font
if has("gui_macvim")
  "set guifont=Mensch\ Regular:h12
  set guifont=Source\ Code\ Pro:h12
elseif has("gui_gtk2")
  set guifont=Mensch\ 10
endif
" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c
" Local config
if filereadable(".gvimrc.local")
  source .gvimrc.local
endif
