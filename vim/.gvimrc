"add or delete scrollbar(r),toolbar(T) or menu(m)
set guioptions=aegirtLm
"windows style: menus pop up when choosed and right key single pressed
behave mswin 

"window size and position setting
winpos 50 50

"color theme setting
"set background=dark
"colorscheme solarized

"colorscheme ir_black
"colorscheme spring
"colorscheme dejavu
"colorscheme dawn


"font setting
if has("win32")
    set helplang=cn " help language = cn!
    source $VIMRUNTIME/delmenu.vim
    set langmenu=en_US
    source $VIMRUNTIME/menu.vim
    language messages en_US
endif
if has("multi_byte")
        set encoding=utf-8
        set termencoding=utf-8
        set fileencoding=utf-8
endif

if has('unix')
    "set guifont=Monaco\ 14
    "set guifont=Inconsolata\ 21
    set guifont=Liberation\ Mono\ 16 
    "set guifont=Courier\ 10\ Pitch\ 18 
    "set guifont=Monospace\ 19
    "set guifont=Microsoft\ Yahei\ 15
    "set gfw=Microsoft\ Yahei\ 15
else
    set guifont=Consolas:h17
    "set guifont=Courier_New:h17
endif
