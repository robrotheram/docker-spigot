FROM debian:wheezy


RUN apt-get update && apt-get install -y \
    git \
    nano \
    tmux \
    unzip \
    tar \
    wget \
    openjdk-7-jre-headless

VOLUME /minecraft

ADD scripts/run.sh /run.sh
ADD scripts/start.sh /start.sh
ADD scripts/update.sh /update.sh
ADD scripts/pluginEdit /pluginEdit


RUN chmod 777 /run.sh
RUN chmod 777 /update.sh
RUN chmod 777 /start.sh
RUN chmod 777 /pluginEdit

EXPOSE 25565
EXPOSE 8123

CMD  /run.sh
