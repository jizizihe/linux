#!/bin/bash
#设置前景色 :重置=0，黑色=30，红色=31，绿色=32，黄色=33，蓝色=34，洋红=35，青色=36，白色=37
echo -e "\e[1;32m Green Background \e[0m"
echo -e "\e[1;33m Green Background \e[0m"
echo -------------
#设置背景色:重置=0，黑色=40，红色=41，绿色=42，黄色=43，蓝色=44，洋红=45，青色=46，白色=47
echo -e "\e[1;42m Green Background \e[0m"
echo -e "\e[1;43m Green Background \e[0m"
echo -------------
# \e[0m 关闭所有属性 \e[1m 设置高亮度 \e[4m 下划线 
echo -e "\e[1;33m Green Background \e[0m"
echo -e "\e[4;33m Green Background \e[0m"
# 更多:可以使用man console_codes来查看相关文档。
