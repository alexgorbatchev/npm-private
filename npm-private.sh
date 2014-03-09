#!/bin/sh

HOME=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
SELF=$HOME/$(basename -- "$0")

while [ -h $SELF ]; do
  DIR=$(dirname -- "$SELF")
  SYM=$(readlink $SELF)
  HOME=$(cd $HOME && cd $(dirname -- "$SYM") && pwd)
  SELF=$(cd $DIR && cd $(dirname -- "$SYM") && pwd)/$(basename -- "$SYM")
done

cd $HOME

usage() {
  echo "Usage: $(basename $0) {install|start|stop|restart}"
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
