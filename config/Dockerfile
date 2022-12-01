FROM debian
MAINTAINER me
LABEL name=smalltalk

RUN apt update && apt install -y \
  gnu-smalltalk \
  vim

COPY ./.vimrc /root/.vimrc

VOLUME ./app /root/app

WORKDIR /root/app
