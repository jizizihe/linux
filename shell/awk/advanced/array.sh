#!/bin/sh
echo --------1-----------
# 创建数组:array_name[index]=value :array_name：数组的名称, index：数组索引, value：数组中元素所赋予的值
awk 'BEGIN {
	 sites["test"]="www.test.com";
	 sites["test2"]="www.test2.com"
	 print sites["test"] "\n" sites["test2"]
}'
echo --------2-----------
#删除数组元素:delete array_name[index]
awk 'BEGIN {
	sites["test"]="www.test.com";
	sites["test2"]="www.test2.com"
	delete sites["test"];
	print sites["test"] "\n" sites["test2"]
}'
echo --------3-----------
#
awk 'BEGIN {
	array["0,0"] = 100;
	array["0,1"] = 200;
	array["0,2"] = 300;
	array["1,0"] = 400;
	array["1,1"] = 500;
	array["1,2"] = 600;
# 输出数组元素
	print "array[0,0] = " array["0,0"];
	print "array[0,1] = " array["0,1"];
	print "array[0,2] = " array["0,2"];
	print "array[1,0] = " array["1,0"];
	print "array[1,1] = " array["1,1"];
	print "array[1,2] = " array["1,2"];
}'
