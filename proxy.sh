#!/bin/sh

COMMAND="node_modules/.bin/kappa"
OPT="-c kappa.conf.js"
LOCK="locks/proxy.lock"

usage() {
  echo "Usage: $0 {start|stop|restart}"
  exit 0
}

if [ $# != 1 ]; then
  usage
fi

start()
{
  echo $"Starting proxy..."
  $COMMAND $OPT > logs/proxy.log &
  echo $! > $LOCK
}

stop()
{
  PID=$(cat $LOCK)
  echo $"Stopping proxy: $PID"
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
esac
