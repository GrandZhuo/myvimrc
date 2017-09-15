"**********************************************************************
"                               Vundle                                *
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
"                               一般配置                              *
"**********************************************************************
" 语法高亮
syntax enable

" 设置leader键
let mapleader=","

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
"不显示"press F1 to display help"
let Tlist_Compact_Format=1

" WinManager配置
let g:winManagerWindowLayout='TagList|FileExplorer'
" wm打开文件浏览器和Tlist
nnoremap wm :WMToggle<cr>

" <F12>切换paste模式
set pastetoggle=<F12>

" <F2>保存文件并make
nnoremap <F2> :wa<CR>:make<CR>

" <F3>保存文件并make clean;make
nnoremap <F3> :wa<CR>:make clean;make<CR>

" 设置normal模式开启鼠标支持
set mouse=n

" 设置path
set path+=../**


"**********************************************************************
"                               YCM配置                               *
"**********************************************************************
" 配置默认的ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' 
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全

"跳转
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>   
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>	" 跳转到定义
nnoremap <leader>gl :YcmCompleter goToDeclaration<CR>	" 跳转到申明

" 打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0   

"使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1 

" YCM查错
nnoremap <leader>f4 :YcmDiags<CR>
"
" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口

"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']

nnoremap <leader>f5 :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" 设置错误和警告提示
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

" 设置颜色
"highlight YcmErrorSign                      error标记颜色
"highlight YcmWarningSign ctermbg=none       warning标记颜色
"highlight YcmErrorSection                   代码中出错字段颜色
"highlight YcmWarningSection ctermbg=none
"highlight YcmErrorLine                      出错行颜色
"highlight YcmWarningLine

"**********************************************************************
"                     C，C++, Java F10编译运行                        *
"**********************************************************************
map <F10> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc


"**********************************************************************
"                        C,C++ gdb调试 F11                            *
"**********************************************************************
map <F11> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


"**********************************************************************
"                             键盘命令                                *
"**********************************************************************
" 保存文件
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>

" 关闭文件
nnoremap <leader>q :q<CR>

" 查找文件
nnoremap <leader>fd :find 

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 打开quickfix列表
nnoremap <leader>co :copen<CR>

" 关闭quickfix列表
nnoremap <leader>ccl :cclose<CR>

" 关闭窗口
nnoremap <leader>clo :close<CR>

"**********************************************************************
"                               文件命令                              *
"**********************************************************************
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/sh") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."),   "  > File Name   : ".expand("%")) 
        call append(line(".")+1, "  > Author      : GrandZhuo") 
        call append(line(".")+2, "  > Mail        : lizhuo93@foxmail.com") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G
