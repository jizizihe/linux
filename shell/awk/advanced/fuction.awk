# 返回最小值
function find_min(num1, num2)
{
	if (num1 < num2)
		return num1
			return num2
}

# 返回最大值
function find_max(num1, num2)
{
	if (num1 > num2)
		return num1
			return num2
}

# 主函数
function main(num1, num2)
{
# 查找最小值
	result = find_min(10, 20)
		print "Minimum =", result

# 查找最大值
		result = find_max(10, 20)
		print "Maximum =", result
}

# 脚本从这里开始执行
BEGIN {
	main(10, 20)
}  
