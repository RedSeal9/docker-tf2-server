from ubuntu:20.04
maintainer RedSeal9 <red@redseal.red>
ENV GID 20141
ENV UID 20143

ARG GID
ARG UID

RUN dpkg --add-architecture i386 \
	&& apt-get -y update \
        && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install lib32z1 libncurses5:i386 libbz2-1.0:i386 lib32gcc1 lib32stdc++6 libtinfo5:i386 libcurl3-gnutls:i386 wget bzip2 unzip nano \
        && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV USER tf2

RUN useradd $USER
ENV HOME /home/$USER
RUN mkdir $HOME
RUN chown $USER:$USER $HOME

USER $USER
ENV SERVER $HOME/hlserver
RUN mkdir $SERVER
RUN wget -O - http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C $SERVER -xvzf -
ADD tf2_ds.txt update.sh tf.sh $SERVER/

EXPOSE 27015/udp

WORKDIR /home/$USER/hlserver
ENTRYPOINT ["./tf.sh"]
CMD ["+sv_pure", "1", "+map", "ctf_2fort", "+maxplayers", "24", "ip", "0.0.0.0"]
