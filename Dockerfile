#Forked from <timhaak/docker-sickrage>
FROM resin/rpi-raspbian:wheezy
MAINTAINER Dieter Rosch <dieter.rosch@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV SICKRAGE_VERSION master
ENV LANG en_US.UTF-8
ENV LC_ALL C.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get -q update
RUN apt-get -qy --force-yes dist-upgrade
RUN apt-get install -qy --force-yes python-cheetah wget tar ca-certificates curl unrar-free
RUN curl -L https://github.com/SiCKRAGETV/SickRage/tarball/${SICKRAGE_VERSION} -o sickrage.tgz
RUN tar -xvf sickrage.tgz -C /  
RUN mv /SiCKRAGETV-SickRage-* /sickrage/ 
RUN rm  /sickrage.tgz 
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists/* 
RUN rm -rf /tmp/*

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8081

CMD ["/start.sh"]
