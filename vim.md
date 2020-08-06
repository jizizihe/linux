#### 1、命令行

- **:! cmd** ：执行**cmd**命令。
- **:!!** ：执行上一次的外部命令。
- **:sh** ：调用shell，用exit返回vim。
- **:r !cmd** ：将命令的返回结果插入文件当前位置
- **:set ignorecase**：忽略大小写
- **:'<,'>normal I-** ：（**:'<,'>**是视图模式下选中，然后按：就会出来）表示： 普通文本行变成无序列表，只能在行首（类似与视图选中按shift+i，在任意位置）

#### 2、快捷键

- **ctrl+v+i**：vim强制输入tab
- **.**：（普通模式下的“点”）用于重复上一次修改。
- **ctrl+p和ctrl+n**：在“输入模式”下自动补全。
- **选中缩进**：用ctrl+v或者鼠标左键选中代码，按下shift+i，然后使用tab，delete或者<<和>>等等来缩进。最后按两下ESC作用选中部分 
- **:%s/源字符串/目的字符串/g**：全部替换
- 查找：**/字符串**
- **/(ctrl+r+w)**：查找当前光标所在的字符
- 自动匹配括号[]{}()：**%**
- 跳转到代码块开头（'{'必须独占一行）：**[[**
- **ctrl+z**：挂起vim（**fg+数字**：重新进入挂起程序。**jobs**：查看挂起程序）
- **u**：撤销
- **ctrl+r**：恢复撤销
- **ctrl+i**：回到下一次光标的位置
- **ctrl+o**：回到上一次光标的位置
- **shift+6(^**)或者按**home**：跳转到行首
- **shift+4($)**或者**end**：跳转到行末
- **ctrl+g**：查看当前文件名和所在行号
- **shift+8(*)或者shift+3(#)***：查找光标所在处的对象（然后按快键键 N 向后查找，按 shift+N 为向前查找）。注：匹配单词而不是字符串一部分，和“/”查找不同。
- **ctrl+方向键左键**：光标移动到前一个空格的开头
- **ctrl+方向键右键**：光标移动到后一个空格的开头
- **ctrl+d**: 下翻半屏
- **ctrl+u**: 上翻半屏
- **{**：光标移至段落第一个字母
- **}**：光标移至段落最后一个字母
- **n+**：光标下移n行
- **n-**：光标上移n行
- **H**：光标移至屏幕顶行
- **M**：光标移至屏幕中间行
- **L**：光标移至屏幕最后行
- **j**：光标向上移动
- **k**：光标向下移动
- **shift+zz（ZZ）**：快速保存退出
- **shift+zq（ZQ）**：快速不保存退出

#### 3、vimdiff比较文件

```sh
vimdiff point.c point-a.c  
```

- **zc**：折叠行

- **zn**：展开行

- **]c**：跳到下一个不同处

- **[c**：跳到上一个不同处

- **ctrl + w + w**：左右切换
- **dp**：把point.c光标所在的行复制到point-a.c对应的行
- **do**：把point-a.c的复制到point.c光标所在的对应的行
- **wqa!**：保存所有文件并退出

#### 4、ctags-cscope

##### （1）创建**ctags_cscope.sh**脚本：

```sh
#!/bin/sh
find . -name "*.h" -o -name "*.c" -o -name "*.cc"  -o -name "*.java"> cscope.files
cscope -Rbkq -i cscope.files
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
#ctags -R .
```

##### （2）ctag命令

- **Ctrl + ]**或者**ctrl+鼠标左键**：跳转到函数
- **Ctrl + o**：回到最开始跳转的地方
- **Ctrl + t**：回到上一步跳转的地方
- 当在vim中跳转不准确的时候，使用**：ts**来查看所有可跳转的选项

##### （3）cscope命令

- **add**：添加一个新的数据库（用法：add file|dir [pre-path][flags]）
- **find**：查询一个模式
    - **c**：找到调用这个函数的函数
    - **d**：找到被这个函数调用的函数
    - **e**：找到这个egrep模式
    - **f**：找到此文件夹
    - **g**：找到这个定义
    - **i**：找文件#包括这个文件
    - **s**：找到这个C符号
    - **t**：找到对其的赋值
- **help**：显示此信息
- **kill**：结束一个连接
- **reset**：重置所有连接
- **show**：显示连接

#### 5、删除“开头结尾”的空格

- **$**：行末
- **^**：行首
- **\s**：空格
- **\s\+$**：行末空格
- **^\+\s**：行首空格
- **:%s/\s\+$//**： 删除这些每行后面多余的空格（”**%s**（全文）“替换“**\s\+$**（行末空格）”为”/（空）“）。
- **:%s/^\+\s//**： 删除这些每行前面多余的空格（”**%s**（全文）“替换“**^\+\s**（行首空格）”为”/（空）“）。

#### 6、多标签编辑

```sh
vi -p file1 file2 ......
```

- **:tabn**：切换到下一个标签
- **:tabp**：切换到上一个标签
- **:tabc**：关闭当前标签
- **:tabo**：关闭其他标签页
- **:tabe filename**：在新标签页打开这个文件

#### 7、多窗口编辑

```sh
vi -O file1 file2 ....
```

- **:vne filename**：垂直分割出一个新窗口
- **ctrl + w + w**：左右切换

#### 8、快速编辑

##### （1）宏

- **qa** ：开始录制宏a(录制多个键盘操作记录--相当于复制)
- **q**：停止录制
- **@a**：播放宏**a**（相当于粘贴）

##### （2）替换

- **r**：替换光标处的字符，同样支持汉字。
- **R**：进入替换模式，按**esc**回到正常模式。

##### （3）改变大小写

- **~**：反转光标所在字符的大小写
- **U**：把选中的文本变为**大**写。
- **u**：把选中的文本变为**小**写。

#### 9、文件加密

**vim -x file**：开始编辑一个加密的文件。

- **:X**：为当前文件设置密码。
- **:set key=**：(=后有空格)去除文件的密码。

#### 10、vimrc

```sh
"光标线
set cursorline
"显示状态行
set statusline+=%F____line:%l____percent:%p
set laststatus=2
hi statusline ctermfg=0
hi statusline ctermbg=yellow
"选中高亮
set hlsearch
"鼠标点击
set mouse=nv
"自动缩进设置tab=4
set smartindent 
set tabstop=4 
set shiftwidth=4 
set noexpandtab "不要将tab转化为空格
set softtabstop=4
"增加ctags跳转
set autochdir
set tags=tags;
map <c-]> g<c-]> "按ctrl+]自动列出跳转选项
"taglist "使用Tlist打开，焦点在Tlist窗口按q退出
let Tlist_Show_One_File = 1 "多个文件时，只选择当前文件的               
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示                        
let Tlist_Auto_Open = 1 "自动打开                            
let Tlist_Use_SingleClick = 1 "单击跳转                        
let Tlist_WinWidth = 40 "窗口宽度
map ll :Tlist <Enter> "映射为ll
"保存上次进入的位置
if has("autocmd")
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
endif
```

#### 11、修改vim颜色

```sh
vi /usr/share/vim/vim74/syntax/c.vim     //cFunctions只能写在这里，不然识别不了
vi /usr/share/vim/vim74/syntax/java.vim
```

修改如下：

```sh
"highlight Functions
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
```

然后修改vimrc：

```sh
hi cFunctions gui=NONE cterm=NONE  ctermfg=14 "函数颜色
hi cComment ctermfg =3 "注释颜色
hi cString ctermfg =208 "字符串颜色
hi cNumber ctermfg =75 "数字颜色
hi cConstant ctermfg =201 "常量颜色
hi cType ctermfg =118 "类型颜色
hi cStatement ctermfg =9 "声明颜色
hi cPreCondit ctermfg =1 " #if 0 #endif 颜色
hi cDefine ctermfg =2 "define "define颜色
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
let OmniCpp_MayCompleteDot=1 "打开  . 操作符
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
```

#### 12、颜色图

![vim_color](https://github.com/jizizihe/vim/blob/master/photo/Image.png)

