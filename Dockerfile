FROM ubuntu:rolling
ARG TZ

WORKDIR /root/
ENV TZ=$TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
RUN apt upgrade -y -q
RUN apt install -y -q build-essential curl wget vim git ssh
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y -q nodejs

COPY id_rsa.pub ./
RUN mkdir -m 700 .ssh
RUN echo `cat id_rsa.pub` > .ssh/authorized_keys
RUN rm -f id_rsa.pub
RUN chmod 600 .ssh/authorized_keys
RUN sed -i 's/^# export/export/g' .bashrc
RUN sed -i 's/^# eval/eval/g' .bashrc
RUN sed -i 's/^# alias/alias/g' .bashrc
RUN sed -i 's/#alias/alias/g' .bashrc
RUN echo "alias pe='ps -ef'" >> .bash_aliases

CMD service ssh start && tail -f /dev/null

EXPOSE 22
