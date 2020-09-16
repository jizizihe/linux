# if-else
awk 'BEGIN {
	num = 11; 
	if (num % 2 == 0)
		printf "%d 是偶数\n", num; 
	else 
		printf "%d 是奇数\n", num; 
}'
echo --------2------------
# if-else-if
awk 'BEGIN {
	a=30;
	if (a==10)
		print "a = 10";
	else if (a == 20)
		print "a = 20";
	else if (a == 30)
		print "a = 30";
}'
echo --------3------------
# for
awk 'BEGIN {
	for (i = 1; i <= 5; ++i)
		print i
}'
echo --------4------------
# while
awk 'BEGIN {
	i = 1; 
	while (i < 6) {
		print i; ++i
	} 
}'
echo --------5------------
# break
awk 'BEGIN {
	sum = 0;
	for (i = 0; i < 20; ++i) { 
		sum += i;
		if (sum > 50) 
			break;
		else 
			print "Sum =", sum 
	} 
}'
echo --------6------------
# continue
awk 'BEGIN {
	for (i = 1; i <= 20; ++i)
	{
		if (i % 2 == 0) 
			print i;
		else 
			continue
	} 
}'
echo --------7------------
# exit
awk 'BEGIN {
	sum = 0;
	for (i = 0; i < 20; ++i) {
		sum += i; if (sum > 50)
			exit(10);
		else
			print "Sum =", sum 
	} 
}'



