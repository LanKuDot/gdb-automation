# Origin Author: zzz0072
# !/bin/sh

# Check if the files would be compared exists.
if [ $# != 2 ] ; then
	exit
fi

# The QEMU dosen't terminate automatically.
# So we have to kill the QEMU process.
pkill -9 qemu-system-arm

# Check if the UART output and GDB session output
# are the same.
diff $1 $2
if [ $? != 0 ] ; then
	echo "\nLog checking result: "
	echo "Wrong!"
else
	echo "\nLog checking result: "
	echo "Correct!"
fi

echo "\nData sent( GDB session )"
cat $2
echo "\nUART output"
cat $1


# Clear the log file after checking
rm $1
rm $2
