" by cj
" @2018-3-4
set nocompatible

if has("win32")
    " @windows
    " ��windows��ʹ��mswin.vim 
    " mswin.vim ��������ctrl-c/v/x
    " ctrl-q, ctrl-s
    " ctrl-z, ctrl-y
    " ctrl-a �ȿ�ݼ�
    source $VIMRUNTIME/mswin.vim
    " windows�»ָ�Ctrl-A��������
    unmap <C-A>
endif

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
set autoindent


""""""""""""""""""""""""""""""""""""""""""""""""""
" ʹ��Vundle�Զ����ز�� (https://github.com/VundleVim/Vundle.vim)
" 1. �ڿ��������Ļ�����:
"   a) �Ȱ�װvundle��git clone https://github.com/gmarik/Vundle.vim.git %USERPROFILE%/.vim/bundle/Vundle.vim
"   b) ִ��PluginInstall�Զ����ز��
"   c) ִ��PluginUpdate�Զ����²��
"   d) ִ��PluginCleanɾ�����õĲ��
" 2. �ڲ��������Ļ�����:
"   a) ���Ѿ������Ļ����Ͽ��� .vim/bundleĿ¼����
"   b) Windows��Ĭ��Ŀ¼��: %USERPROFILE%/.vim/
"
" ��װ�²����
" 1. ��github�����ز����
"   Plugin 'tpope/vim-fugitive'
" 2. �� http://vim-scripts.org/vim/scripts.html ���ز����
"   Plugin 'a.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" ��http://vim-scripts.org/vim/scripts.html����

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


Plugin 'a.vim'
Plugin 'ack.vim'
"Plugin 'Mark--Karkat' " �ٷ��汾̫��
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
" Vģʽ�µĿ�ݼ� ctrl-f
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" for python
" ��Ҫ�Ȱ�װpyflakes: pip --proxy web-proxyhk.oa.com:8080  install pyflakes
" ��F4����̬���
Plugin 'pyflakes'
autocmd FileType python map <buffer> <F4> :call Pyflakes()<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ��������˵�������ļ�ʱ����fileencodings���Խ��룬Ȼ��ת��Ϊvim�ڲ��ı����ʽ��encoding����vim��fileencoding����Ϊ���Ľ�������д�ļ�ʱ�ٽ��ڲ����루encoding��תΪfileencoding��

" encoding��vim���ڲ�ʹ�õı��뷽ʽ
" utf8�ܱ�ʾ���������ַ�������vim�Զ�̽���ļ��ı��뷽ʽ���׼ȷ
" ���� encoding ѡ���漰�� Vim �������ַ����ڲ���ʾ�����ֻ���� Vim ������ʱ������һ�Ρ��� Vim �����������޸�encoding ����ɷǳ�������⡣
set encoding=utf-8

" ������Զ�ʶ����ͨ������ fileencodings ʵ�ֵ�
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" termencoding ������Ļ��ʾ��ʱ����ڲ�����ת��Ϊ��Ļ���룬�����������
" gvim��������term������termencoding��gvimû������
let &termencoding = &encoding

" ��vim�½��ļ�ʱ�����øñ��룻�������ļ�ʱ��fileencoding�ᱻ���ó�̽�⵽�ı���
set fileencoding=utf-8
" Ϊ�˿���BetaSound����ʱʹ��cp936(GBK)
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

" ����ͼ�ν��档
"
" ���岿�֣��ɲο�
" http://www.2maomao.com/blog/best-programmer-fonts/

if has("gui_running")
    if has("win32")
        " �趨 windows �� gvim ����ʱ���
        "autocmd GUIEnter * simalt ~x
        " �趨 windows ��ͼ�ν����µ����塣��������Ҫ�Լ����ذ�װ�����ص�ַ��
        " http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.zip
        "set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI
        set guifont=Source_Code_Pro:h12
    else
        " �趨 linux ��ͼ�ν����µ����壬������ Fedora 7 �Դ�
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
" ����д�ļ�ʱ���ᱸ��һ��~��ͷ��ԭ�ļ�
" ���ݵ�Ŀ¼�����ȱ��浽��ǰĿ¼
"   linuxĬ���ǣ�".,~/tmp,~/"
"   windowsĬ���ǣ�".,$TEMP,c:/tmp,c:/temp"
" ����������ݹ��ܣ������ǰ������Ŀ¼�����򱣴��ڵ�ǰĿ¼̫��
"set nobackup
"set backupdir=$VIM/backupDir

"" undo file
" undo filesĬ�ϱ����ڵ�ǰĿ¼����.un~��β
" Ĭ������£����ļ���vim buffer�˳�ʱ�����ļ���undo������¼�ᱻ��ա�
" ������undofileѡ���undo������¼�ᱻ�־û����ļ��С�
" undofileĬ�Ϲرգ�����ο�����
"   1. vim ����ʱ���� +persistent_undot ���ԣ�Ĭ�Ͽ���)
"   2. ����booleanֵ��set undofile
"   3. �رգ�set noundofile
" ��Ҫ�ֶ�����Ŀ¼
"   windows: vim_install_dir/undo_file
"   linux: ~/.vim/undo_file
set undofile
set undodir=$VIM/undo_file

"" swap file
" Ĭ�Ͽ������������޸�
" ��.swp��β�������ļ�ʱ���ᴴ��һ����ʱ�ļ��������쳣�˳�ʱû�б���
" Ĭ�ϱ����ڵ�ǰĿ¼���������޸�
"   linuxĬ���ǣ�".,~/tmp,~/"
"   windowsĬ���ǣ�".,$TEMP,c:/tmp,c:/temp"
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
"<TAB> �� <BackSpace>
set softtabstop=4
set shiftwidth=4

"����
"�����Ҷ���
"set linebreak


"�Զ����ļ�ʱָ��ִ������
:if !exists("autocommands_loaded")
:  let autocommands_loaded = 1
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set fdm=syntax
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set foldlevel=100
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set sidescroll=5
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set listchars+=precedes:<,extends:>
:  au BufNewFile,BufRead *.py :set fdm=indent
:endif

syntax on

"���ü���
"set cm=blowfish

"���õ�ǰ�򿪵��ļ�Ŀ¼Ϊ��ǰĿ¼
autocmd BufEnter * cd %:p:h

"d,c,y���üĴ��������滻��ǰ������ڵ���
"��ݼ�S
"You can use the last yanked or deleted text multiple times to replace words at different locations.
"The mapping uses the x register to save the unnamed register (@") before deleting the current word. The black hole register (@_) is used for the deletion so the unnamed register won't be changed.
nmap <silent> S :let @x=@"<CR>"_diw"xP

"wrap
set wrap

set tags=./tags;,tags
set autochdir 


"F12�л�����
noremap <F12> <C-W>w
inoremap <F12> <ESC><C-W>w
noremap <F11> <C-W>W
inoremap <F11> <ESC><C-W>W


"""""""""""""""""""""""""""""""""""python""""""""""""""""""""""""""""""""""""""""""""""""""

" Ϊ.py���ļ�ʹ��ģ��
"autocmd BufNewFile *.py 0r ~/.vim/skeleton/py_skeleton.py

" ��:make�����﷨
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
" ��:cnext�Ƶ�������ĵط�
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" F5���нű�
autocmd BufRead *.py nmap <F5> :!python %<CR>

""""""""""""""""""""""""""""""""""""php""""""""""""""""""""""""""""""""""""""""""

"��鵱ǰ�ļ������﷨(php)
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

"ɾ���ļ�β����Ŀ��� 
au BufWritePre *.php %s/^$\n\+\%$//ge 
"�����ļ�ʱ�Զ�ɾ����β�ո��Tab 
au BufWritePre *.php sil %s/\s\+$//e 
" �Զ�����ĩ���һ������
autocmd BufWritePre *.php sil $s/.$/&\r/e 

""""""""""""""""""""""""""""""""""""html""""""""""""""""""""""""""""""""""""""""""
"html
:let g:html_indent_script1 = "inc" 
:let g:html_indent_style1 = "inc" 


:filetype indent on

" html <tag> % ��ת
"runtime macros/matchit.vim 
:filetype plugin on 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set highlight jce
autocmd BufRead *.jce set filetype=jce

"""""""""""""""""""""""""""""""""""nodejs""""""""""""""""""""""""""""""""""""""""""""""""""
" F4�����﷨
autocmd BufRead *.js nmap <F4> :JSHint<CR>
" F5���нű�
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

