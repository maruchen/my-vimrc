set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 编解码过程说明：打开文件时会用fileencodings尝试解码，然后转换为vim内部的编码格式（encoding）。vim将fileencoding设置为侦测的解码结果，写文件时再将内部编码（encoding）转为fileencoding。

" encoding是vim在内部使用的编码方式
" utf8能表示几乎所有字符，并且vim自动探测文件的编码方式会更准确
" 由于 encoding 选项涉及到 Vim 中所有字符的内部表示，因此只能在 Vim 启动的时候设置一次。在 Vim 工作过程中修改encoding 会造成非常多的问题。
set encoding=utf-8

" 编码的自动识别是通过设置 fileencodings 实现的
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" termencoding 是在屏幕显示的时候把内部编码转换为屏幕编码，再用于输出。
" gvim不依赖于term，所以termencoding对gvim没有意义
let &termencoding = &encoding

" 用vim新建文件时，采用该编码；打开已有文件时，fileencoding会被设置成探测到的编码
set fileencoding=utf-8

let g:fencview_autodetect=1

set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置图形界面。
"
" 字体部分，可参考
" http://www.2maomao.com/blog/best-programmer-fonts/

if has("gui_running")
    if has("win32")
        " 设定 windows 下 gvim 启动时最大化
        autocmd GUIEnter * simalt ~x
        " 设定 windows 下图形界面下的字体。该字体需要自己下载安装，下载地址：
        " http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.zip
        set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI
    else
        " 设定 linux 下图形界面下的字体，该字体 Fedora 7 自带
       " set guifont=DejaVu\ LGC\ Sans\ Mono\ 14
        set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI
    endif
endif


colorscheme desert

"No toolbar
set go-=T
"set go-=e
"No menu
set go-=m
"Show line number
set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"No backup file
"set nobackup

"backup in the directory
"set backupdir=$VIM/backupDir

"用专门的文件夹存放swp临时交换文件
":set dir=$VIM/swp

"save original file
"set patchmode=.orig

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set cursorline
set incsearch
set ignorecase
set smartcase

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
   syntax on
   set hlsearch
endif

"status line
set laststatus=2
set statusline=%<%f\ %h%r%m%y%=%-14.(%l/%L,%c%)\ %{&fileencoding}\ %P
set showcmd 

"tab length
set tabstop=4
"for python
set expandtab

"shift width
set shiftwidth=4

"断行
"中文乱断行
"set linebreak


"自动打开文件时指定执行命令
:if !exists("autocommands_loaded")
:  let autocommands_loaded = 1

"程序文件
":  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :Tlist
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set fdm=syntax
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set foldlevel=100
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set sidescroll=5
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set listchars+=precedes:<,extends:>
":  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h  :set fdm=indent
:endif


"启用加密
set cm=blowfish

"设置当前打开的文件目录为当前目录
autocmd BufEnter * cd %:p:h

"d,c,y后用寄存器内容替换当前光标所在单词
"快捷键S
"You can use the last yanked or deleted text multiple times to replace words at different locations.
"The mapping uses the x register to save the unnamed register (@") before deleting the current word. The black hole register (@_) is used for the deletion so the unnamed register won't be changed.
nmap <silent> S :let @x=@"<CR>"_diw"xP

"wrap
set wrap

set tags=tags; 
set autochdir 


"恢复Ctrl-A增加数字
unmap <C-A>


"F12切换窗口
noremap <F12> <C-W>w
inoremap <F12> <ESC><C-W>w
noremap <F11> <C-W>W
inoremap <F11> <ESC><C-W>W


"""""""""""""""""""""""""""""""""""python""""""""""""""""""""""""""""""""""""""""""""""""""

" 为.py新文件使用模板
"autocmd BufNewFile *.py 0r ~/.vim/skeleton/py_skeleton.py

" 用:make检验语法
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
" 用:cnext移到到错误的地方
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" F5运行脚本
autocmd BufRead *.py nmap <F5> :!python %<CR>

""""""""""""""""""""""""""""""vundle for plugins"""""""""""""""""""""""""""""""""""""
filetype off                  " required!

" install vundle: git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" install plugins: :BundleInstall
" 在安装插件过程中，如果要求输入github的账号密码，那就说明插件的名字写错了。
" 到这里查 http://vim-scripts.org/vim/scripts.html
" uninstall unnesseccery plugins: :BundleClean
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" [START] my plugins here
Bundle 'SuperTab-continued.'
Bundle 'a.vim'
Bundle 'minibufexpl.vim'
Bundle 'The-NERD-tree'
Bundle 'Align.vim'
Bundle 'Tagbar'
Bundle 'mark.vim'
Bundle 'FencView.vim'
" [END] my plugins here

filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NERD-tree
let NERDChristmasTree=1 
let NERDTreeCaseSensitiveSort=1
let NERDTreeWinSize=24
let NERDTreeShowBookmarks=1  
noremap nm :NERDTreeToggle<CR>

"tarbar
noremap tb :TagbarToggle<CR> 
noremap tl :TagbarToggle<CR> 
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 40


