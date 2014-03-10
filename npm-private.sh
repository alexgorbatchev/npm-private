#!/bin/sh

HOME_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
SELF=$HOME_DIR/$(basename -- "$0")
REGISTRY_LOCK="locks/registry.lock"

while [ -h $SELF ]; do
  DIR=$(dirname -- "$SELF")
  SYM=$(readlink $SELF)
  HOME_DIR=$(cd $HOME_DIR && cd $(dirname -- "$SYM") && pwd)
  SELF=$(cd $DIR && cd $(dirname -- "$SYM") && pwd)/$(basename -- "$SYM")
done

cd $HOME_DIR

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

  # preserve NPM registry
  current=$(npm config get registry 2>&1 | tail -1)
  echo $current > $REGISTRY_LOCK

  # override NPM registry
  npm config set registry "http://localhost:5985/"
}

stop()
{
  ./couchdb.sh stop
  ./proxy.sh stop

  # restore NPM settings
  npm config set registry $(cat $REGISTRY_LOCK)
  rm $REGISTRY_LOCK
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
