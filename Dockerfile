FROM ubuntu:20.04
LABEL maintainer="RedSeal9 <git@redseal.red>"

ENV MAP=ctf_2fort
ENV HOSTNAME=DockerTF
ENV RCON=red

ARG DEBIAN_FRONTEND=noninteractive


RUN dpkg --add-architecture i386 \
	&& apt-get -y update \
        && apt-get -y install lib32z1 libncurses5:i386 libbz2-1.0:i386 lib32gcc1 lib32stdc++6 libtinfo5:i386 libcurl3-gnutls:i386 libsdl2-2.0-0:i386 wget bzip2 unzip sudo nano \
        && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV USER tf2

RUN useradd $USER

ENV HOME /home/$USER
RUN mkdir $HOME
ENV SERVER $HOME/hlserver
RUN mkdir $SERVER
RUN wget -O - http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C $SERVER -xvzf -
ADD start.sh update.sh run.sh $SERVER/

EXPOSE 27015/udp

VOLUME $SERVER/tf2
RUN chown $USER:$USER $HOME -R


WORKDIR $SERVER
ENTRYPOINT ["./start.sh"]
CMD [" +sv_pure -1 +maxplayers 24 +ip 0.0.0.0 -port 27015 +map $TF_MAP +hostname $TF_HOSTNAME +rcon_password $TF_RCON +log on"]
