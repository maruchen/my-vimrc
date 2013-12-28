set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


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

let g:fencview_autodetect=1

set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ����ͼ�ν��档
"
" ���岿�֣��ɲο�
" http://www.2maomao.com/blog/best-programmer-fonts/

if has("gui_running")
    if has("win32")
        " �趨 windows �� gvim ����ʱ���
        autocmd GUIEnter * simalt ~x
        " �趨 windows ��ͼ�ν����µ����塣��������Ҫ�Լ����ذ�װ�����ص�ַ��
        " http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.zip
        set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI
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


"No backup file
"set nobackup

"backup in the directory
"set backupdir=$VIM/backupDir

"��ר�ŵ��ļ��д��swp��ʱ�����ļ�
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

"����
"�����Ҷ���
"set linebreak


"�Զ����ļ�ʱָ��ִ������
:if !exists("autocommands_loaded")
:  let autocommands_loaded = 1

"�����ļ�
":  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :Tlist
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set fdm=syntax
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set foldlevel=100
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set sidescroll=5
:  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h,*.py :set listchars+=precedes:<,extends:>
":  au BufNewFile,BufRead *.c,*.cpp,*.cs,*.h  :set fdm=indent
:endif


"���ü���
set cm=blowfish

"���õ�ǰ�򿪵��ļ�Ŀ¼Ϊ��ǰĿ¼
autocmd BufEnter * cd %:p:h

"d,c,y���üĴ��������滻��ǰ������ڵ���
"��ݼ�S
"You can use the last yanked or deleted text multiple times to replace words at different locations.
"The mapping uses the x register to save the unnamed register (@") before deleting the current word. The black hole register (@_) is used for the deletion so the unnamed register won't be changed.
nmap <silent> S :let @x=@"<CR>"_diw"xP

"wrap
set wrap

set tags=tags; 
set autochdir 


"�ָ�Ctrl-A��������
unmap <C-A>


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

""""""""""""""""""""""""""""""vundle for plugins"""""""""""""""""""""""""""""""""""""
filetype off                  " required!

" install vundle: git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" install plugins: :BundleInstall
" �ڰ�װ��������У����Ҫ������github���˺����룬�Ǿ�˵�����������д���ˡ�
" ������� http://vim-scripts.org/vim/scripts.html
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


