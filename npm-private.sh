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
  ./couchdb.sh start

  # TODO find a better way to wait for couch to start
  sleep 3

  ./install.sh
  ./couchdb.sh stop

  echo "Run: $(basename $0) start"
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
