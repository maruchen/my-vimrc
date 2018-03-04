" by cj
" @2018-3-4
set nocompatible

if has("win32")
    " @windows
    " 在windows下使用mswin.vim 
    " mswin.vim 包括设置ctrl-c/v/x
    " ctrl-q, ctrl-s
    " ctrl-z, ctrl-y
    " ctrl-a 等快捷键
    source $VIMRUNTIME/mswin.vim
    " windows下恢复Ctrl-A增加数字
    unmap <C-A>
endif

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
set autoindent


""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用Vundle自动下载插件 (https://github.com/VundleVim/Vundle.vim)
" 1. 在可以联网的机器上:
"   a) 先安装vundle：git clone https://github.com/gmarik/Vundle.vim.git %USERPROFILE%/.vim/bundle/Vundle.vim
"   b) 执行PluginInstall自动下载插件
"   c) 执行PluginUpdate自动更新插件
"   d) 执行PluginClean删除不用的插件
" 2. 在不能联网的机器上:
"   a) 从已经联网的机器上拷贝 .vim/bundle目录即可
"   b) Windows下默认目录是: %USERPROFILE%/.vim/
"
" 安装新插件：
" 1. 从github上下载插件：
"   Plugin 'tpope/vim-fugitive'
" 2. 从 http://vim-scripts.org/vim/scripts.html 下载插件：
"   Plugin 'a.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" 在http://vim-scripts.org/vim/scripts.html查插件

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


Plugin 'a.vim'
Plugin 'ack.vim'
"Plugin 'Mark--Karkat' " 官方版本太旧
Plugin 'mihais/vim-mark'
"let g:mwDefaultHighlightingPalette = 'extended' 
"let g:mwDefaultHighlightingNum = 12
let g:mwDefaultHighlightingPalette = [ 
            \   { 'ctermbg':'Blue',       'ctermfg':'White', 'guibg':'#9999FF', 'guifg':'Black' },
            \   { 'ctermbg':'Green',      'ctermfg':'Black', 'guibg':'#A4E57E', 'guifg':'Black' },
            \   { 'ctermbg':'Yellow',     'ctermfg':'Black', 'guibg':'#FFDB72', 'guifg':'Black' },
            \   { 'ctermbg':'Gray',       'ctermfg':'Black', 'guibg':'#A3A396', 'guifg':'#222222' },
            \   { 'ctermbg':'Cyan',       'ctermfg':'Black', 'guibg':'#8CCBEA', 'guifg':'Black' },
            \   { 'ctermbg':'Red',        'ctermfg':'Black', 'guibg':'#FF7272', 'guifg':'Black' },
            \   { 'ctermbg':'Magenta',    'ctermfg':'Black', 'guibg':'#FFB3FF', 'guifg':'Black' },
            \]

Plugin 'ervandew/supertab'
Plugin 'ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.swo,tags
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

Plugin 'Tabular'
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
    nmap <Leader>a_ :Tabularize /_\zs<CR>
    vmap <Leader>a_ :Tabularize /_\zs<CR>
endif

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

Plugin 'fholgado/minibufexpl.vim'
let g:miniBufExplorerMoreThanOne=0

Plugin 'DoxygenToolkit.vim'
noremap <F2> :Dox<CR>

"tarbar
" :Tab /= 
" :Tab/:
Plugin 'Tagbar'
noremap tb :TagbarToggle<CR> 
noremap tl :TagbarToggle<CR> 
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 40

"NERD-tree
Plugin 'The-NERD-tree'
let NERDChristmasTree=1 
let NERDTreeCaseSensitiveSort=1
let NERDTreeWinSize=24
let NERDTreeShowBookmarks=1  
noremap nm :NERDTreeToggle<CR>

Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

" the-silver-searcher
Plugin 'ag.vim'


" for node
Plugin 'moll/vim-node'
" :JSHint {file}
Plugin 'walm/jshint.vim'
Plugin 'pangloss/vim-javascript'
" after the expansion, go to its folder and perform:  git submodule update --init --recursive
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
" V模式下的快捷键 ctrl-f
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" for python
" 需要先安装pyflakes: pip --proxy web-proxyhk.oa.com:8080  install pyflakes
" 按F4做静态检查
Plugin 'pyflakes'
autocmd FileType python map <buffer> <F4> :call Pyflakes()<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
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
" 为了开发BetaSound，临时使用cp936(GBK)
"set fileencoding=cp936

let g:fencview_autodetect=1

if has("win32")
    " @windows
    set langmenu=zh_CN.UTF-8
    language message zh_CN.UTF-8
else
    " @linux
    set langmenu=en_US.UTF-8
    language message en_US.UTF-8
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置图形界面。
"
" 字体部分，可参考
" http://www.2maomao.com/blog/best-programmer-fonts/

if has("gui_running")
    if has("win32")
        " 设定 windows 下 gvim 启动时最大化
        "autocmd GUIEnter * simalt ~x
        " 设定 windows 下图形界面下的字体。该字体需要自己下载安装，下载地址：
        " http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.zip
        "set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI
        set guifont=Source_Code_Pro:h12
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

set hlsearch

"" backup file
" 覆盖写文件时，会备份一份~开头的原文件
" 备份的目录。优先保存到当前目录
"   linux默认是：".,~/tmp,~/"
"   windows默认是：".,$TEMP,c:/tmp,c:/temp"
" 如果开启备份功能，最好提前创建该目录；否则保存在当前目录太乱
"set nobackup
"set backupdir=$VIM/backupDir

"" undo file
" undo files默认保存在当前目录，以.un~结尾
" 默认情况下，当文件从vim buffer退出时，该文件的undo操作记录会被清空。
" 当开启undofile选项后，undo操作记录会被持久化到文件中。
" undofile默认关闭，该如何开启？
"   1. vim 编译时开启 +persistent_undot 特性（默认开启)
"   2. 开启boolean值：set undofile
"   3. 关闭：set noundofile
" 需要手动创建目录
"   windows: vim_install_dir/undo_file
"   linux: ~/.vim/undo_file
set undofile
set undodir=$VIM/undo_file

"" swap file
" 默认开启，不建议修改
" 以.swp结尾。当打开文件时，会创建一个临时文件，避免异常退出时没有保存
" 默认保存在当前目录，不建议修改
"   linux默认是：".,~/tmp,~/"
"   windows默认是：".,$TEMP,c:/tmp,c:/temp"
":set dir="."

"save original file
"set patchmode=.orig


set cursorline
set incsearch
set ignorecase
set smartcase

"status line
set laststatus=2
set statusline=%<%f\ %h%r%m%y%=%-14.(%l/%L,%c%)\ %{&fileencoding}\ %P
set showcmd 

"tab length
"<TAB>
set tabstop=4
"for python
set expandtab
"shift width
"<TAB> 和 <BackSpace>
set softtabstop=4
set shiftwidth=4

"断行
"中文乱断行
"set linebreak


"自动打开文件时指定执行命令
:if !exists("autocommands_loaded")
:  let autocommands_loaded = 1
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set fdm=syntax
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set foldlevel=100
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set sidescroll=5
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set listchars+=precedes:<,extends:>
:  au BufNewFile,BufRead *.py :set fdm=indent
:endif

syntax on

"启用加密
"set cm=blowfish

"设置当前打开的文件目录为当前目录
autocmd BufEnter * cd %:p:h

"d,c,y后用寄存器内容替换当前光标所在单词
"快捷键S
"You can use the last yanked or deleted text multiple times to replace words at different locations.
"The mapping uses the x register to save the unnamed register (@") before deleting the current word. The black hole register (@_) is used for the deletion so the unnamed register won't be changed.
nmap <silent> S :let @x=@"<CR>"_diw"xP

"wrap
set wrap

set tags=./tags;,tags
set autochdir 


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

""""""""""""""""""""""""""""""""""""php""""""""""""""""""""""""""""""""""""""""""

"检查当前文件代码语法(php)
function! CheckSyntax()
  if &filetype!="php"
    echohl WarningMsg | echo "Fail to check syntax! Please select the right file!" | echohl None
    return
  endif
  if &filetype=="php"
    " Check php syntax
    setlocal makeprg=\"php\"\ -l\ -n\ -d\ html_errors=off
    " Set shellpipe
    setlocal shellpipe=>
    " Use error format for parsing PHP error output
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
  endif
  execute "silent make %"
  set makeprg=make
  execute "normal :"
  execute "copen"
endfunction
map <F6> :call CheckSyntax()<CR>

"删除文件尾多余的空行 
au BufWritePre *.php %s/^$\n\+\%$//ge 
"保存文件时自动删除行尾空格或Tab 
au BufWritePre *.php sil %s/\s\+$//e 
" 自动给行末添加一个空行
autocmd BufWritePre *.php sil $s/.$/&\r/e 

""""""""""""""""""""""""""""""""""""html""""""""""""""""""""""""""""""""""""""""""
"html
:let g:html_indent_script1 = "inc" 
:let g:html_indent_style1 = "inc" 


:filetype indent on

" html <tag> % 跳转
"runtime macros/matchit.vim 
:filetype plugin on 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set highlight jce
autocmd BufRead *.jce set filetype=jce

"""""""""""""""""""""""""""""""""""nodejs""""""""""""""""""""""""""""""""""""""""""""""""""
" F4检验语法
autocmd BufRead *.js nmap <F4> :JSHint<CR>
" F5运行脚本
autocmd BufRead *.js nmap <F5> :!node %<CR>


""""""""""""""""""""""""""""cpp common header"""""""""""""""""""""""""""""""""""""""
function! s:insert_cpp_header()
    execute "normal! ggO/*****************************************"
    execute "normal! oFile Name : " . expand("%")
    execute "normal! oPurpose : "
    execute "normal! oCreation Date : " .strftime("%d-%m-%Y %H:%M:%S")
    execute "normal! oLast Modified : "
    execute "normal! oCreated By : kevincjchen "
    execute "normal! o****************************************/"
endfunction
autocmd BufNewFile *.{h,cpp,c} call <SID>insert_cpp_header()

autocmd Bufwritepre,filewritepre *.h,*.cpp,*.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.h,*.cpp,*.c exe "1," . 7 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%d-%m-%Y %H:%M:%S")
autocmd bufwritepost,filewritepost *.h,*.cpp,*.c execute "normal `a"

""""""""""""""""""""""""""""hpp gate guard"""""""""""""""""""""""""""""""""""""""
function! s:insert_gates()
    let gatename = "__" . substitute(toupper(expand("%:t")), "\\.", "_", "g") . "__"
    execute "normal! Go#ifndef " . gatename
    execute "normal! o#define " . gatename . " "
    execute "normal! Go"
    execute "normal! Go#endif /* " . gatename . " */"
    normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" press space to fold/unfold code
nnoremap <space> za
vnoremap <space> zf

