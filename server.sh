#!/bin/bash
PORT=2021

echo " Servidor ABFP "

echo "Listening $PORT"

HEADER=`nc -l -p $PORT`

echo "TEST! $HEADER"
PREFIX=` echo $HEADER| cut -d " " -f 1`
IP_CLIENT= `echo $HEADER | cut -d " " -f 2`
 if ["$PREFIX" != "ABFP" ]
then
 echo "error en header"
 sleep 1
 echo "KO_CONN" | nc -q 1 $IP_CLIENT $PORT
 exit 1

fi
echo "ok_conn"| nc -q 1 $IP_CLIENT $PORT

echo "(5)LISTEN"


HANDSHAKE=`nc -l -p $PORT`
if ["$HANDSHAKE" != "THIS IS MY CLASSROOM" ]
then
echo"connection_ko" | nc -q 1 $IP_CLIENT $PORT
exit 2 
fi
echo "Yes_it_is"| nc -q 1 $IP_CLIENT $PORT

echo " Listen"

FILENAME=`nc -l -p $PORT`

exit 0

 
