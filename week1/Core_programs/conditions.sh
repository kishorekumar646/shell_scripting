
#!/bin/sh

if [ $1 -gt 100 ]
then
	echo "1 is greate than 100"
	if [ 100 -lt $1 ]
	then
		echo "1 less than 100"
	fi
fi
