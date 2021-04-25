#!/bin/sh
echo ---------1-------------
#sed s: 替换字符串
sed 's/ /-/g' example.txt #将所有的空格换成连词线- 
echo 
sed 's/[0-9]/d/g' example.txt #将数字换成字母d
echo 
sed 's/This/THE/p' example.txt # p 标记会输出修改过的行,p 命令表示搜索符号条件的行，并输出该行的内容
echo 
sed -n 's/This/THE/p' example.txt #-n 选项会禁止 sed 输出,将二者匹配使用的效果就是只输出被替换命令修改过的行
echo
sed 's/Test/trial/w xx.txt' example.txt #将匹配后的结果保存到指定文件中, w将文本中指定行的内容写入文件中
echo
sed '$r xx.txt' example.txt #r 命令用于将一个独立文件的数据插入到当前数据流的指定位置, 数据插入到数据流的末尾，可以使用 $ 地址符
echo ---------1-------------
#sed d: 删除文本中的特定行
sed 'd' example.txt #什么也不输出，证明成了空文件
echo
sed '3d' example.txt #行号指定:删除example文件内容中的第 3 行
echo
sed '2,3d' example.txt #特定行区间指定:删除example 文件内容中的第2、3行
echo
sed '3,$d' example.txt #特殊的文件结尾字符，比如删除 example.txt 文件内容中第 3 行开始的所有的内容
echo ---------1-------------
#sed a 和 i: a 命令表示在指定行的后面附加一行，i 命令表示在指定行的前面插入一行 
sed '3i\This is an inserted line.' example.txt #将一个新行插入到数据流第三行前
sed -i '3i\This is an inserted line.' example.txt #将一个新行插入到文件第三行前
echo
sed '3a\This is an appended line.' example.txt #将一个新行附加到数据流中第三行后
echo
sed '1i\This is one line of new text.\ This is another line of new text.' example.txt
echo ---------1-------------
#sed c: 将指定行中的所有内容，替换成该选项后面的字符串
sed '3c\This is a changed line of text.' example.txt
echo ---------1-------------
#sed y: 唯一可以处理单个字符的 sed 脚本命令,找到的所有指定字符自动进行转换，而不会考虑它们出现的位置
sed 'y/123/789/' example.txt
echo ---------1-------------
#sed q: 在第一次匹配任务结束后，退出 sed 程序
sed '2q' example.txt
echo ---------1-------------
#sed 1...: 以数字形式指定行区间, sed 会将文本流中的第一行编号为 1，然后继续按顺序为接下来的行分配行号
sed '2s/This/Cat/' example.txt
echo 
sed '2,$s/This/Cat/' example.txt #如果想将命令作用到文本中从某行开始的所有行，可以用特殊地址美元符（$）
echo ---------1-------------
#sed "": 用文本模式指定行区间, 指定文本模式来过滤出命令要作用的行,必须用正斜线
sed '/1/s/This/Dog/' example.txt
