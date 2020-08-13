set cursorline
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
"自动缩进设置tab=4
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab "不要将tab转化为空格
"增加ctags跳转
set autochdir
set tags=tags;
map <c-]> g<c-]>
"taglist
let Tlist_Show_One_File = 1 "多个文件时，只选择当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示
"let Tlist_Auto_Open = 1 "自动打开
let Tlist_Use_SingleClick = 1 "单击跳转
let Tlist_WinWidth = 40 "窗口宽度
map ll :Tlist <Enter>
"保存上次进入的位置
if has("autocmd")
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
endif
"c
hi cFunctions gui=NONE cterm=NONE ctermfg=14
hi cComment ctermfg =3
hi cString ctermfg =208
hi cNumber ctermfg =75
hi cConstant ctermfg =201
hi cType ctermfg =118
hi cStatement ctermfg =9
hi cPreCondit ctermfg =1 "声明颜色"
hi cDefine ctermfg =2 "声明颜色"
hi cStructure ctermfg =141 "声明颜色"
"java
hi javaFuncDef gui=NONE cterm=NONE ctermfg=14
hi javaComment ctermfg =3
hi javaDocComment ctermfg =3
hi javaLineComment ctermfg =3
hi javaStorageClass ctermfg =121
hi javaExceptions ctermfg =211
hi javaScopeDecl ctermfg =197
hi javaBoolean ctermfg =223
let java_highlight_java =1
let java_highlight_functions =1
hi javaString ctermfg =202
hi javaNumber ctermfg =75
hi javaConstant ctermfg =201
hi javaType ctermfg =118
hi javaStatement ctermfg =9
"cscope
if has("cscope")  
	set csprg=/usr/bin/cscope
	set csto=1 "先查询tag的再查询cscope的(csto=0)
	"set cst "同时查找cscope数据库和tags文件(nocst)
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
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
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
"自动弹出颜色设置
hi Pmenu ctermfg=0 ctermbg=171
hi PmenuSel ctermbg=10
