#!/bin/sh #内核会读取脚本的首行并注意到shebang为#!/bin/bash。它会识别出/bin/bash并执行该脚本

# username@hostname$: $表示普通用户，#表示管理员用户root

# 脚本的执行方式有两种:
# 1. bash myScript.sh
# 2. chmod a+x myScript.sh ; ./myScript.sh   #u 表示用户 g 表示用户组 o 表示其它 a 表示所有

# shell使用分号或换行符来分隔单个命令或命令序列: cmd1 ; cmd2
