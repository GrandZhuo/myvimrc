"**********************************************************************
"								Vundle                                *
"**********************************************************************
" Vundle BRGING>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Vundle END <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

"**********************************************************************
"								一般配置                              *
"**********************************************************************
" 语法高亮
syntax enable

" 主题
colorscheme solarized
" set background=dark

" 设置可加载插件
set nocompatible
" filetype plugin on

" 修复backspace问题
set backspace=indent,eol,start

" 设置自动缩进
set autoindent 
" C风格缩进
set cindent

" 设置缩进4空格
set shiftwidth=4
set softtabstop=4
set tabstop=4

" 设置默认显示行号
set nu

" 设置历史记录保存数量
set history=200

" 设置默认高亮查找匹配"
set hlsearch

" 激活增量查找
set incsearch

" 加载matchit插件
runtime macros/matchit.vim

" 创建<C-l>快捷键关闭高亮功能"
nnoremap <silent> <C-l>	:<C-u>nohlsearch<CR><C-l>

" 每次保存文件时调用ctags
"autocmd BufWritePost * call system("ctags -R")

" 创建F5快捷键建立tags
nnoremap <f5> :!ctags -R<CR>

" Tlist配置
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" WinManager配置
let g:winManagerWindowLayout='TagList|FileExplorer'
" wm打开文件浏览器和Tlist
nmap wm :WMToggle<cr>

" <F12>切换paste模式
set pastetoggle=<F12>

"**********************************************************************
"								YCM配置                               *
"**********************************************************************
