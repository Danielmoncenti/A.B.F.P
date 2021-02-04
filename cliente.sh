PORT=2021
IP_CLIENT="127.0.0.1"
IP_SERVER="127.0.0.1"

echo"Cliente ABFP"

echo "Sending Headers"

echo "ABFP $IP_CLIENT" | nc -q 1 $IP_SERVER $PORT

echo "Listening"



RESPONSE= `nc -l -p $PORT`

if ["$RESPONSE" != "OK_CONN"] 
then 
echo "Connection Fail"
exit 1
fi

echo "Handshake"

sleep 1

echo "THIS IS MY CLASSROOM" | nc -q 1 $IP_SERVER $PORT

$RESPONSE= `nc -l -p $PORT`

if ["$RESPONSE" != "Yes_it_is"]
then
	echo "Connection Fail"
	exit 2
	fi
	echo "Sending File Name"
exit 0 
