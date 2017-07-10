" 语法高亮
syntax enable

" 主题
"colorscheme solarized
"set background=dark

" 设置可加载插件
set nocompatible
filetype plugin on

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
