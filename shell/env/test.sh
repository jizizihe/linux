#!/bin/sh
echo ----------1--------------
env #使用env或printenv命令查看当前shell中所定义的全部环境变量
echo ----------2--------------
# 查看进程的环境变量
sudo cat /proc/1/environ 
echo ----------3--------------
# 要想生成一份易读的报表，可以将cat命令的输出通过管道传给tr，将其中的\0替换成\n
sudo cat /proc/1/environ  | tr '\0' '\n'
echo ----------4--------------
# export命令声明了将由子进程所继承的一个或多个变量。这些变量被导出后，当前shell脚本所执行的任何应用程序都会获得这个变量
HTTP_PROXY=jzzzzzzzzzzzzzzzzzzzzh
export HTTP_PROXY
echo $HTTP_PROXY
echo ----------5--------------
echo ${#HTTP_PROXY} # '#'获得字符串的长度
echo ----------6--------------
echo $SHELL # 当前使用的是哪种shell
echo $0 # 当前进程
echo ----------7--------------
#if [ $HTTP_PROXY = "jzzzzzzzzzzzzzzzzzzzzh" ];then #脚本也可以写成下面样子：
if test $HTTP_PROXY = "jzzzzzzzzzzzzzzzzzzzzh"  ;then #注意，[实际上是一个命令，必须将其与剩余的字符串用空格隔开
	echo succend
else
	echo failed
fi
echo ----------8--------------
# 当我们打开终端或是运行shell时，会看到类似于user@hostname:/home/$的提示字符串。
# 不同的GNU/Linux发布版中的提示字符串及颜色各不相同。我们可以利用PS1环境变量来定义主提示字符串。
# 默认的提示字符串是在文件~/.bashrc中的某一行设置的。
echo $PS1

