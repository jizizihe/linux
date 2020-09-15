#!/bin/sh
echo ---------1-------------
#awk 动作 文件名
# $0代表整个文本行
#根据空格和制表符，将每一行分成若干字段，依次用$1为第一列，$2为第二列......，依次类推
echo 'hello awk' | awk '{print $0}'

echo ---------2-------------
#这个文件的字段分隔符是冒号（:），所以要用-F参数指定分隔符为冒号。然后，才能提取到它的第一个字段。
#print命令里面的逗号，表示输出的时候，两个部分之间使用空格分隔
awk -F ':' '{ print $1 ,$3}' log.txt

echo ---------3-------------
#$NF就代表最后一个字段。$(NF-1)代表倒数第二个字段。依次类推
echo 'hello awk world' | awk '{print $NF}'

echo ---------4-------------
#内置函数:awk内置函数的完整列表，可以查看手册。
awk -F ':' '{ print toupper($1)}' log.txt #字符转为大写。
echo 
awk -F ':' '{ print tolower($1)}' log.txt #字符转为小写。
echo 
awk -F ':' '{ print length($1)}' log.txt #返回字符串长度。
echo ---------5-------------
#条件: awk '条件 动作' 文件名
awk -F ':' '/root/ {print $1}' log.txt
echo 
awk -F ':' 'NR % 2 == 1 {print $1}' log.txt #输出奇数行
echo 
awk -F ':' 'NR >1 {print $1}' log.txt #输出第三行以后的行
echo 
awk -F ':' '$1 == "root" {print $1}' log.txt #输出第一个字段等于指定值的行。
echo 
awk -F ':' '$1 == "root" || $1 == "lightdm" {print $1}' log.txt #输出第一个字段等于指定值的行。
echo ---------6-------------
#if语句: 
awk -F ':' '{if ($1 > "m") print $1}' log.txt #输出第一个字段的第一个字符大于m的行。
echo 
awk -F ':' '{if ($1 > "m") print $1; else print "error! "}' log.txt
echo ---------7-------------
#BEGIN END
awk 'BEGIN {print "The data3 File Contents:"} {print $0}' log.txt #BEGIN 会强制 awk 在读取数据前执行该关键字后指定的脚本命令
echo
awk 'BEGIN {print "The data3 File Contents:"} {print $0} END {print "End of File"}' log.txt #awk 会在读完数据后执行它们
