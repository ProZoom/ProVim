""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                "
"                                                                "
"             ____         __     ___                            "
"            |  _ \ _ __ __\ \   / (_)_ __ ___                   "
"            | |_) | '__/ _ \ \ / /| | '_ ` _ \                  "
"            |  __/| | | (_) \ V / | | | | | | |                 "
"            |_|   |_|  \___/ \_/  |_|_| |_| |_|                 "
"                                                                "
"                                                                "
"                               Email: liyang.ok@outlook.com     "
"                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{                                                             "
"  安装插件方法(本方案采用Vundle管理插件):                       "
"                                                                "
"     bundle分为三类，比较常用就是第二种：
"
"       1.在Github vim-scripts 用户下的repos,只需要写出repos名称
"       2.在Github其他用户下的repos, 需要写出”用户名/repos名”
"       3.不在Github上的插件，需要写出git全路径
"
"  将安装的插件在~/.vimrc配置，但是我是将插件配置信息放在
"  ~/.vimrc.bundles，所以你会在我的～／.vimrc.bundles里看
"  到我装的插件。
"
"  插件的下载安装：
"
"       1. 终端输入vim，打开vim，正常模式下输入
"               :BundleInstall  回车
"       2.  在终端中直接运行  vim +BundleInstall +qall
"
"  插件更新：
"               :PluginUpdate
"  显示已安装的插件列表：
"               :PluginList
"  清理未使用的插件：
"               :PluginClean
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim快捷键记录
"
"   折叠代码(Normal)：
"       折叠{}内: zf%
"       折叠到86行：zf86G
"       空格键
"
"
"   多行锁进(Visul)：
"       选择多行，按ctrl+v进入visul模式，用>或<缩进或缩出（shift+,)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}



" Environment {{{{
   " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
"}}}}


" Use bundles config {{{{
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }}}}

" General {{{{

    set background=dark         " Assume a dark background

    "colorscheme solarized

    " Allow to trigger background
    function! ToggleBG()
        let s:tbg = &background
        " Inversion
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
    noremap <leader>bg :call ToggleBG()<CR>


    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    set autowrite                       " Automatically write a file when leaving a modified buffer
    set autoread
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator
    set iskeyword+=.,_,$,@,%,#,-

    set backup                  " Backups are nice ...
    if has('persistent_undo')
         set undofile                " So is persistent undo ...
         set undolevels=1000         " Maximum number of changes that can be undone
         set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    endif

    set showcmd

    set tabpagemax=15               " Only show 15 tabs

    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number


    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set list                       "show tab
    set listchars=tab:>\ ,trail:●,extends:#,nbsp:. " Highlight problematic whitespace
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

    set rnu                         "相对行号

    "自动保存折叠码
    set foldmethod=marker
    au FileType c set foldmethod=syntax
    au FileType cpp set foldmethod=syntax
    au FileType java set foldmethod=syntax
    au FileType python set foldmethod=indent
    au FileType css set foldmethod=syntax
    au FileType html set foldmethod=indent
    au FileType javascript set foldmethod=indent

    set foldenable " 开始折叠
    set foldcolumn=4 " 设置折叠区域的宽度
    setlocal foldlevel=20 " 设置折叠层数为
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>   " 用空格键来开关折叠
    au BufWinLeave *.* silent mkview  "records settings
    au BufWinEnter *.* silent loadview "reloads settings

    "autocmd FileType c source ~/.vim/c.vim

    autocmd VimEnter * set nospell
" }}}}

" Key (re)Mappings {{{{

    " The default leader is '\', but many people prefer ',' as it's in a standard

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    "切换Buffer窗口
    imap <S-Left> <ESC>:bp<cr> i
    imap <S-Right> <ESC>:bn<cr> i
    map <S-Left> :bp<cr>
    map <S-Right> :bn<cr>


" }}}}

" Functions {{{{

    " Initialize directories {{{
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.before.local file:
        "   let g:spf13_consolidated_directory = <full path to desired directory>
        "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
        if exists('g:spf13_consolidated_directory')
            let common_dir = g:spf13_consolidated_directory . prefix
        else
            let common_dir = parent . '/.' . prefix
        endif
    endfunction
    "}}}

     " 新建.c,.h,.sh,.java文件，自动插入文件头 {{{

    autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"

    ""定义函数SetTitle，自动插入文件头

    func SetTitle()
        "如果文件类型为.sh文件
        if &filetype == 'sh'
            call setline(1,"\#!/bin/bash")
            call append(line("."), "")
        elseif &filetype == 'python'
            call setline(1,"#!/usr/bin/env python")
            call append(line("."),"# coding=utf-8")
            call append(line(".")+1, "")

        elseif &filetype == 'ruby'
            call setline(1,"#!/usr/bin/env ruby")
            call append(line("."),"# encoding: utf-8")
            call append(line(".")+1, "")
        elseif &filetype == 'jsp'
            call setline(1,"<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>")
            call append(line(".","<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">"))
            call append(line(".")+1,""))
        else
            call setline(1, "/*")
            call append(line("."), "* > File Name: ".expand("%"))
            call append(line(".")+1, "* > Author: ProZoom")
            call append(line(".")+2, "* > Mail: liyang_android@163.com")
            call append(line(".")+3, "* > Created Time: ".strftime("%c"))
            call append(line(".")+4, "*/")
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
            call append(line(".")+6,"public class ".expand("%:r")."{")
            call append(line(".")+7,"")

            call append(line(".")+8,"}")
        endif

        "新建文件后，自动定位到文件末尾

    endfunc


    "}}}

     "定义FormartSrc(),代码格式 优化 {{{

    map <leader>f :call FormartSrc()<CR><CR>

    func FormartSrc()
        exec "w"
        if &filetype == 'c'
            exec "!astyle --style=ansi --suffix=none % & rm %.orig"
        elseif &filetype == 'cpp' || &filetype == 'hpp'
            exec "r !astyle --style=ansi --suffix=none % & rm %.orig"
        elseif &filetype == 'perl'
            exec "!astyle --style=gnu --suffix=none % & rm %.orig"
        elseif &filetype == 'py'||&filetype == 'python'
            exec "r !autopep8 -i --aggressive % & rm %.orig"
        elseif &filetype == 'java'
            exec "!astyle --style=java --suffix=none % & rm %.orig"
        elseif &filetype == 'jsp'
            exec "!astyle --style=gnu --suffix=none % & rm %.orig"
        elseif &filetype == 'xml'
            exec "!astyle --style=gnu --suffix=none % & rm %.orig"
        else
            exec "normal gg=G"
            return
        endif
        exec "e! %"
    endfunc

    "}}}


    " C，C++ 按F5 编译运行,F8调试 {{{

    map <F5> :call CompileRunGcc()<CR>

    map <F8> :call Rungdb()<CR>

    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -std=c++11 -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java' 
            exec "!javac %" 
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!time python3 %"
        elseif &filetype == 'html'
            exec "!google-chrome % &"
        elseif &filetype == 'go'
            exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
    endfunc

    func! Rungdb()
        exec "w"
        exec "!g++ % -std=c++11 -g -o %<"
        exec "!gdb ./%<"
    endfunc
    "}}}

    " 在浏览器预览 for Mac{{{
    function! ViewInBrowser(name)
        let file = expand("%:p")
        let l:browsers = {
            \"cr":"open -a \"Google Chrome\"",
            \"sf":"open -a Safari",
        \}

        let file = '"'. file . '"'
        exec ":update " .file
        exec ":silent!" .l:browsers[a:name] ." file://". file
    endfunction
    nmap <Leader>cr :call ViewInBrowser("cr")<cr>
    nmap <Leader>sf :call ViewInBrowser("sf")<cr>:e<cr>
    "}}}
"}}}}


" Plugins Config {{{ {

    " NerdTree {{{
        if isdirectory(expand("~/.vim/bundle/nerdtree"))


            map <F3> :NERDTreeToggle<CR> "打开树状文件目录

            nmap <leader>nt :NERDTreeFind<CR>
            map <leader>e :NERDTreeFind<CR>

            autocmd vimenter * if !argc() | NERDTree | endif "当打开vim且没有文件时自动打开NERDTree

            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=0
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=0
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=0
        endif
    " }}}


    " TagBar {{{
        if isdirectory(expand("~/.vim/bundle/tagbar/"))
            nmap <F4> :TagbarToggle<CR>
            let g:tagbar_ctags_bin='/usr/local/bin/ctags' "设置tagbar使用的ctags的插件,必须要设置对
            let g:tagbar_width=24  "设置tagbar的窗口宽度
            let g:tagbar_left=0  "设置tagbar的窗口显示的位置
        endif
    "}}}

    " Rainbow {{{
        if isdirectory(expand("~/.vim/bundle/rainbow/"))
            let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
        endif
    "}}}

    " YouCompleteMe {{{
        if isdirectory(expand("~/.vim/bundle/YouCompleteMe/"))
            let g:acp_enableAtStartup = 0
            let g:ycm_autoclose_preview_window_after_completion=1
            let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
            "let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
            let g:ycm_confirm_extra_conf=0

            let g:ycm_python_binary_path='/usr/local/Cellar/python3/3.6.3/Frameworks/Python.framework/Versions/3.6/bin/python3.6'
            nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
            " enable completion from tags
            let g:ycm_collect_identifiers_from_tags_files = 1

            let g:ycm_max_num_candidates=25
            let g:ycm_max_num_identifier_candidates=25
            let g:ycm_max_diagnostics_to_display=30

            " Enable omni completion.
            autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
            autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
            autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

            set completeopt-=preview
            let g:ycm_semantic_triggers = {
                \   'css': [ 're!^\s{2}', 're!:\s+' ],
                \ }
        endif
    " }}}

    " UltiSnips {{{
        if isdirectory(expand("~/.vim/bundle/YouCompleteMe/"))
            let g:UltiSnipsExpandTrigger="<leader><tab>"
            let g:UltiSnipsJumpForwardTrigger="<tab>"
            let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
            let g:UltiSnipsEditSplit="vertical"
        endif
    "}}}

    "Python-mode{{{
        " Disable if python support not present
        if !has('python') && !has('python3')
            let g:pymode = 0
        endif

        if isdirectory(expand("~/.vim/bundle/python-mode"))
            let g:pymode_lint_checkers = ['pyflakes']
            let g:pymode_trim_whitespaces = 0
            let g:pymode_options = 0
            let g:pymode_rope = 0
            let g:pymode_motion = 1
        endif
    "}}}

    " airline {{{
        if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
            " 使用powerline打过补丁的字体
            let g:airline_powerline_fonts=1
            if !exists('g:airline_symbols')
                let g:airline_symbols={}
            endif
            " 关闭空白符检测
            let g:airline#extensions#whitespace#enabled=0
            let g:airline#extensions#tabline#enabled = 1
            let g:airline#extensions#tabline#buffer_nr_show = 0
            let g:airline#extensions#whitespace#symbol = '!'

            let g:airline_left_sep = '⮀'
            let g:airline_left_alt_sep = '|'
            let g:airline_right_sep = ''
            let g:airline_right_alt_sep = '|'
        endif
    " }}}

    "markdown{{{
        let g:instant_markdown_slow = 1
    "}}}

    "IndentLine{{{
        let g:indentLine_char = '┆'
    "}}}

    "undotree{{{
        nnoremap <F2> :UndotreeToggle<cr>
    "}}}
    "
" }}}}


