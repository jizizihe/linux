#######################################################
# Filename     : test.sh
# Last modified: 2020-10-16 20:05
# Author       : jzzh
# Email        : jzzh@szbaijie.cn
# Company site : http://www.szbaijie.cn/index.php
# Description  : 
#######################################################
#!/bin/sh

# source 这个function.sh脚本，可以在命令行直接执行脚本中的函数
function main()
{
	echo "这个函数会对输入的两个数字进行相加运算..."
	echo "输入第一个数字: "
	read aNum
	echo "输入第二个数字: "
	read anotherNum
	echo "两个数字分别为 $aNum 和 $anotherNum !"
	return $(($aNum+$anotherNum))
}


