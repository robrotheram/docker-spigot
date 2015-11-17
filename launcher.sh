#!/bin/bash
command=$1

NAME="minecraft" #contianer Name
DIR=$PWD"/server" #where to store minecraft
PORT="25565"
MYSQLNAME="mysql" #name of the mysql container needs to be running



usage () {
  echo "Usage: launcher COMMAND CONFIG [--skip-prereqs]"
  echo "Commands:"
  echo "    start:      Start/initialize a container"
  echo "    stop:       Stop a running container"
  echo "    rebuild:    Rebuild a running container"
  echo "    build: Stop a running container"
  echo "    remove:     remove all stuff"
  echo "    reset:      stop and remove conatiner"
  echo "    enter:      Enter the container to view running minecraft server or build proccess"
  echo "    mcLog	get the server log"
  echo "    buildLog    get the build log"
  echo "    update      deletes old spigot and rebuilds containers"
  exit 1
}

buildImage(){
  docker build -t spigot-docker .

}


rebuild(){
  remove
  buildImage
  run
}

run(){
  docker run -v $DIR:/minecraft -e EULA=true -e BUILD=true -d -p $PORT:25565 -p 8123:8123 --link $MYSQLNAME:mysql --name $NAME  -it spigot-docker
  echo "Server Starting up can take a few mins"
}

rerun(){
  reset
  run
}
mcLog(){
  docker exec $NAME  cat /minecraft/logs/latest.log > latest.log
}

buildLog(){
  docker exec $NAME  cat
}
enter(){
  docker exec -it $NAME script /dev/null -c 'tmux attach -t GSurvival'
}

start(){
  docker start $NAME
}

update(){
 rm $DIR/spigot.jar
 rebuild
}

stop(){
  echo "Giving users time to log off"
  docker exec $NAME  tmux send -t GSurvival.0 "say Server shut down in 10 seconds please log off" ENTER
  sleep 10
  docker exec $NAME  tmux send -t GSurvival.0 "say Server going bye bye" ENTER
  docker exec $NAME  tmux send -t GSurvival.0 "stop Stuff to do tring some tea " ENTER
  echo "Giving time for the server to stop gracefully"
  sleep 8
  docker stop $NAME
}

remove(){
  docker stop $NAME
  docker rm $NAME
  docker rmi spigot-docker
}

reset(){
  docker stop $NAME
  docker rm $NAME
}


case "$command" in
  remove) remove
  exit 0
  ;;
  start) start
  exit 0
  ;;
  stop) stop
  exit 0
  ;;
  build) buildImage
  exit 0
  ;;
  reset) reset
  exit 0
  ;;
  run) run
  exit 0
  ;;
  enter) enter
  exit 0
  ;;
  rebuild) rebuild
  exit 0
  ;;
  reset) reset
  exit 0
  ;;
  update) update
  exit 0
  ;;
  rerun) rerun
  exit
  ;;

esac

usage
