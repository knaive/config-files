"*************************some basic mappings begin here**********************
if has('unix')
    let VIM_PATH='~/.vim/'
else
    let VIM_PATH='~/vimfiles/'
endif
let VIMRC='~/.vimrc'
let BAK_DIR = VIM_PATH . 'backup'

"common command remappings
"default leader key is \, remap that
" let mapleader="\<space>"
let mapleader=","
set timeoutlen=500 ttimeoutlen=10
exe 'nnoremap <leader>ev :e ' . VIMRC . '<CR>'
exe 'nnoremap <leader>sv :so ' . VIMRC . '<CR>'
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
inoremap jj <ESC>
"inoremap <C-e> <ESC>$a
"nnoremap <C-e> $
inoremap <C-a> <ESC>^i
nnoremap <C-a> ^
nnoremap <C-x> :bdelete<CR>
nnoremap <F6> :cn<CR>
nnoremap <C-t> :tabnew
nnoremap ; :
""<C-wq> quit the window
"autocmd FileType c,cpp,h,java inoremap ; ;<cr>

nnoremap <Leader>hh <C-W>h
nnoremap <Leader>jj <C-W>j
nnoremap <Leader>kk <C-W>k
nnoremap <Leader>ll <C-W>l

""*************************basic mappings end here****************************


"*************************basic settings begin here***************************
"$注意第一个命令里的分号是必不可少的。这个命令让vim首先在当前目录里寻找tags文件，
"如果没有找到tags文件，或者没有找到对应的目标，就到父目录中查找，一直向上递归。
"因为tags文件中记录的路径总是相对于tags文件所在的路径，所以要使用第二个设置项
"来改变vim的当前目录  
set tags=tags; 
set autochdir 

"show TAB as >--
"show spaces at the end of a line as -
set list
set listchars=tab:>-,trail:$

" 设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set showmatch                           " 高亮显示匹配的括号
set matchtime=5                         " 匹配括号高亮的时间（单位是十分之一秒）
set ignorecase                          " 在搜索的时候忽略大小写
set hlsearch                            " 高亮被搜索的句子（phrases）
set incsearch                           " 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set scrolloff=3                         " 光标移动到buffer的顶部和底部时保持3行距离
set novisualbell                        " 不要闪烁
set laststatus=2                        " 总是显示状态行
set number                              " 显示行号
set formatoptions=tcrqn                 " 自动格式化
set autoindent                          " 继承前一行的缩进方式，特别适用于多行注释
set smartindent                         " 为C程序提供自动缩进
"set wrap                               " 不要换行
"set shortmess=atI                       " 启动的时候不显示那个援助索马里儿童的提示
set showcmd                             " 在Vim窗口的右下角显示一个完整的命令已经完成的部分
set history=100                         " history文件中需要记录的行数
set confirm                             " 在处理未保存或只读文件的时候，弹出确认
"set clipboard+=unnamed                 " 与windows共享剪贴板
set viminfo+=!                          " 保存全局变量
set iskeyword+=_,$,@,%,#,-              " 带有如下符号的单词不要被换行分割
"set backup                              " 设置备份文件和swap文件
set nobackup                           " no backup files
set nowritebackup
exe 'set backupdir+=' . BAK_DIR
setlocal noswapfile                     " no swap file
set linespace=0                         " 字符间插入的像素行数目
set wildmenu                            " 增强模式中的命令行自动完成操作
set cmdheight=1                         " 命令行（在状态行下）的高度，默认为1，这里是2
set backspace=2                         " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l                  " 允许backspace和光标键跨越行边界
set report=0                            " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\    " 在被分割的窗口间显示空白，便于阅读

"syntax highlight
syntax enable
syntax on

" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" enable use of mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" use four spaces to replace a tab
set tabstop=4 shiftwidth=4 expandtab

set foldenable
" the foldmethod setting for python
" set foldmethod=manual
set foldmethod=indent
" the methods of classes is folded but internal statements not
set foldnestmax=2
" use space toggle fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" save info of fold
au BufWinLeave *.java,*.c,*.cpp,*.tex,*.py,*.vimrc silent mkview
au BufWinEnter *.java,*.c,*.cpp,*.tex,*.py,*.vimrc silent loadview

"*************************basic settings end here***************************


"****************settings for plugins begins here*********************************

"**************************vundle setting begins here**************************
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" use keboard mode of VIM instead of VI's
set nocompatible
filetype off
let VIM_VUNDLE= VIM_PATH . 'bundle/Vundle.vim'
exe 'set rtp+=' . VIM_VUNDLE
call vundle#begin(VIM_PATH . 'bundle')

" original repos on github
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'cocopon/iceberg.vim'
Plugin 'godlygeek/csapprox' "color scheme for vim in terminal

call vundle#end()

" 开启Vim的三种智能：自动识别文件类型,使用文件类型plugin脚本,为特定文件类型载入相关缩进文件
filetype plugin indent on
"***************************vundle setting ends here****************


"*****************auto complete plugins settings begins here*********
let g:AutoPairsFlyMode = 1

" supertab settings
let g:SuperTabDefaultCompletionType = "context" "自动检测需要补全什么内容

" ctrlp mappings
" <F5>             : update the cache for the current directory
" <c-f> and <c-b>  : cycle between modes
" <c-d>            : only search filename ,not full path
" <c-r>            : switch to regexp mode
" <c-j>            : next result
" <c-k>            : last result
" <c-t>            : open the selected entry in a new tab
" <c-v>            : open the selected entry in a vertical split
" <c-x>            : open selected entry in a horizontal split
" <c-n> and  <c-p> : select the next/previous string in the prompt's history
" <c-y>            : to create a new file and its parent directories
" <c-z> mark/unmark multiple files and <c-o> to open them
" Ctrlp settings
let g:ctrlp_show_hidden = 1
"let g:ctrlp_map = '<Leader>t'
nnoremap <Leader>ff :CtrlPBuffer<CR>
nnoremap <Leader>mm :CtrlPMRU<CR>

" nerdcommenter
let g:NERDSpaceDelims=1

"***************auto complete plugins setting ends here**************

" NERDTree settings
nnoremap <silent> <Leader>tt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" airline settings
let g:airline_theme = 'bubblegum'

" CSApprox settings
" bring gvim colorscheme to terminal
set t_Co=256
let g:CSApprox_attr_map = {'bold':'bold','italic':'','sp':''}
set background=dark
colorscheme iceberg
" colorscheme github

""settings for emmet
let g:user_emmet_leader_key = '<C-e>'
