#!/bin/bash
echo -------1--------
# echo在每次调用后会添加一个换行符：
echo "Welcome to Bash" #需要将文本放入双引号中，echo命令就可以将其中的文本在终端中打印出来。
echo =
echo Welcome to Bash #类似地，不使用双引号也可以得到同样的输出结果：
echo =
# 实现相同效果的另一种方式是使用单引号：
echo 'Welcome to Bash'
echo -------2--------
# 双引号允许shell解释字符串中出现的特殊字符。单引号不会对其做任何解释。
a=1
echo "Welcome to $a Bash"
echo "Welcome to $a \$a Bash"
echo 'Welcome to $a \$a Bash'
echo -------4--------
#转义字符
echo -e "1\t2\t3\n"
echo -e "\"Welcome to Bash\""
echo -------5--------
#不换行
echo -e "OK! \c" # -e 开启转义 \c 不换行
echo #换行 
echo -------6--------
# 显示命令执行结果: 命令执行 `command`
echo `date`
echo -------7--------
# read 命令从标准输入中读取一行,并把输入行的每个字段的值指定给 shell 变量
echo "input your name:"
read name 
echo "$name is a very good"
