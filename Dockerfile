FROM ubuntu:rolling

WORKDIR /root/
RUN apt update
RUN apt upgrade -y
RUN apt install -y build-essential curl wget vim git ssh
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs
RUN npm install npm5 -g

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
