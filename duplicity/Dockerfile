FROM alpine:3.5

RUN apk add --update duplicity ca-certificates gnupg openssh-client py-paramiko py2-pip

RUN pip install --upgrade setuptools
RUN pip install --upgrade distribute

ADD backup.sh /backup.sh
ADD restore.sh /restore.sh

RUN mkdir /root/.gnupg/
ADD gpg-agent.conf /root/.gnupg/gpg-agent.conf
RUN chmod 600 /root/.gnupg

RUN mkdir /root/.ssh
RUN chmod 600 /root/.ssh
