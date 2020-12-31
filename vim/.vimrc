""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set cursorline
"显示状态行
set statusline+=%F____line:%l____percent:%p
set laststatus=2
hi statusline ctermfg=0
hi statusline ctermbg=yellow
syntax on
"选中高亮
set hlsearch
"鼠标点击
set mouse=nv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"增加跳转脚本
nnoremap <F2> :! python3 ~/.vim/ctags_cscope/ctags_cscope.py;cscope -Rbkq -i cscope.files ;ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR> 
"忽略大小写
nnoremap <F3> :set ignorecase<CR> 
"去空行  
nnoremap <F4> :%s/\s\+$//<CR> 
"创建新窗口与标签页
nnoremap <F5> :vne<CR> 
nnoremap <F6> :tabnew<CR> 
nnoremap <F7> :tabp<CR> 
nnoremap <F8> :tabn<CR> 
"打开最近文件, :e #<数字跳转或者按"q”再输入数字，就能跳转。
nnoremap <c-F5> :browse oldfiles<CR> 
"ctags跳转匹配的标签
nnoremap <c-F6> :ts<CR> 
nnoremap <c-F7> :tp<CR> 
nnoremap <c-F8> :tn<CR> 
"按住ALT+PAGEUP会使另一边窗口滑动
noremap <M-PageUp> <C-w>p<C-u><C-w>p
noremap <M-PageDown> <C-w>p<C-d><C-w>p
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"禁止生成临时文件
set nobackup
set noswapfile
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动缩进设置tab=4
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab "不要将tab转化为空格
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"增加ctags跳转
set autochdir
set tags=tags;
map <c-]> g<c-]>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree.vim
"nnoremap <c-F5> :NERDTreeMirror<CR>
"nnoremap <c-F5> :NERDTreeToggle<CR>
"map ll :NERDTreeMirror <Enter>
"map ll :NERDTreeToggle <Enter>
""基本设置
"let g:NERDTreeWinPos="left"
"let g:NERDTreeWinSize=40
"let g:NERDTreeShowLineNumbers=1
"let g:neocomplcache_enable_at_startup = 1 "插件自动启动 
""不显示隐藏文件
"let g:NERDTreeHidden=0
"let NERDTreeIgnore = ['\.swp', '\.swo', '\.mod.c', '\.mod.o', '\.builtin', '\.order'] "过滤: 所有指定文件和文件夹不显示
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"taglist
let Tlist_Show_One_File = 1 "多个文件时，只选择当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示
let Tlist_Auto_Open = 0 "自动打开
let Tlist_Use_SingleClick = 1 "单击跳转
let Tlist_WinWidth = 40 "窗口宽度
map ll :Tlist <Enter>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"保存上次进入的位置
if has("autocmd")
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"c
hi cFunctions gui=NONE cterm=NONE ctermfg=14 "函数颜色
hi cComment ctermfg =100 "注释颜色
hi cString ctermfg =208 "字符串颜色
hi cNumber ctermfg =75 "数字颜色
hi cConstant ctermfg =201 "常量颜色
hi cType ctermfg =118 "类型颜色
hi cStatement ctermfg =9 "声明颜色
hi cPreCondit ctermfg =1 "#if 0 #endif 颜色
hi cDefine ctermfg =177 "define "define颜色
hi cStructure ctermfg =141 "结构体颜色
"java
hi javaFuncDef gui=NONE cterm=NONE ctermfg=14
hi javaComment ctermfg =3
hi javaDocComment ctermfg =3
hi javaLineComment ctermfg =3
hi javaStorageClass ctermfg =121
hi javaExceptions ctermfg =211
hi javaScopeDecl ctermfg =197
hi javaBoolean ctermfg =223
let java_highlight_java =1 "打开java内部的高亮，如String、Integer
let java_highlight_functions =1
hi javaString ctermfg =202
hi javaNumber ctermfg =75
hi javaConstant ctermfg =201
hi javaType ctermfg =118
hi javaStatement ctermfg =9
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"cscope
if has("cscope")  
	set csprg=/usr/bin/cscope
	set csto=1 "先查询tag的再查询cscope的(csto=0)
	"set cst "同时查找cscope数据库和tags文件(nocst)
	set nocsverb
	set cspc=3
	"add any database in current dir
	if filereadable("cscope.out")
		cs add cscope.out
		"else search cscope.out elsewhere
	else
		let cscope_file=findfile("cscope.out", ".;")
		let cscope_pre=matchstr(cscope_file, ".*/")
		if !empty(cscope_file) && filereadable(cscope_file)
			exe "cs add" cscope_file cscope_pre
		endif
	endif
endif
"按下ctrl+空格键+s，下面类似
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR> "找到这个C符号
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR> "找到这个定义
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR> "找到调用这个函数的函数
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR> "找到此文件
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR> "找文件#包括这个文件
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR> "找到对其的赋值
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR> "找到被这个函数调用的函数
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"输入. , ->, :: 操作符自动补全自动补全
filetype on
filetype plugin on
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot=1 "打开  . 操作符
let OmniCpp_MayCompleteArrow=1 "打开 -> 操作符
let OmniCpp_MayCompleteScope=1 "打开 :: 操作符
let OmniCpp_NamespaceSearch=1 "打开命名空间
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DefaultNamespace=["std"]
let OmniCpp_ShowPrototypeInAbbr=1 "打开显示函数原型
let OmniCpp_SelectFirstItem = 2 "自动弹出时自动跳至第一个
hi Pmenu ctermfg=0 ctermbg=171 "自动弹出颜色设置
hi PmenuSel ctermbg=10
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <F2> :call TitleDet()<cr> "按F2插入文件头
"新建.c,.h,.sh文件，自动插入文件头
"autocmd BufNewFile *.cpp,*.[ch],*.sh exec ":call TitleDet()" 
autocmd BufNewFile * exec ":call TitleDet()" 
function AddTitle()
	if &filetype == 'sh' "如果文件类型为.sh文件
		call append(0,"#######################################################")
		call append(1,"# Filename     : ".expand("%:t"))
		call append(2,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
		call append(3,"# Author       : jzzh")
		call append(4,"# Email        : jzzh@szbaijie.cn")
		call append(5,"# Company site : http://www.szbaijie.cn/index.php")
		call append(6,"# Description  : ")
		call append(7,"#######################################################")
		call append(8,"\#!/bin/sh")
		echohl WarningMsg | echo "Successful in adding copyright." | echohl None
	else
		call append(0,"/******************************************************")
		call append(1,"* Filename     : ".expand("%:t"))
		call append(2,"* Last modified: ".strftime("%Y-%m-%d %H:%M"))
		call append(3,"* Author       : jzzh")
		call append(4,"* Email        : jzzh@szbaijie.cn")
		call append(5,"* Company site : http://www.szbaijie.cn/index.php")
		call append(6,"* Description  : ")
		call append(7,"******************************************************/")
	endif
"	if &filetype == 'c'
"		call append(8,"#include<stdio.h>") 
"	endif
"	if &filetype == 'cpp'
"		call append(8, "#include<iostream>")
"		call append(9, "using namespace std;")
"	endif
endfunction

function UpdateTitle()
	normal m'
	execute '/# Last modified/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
	normal ''
	normal mk
	execute '/# Filename/s@:.*$@\=": ".expand("%: ")@'
	execute "noh"
	normal 'k
	echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction

function TitleDet()
	let n=1
	while n < 10
		let line = getline(n)
		if line =~ '^\#\s*\S*Last\smodified\S*.*$'
			call UpdateTitle()
			return
		endif
	let n = n + 1
	endwhile
	call AddTitle()
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
