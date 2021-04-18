from ubuntu:20.04
maintainer RedSeal9 <red@redseal.red>
ARG GID=20141
ARG UID=20143

RUN apt-get -y update \
        && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install lib32gcc1 lib32stdc++6 libstdc++6 libcurl3-gnutls wget libncurses5 bzip2 unzip nano \
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
ADD update.sh tf.sh tf2_ds.txt $SERVER/

EXPOSE 27015/udp

WORKDIR /home/$USER/hlserver
ENTRYPOINT ["./tf.sh"]
CMD ["+sv_pure", "1", "+mapcycle", "mapcycle_quickplay_payload.txt", "+map", "ctf_2fort", "+maxplayers", "24"]
