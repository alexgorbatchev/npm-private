#!/bin/sh

DBPATH="./couchdb"
CONFIGFILE="$DBPATH/conf/local.ini"
COMMAND="couchdb"
OPT="-a $CONFIGFILE -o $DBPATH/couchdb.stdout -e $DBPATH/couchdb.stderr"
LOCK="locks/couchdb.lock"
couchdb=${COUCHD-$COMMAND}

usage() {
  echo "Usage: $0 {start|stop|restart|status}"
  exit 0
}

if [ $# != 1 ]; then
  usage
fi

start()
{
  echo $"Starting couchdb..."
  $COMMAND $OPT > /dev/null &
  echo $! > $LOCK
}

stop()
{
  PID=$(cat $LOCK)
  echo $"Stopping couchdb: $PID"
  kill $PID
  rm -f $LOCK
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  status)
    curl http://127.0.0.1:5985/
    ;;
  * )
    usage
    ;;
esac
