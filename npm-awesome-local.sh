#!/bin/sh

usage() {
  echo "Usage: $0 {install|start|stop|restart}"
  exit 0
}

if [ $# != 1 ]; then
  usage
fi

install()
{
  ./install.sh
}

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
  install)
    install
    ;;
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
