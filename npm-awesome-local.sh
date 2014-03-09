#!/bin/sh

usage() {
  echo "Usage: $0 {start|stop|restart}"
  exit 0
}

if [ $# != 1 ]; then
  usage
fi

start()
{
  ./couchdb.sh start
  ./proxy.sh start
}

stop()
{
  ./couchdb.sh stop
  ./proxy.sh stop
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
