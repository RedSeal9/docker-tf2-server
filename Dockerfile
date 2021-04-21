from ubuntu:20.04
LABEL maintainer="RedSeal9 <red@redseal.red>"

ENV TF_MAP=ctf_2fort
ENV TF_HOSTNAME=DockerTF
ENV TF_RCON=red


RUN dpkg --add-architecture i386 \
	&& apt-get -y update \
        && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install lib32z1 libncurses5:i386 libbz2-1.0:i386 lib32gcc1 lib32stdc++6 libtinfo5:i386 libcurl3-gnutls:i386 wget bzip2 unzip nano \
        && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ENV SERVER /server/hlserver
RUN mkdir -p $SERVER
RUN mkdir $SERVER/tf2
ENV SCMD $SERVER/tf2/steamcmd
RUN mkdir $SCMD
RUN wget -O - http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C $SCMD -xvzf -
ADD tf2_ds.txt update.sh tf.sh $SERVER/

EXPOSE 27015/udp

VOLUME $SERVER/tf2

WORKDIR $SERVER
ENTRYPOINT ["./tf.sh"]
CMD [" +sv_pure -1 +maxplayers 24 +ip 0.0.0.0 -port 27015 +map $TF_MAP +hostname $TF_HOSTNAME +rcon_password $TF_RCON +log on"]
