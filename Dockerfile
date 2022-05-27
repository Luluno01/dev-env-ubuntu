FROM ubuntu:rolling
ARG TZ
ARG user
ARG uid
ARG gid

RUN groupadd --gid $gid $user && \
    useradd \
      --home-dir /home/$user \
      --create-home \
      --uid $uid \
      --gid $gid $user \
      --shell /bin/bash
WORKDIR /home/$user
ENV TZ=$TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone
RUN apt update
RUN apt upgrade -y -q
RUN apt install -y -q \
      build-essential \
      curl \
      wget \
      vim \
      git \
      ssh
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y -q nodejs
RUN apt install sudo -y -q
RUN chmod 620 /etc/sudoers
RUN echo "$user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chmod 220 /etc/sudoers

USER $user
COPY id_rsa.pub ./
RUN mkdir -m 700 .ssh
RUN echo `cat id_rsa.pub` > .ssh/authorized_keys
RUN rm -f id_rsa.pub
RUN chmod 600 .ssh/authorized_keys
RUN sed -i 's/^# \?export/export/g' .bashrc
RUN sed -i 's/^# eval/eval/g' .bashrc
RUN sed -i 's/^# alias/alias/g' .bashrc
RUN sed -i 's/#alias/alias/g' .bashrc
RUN echo "alias pe='ps -ef'" >> .bash_aliases

USER root
CMD service ssh start && tail -f /dev/null

EXPOSE 22
