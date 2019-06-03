FROM tensorflow/tensorflow:1.13.1-py3

ARG http_proxy
ARG https_proxy
ARG no_proxy

ADD Container-Root /

WORKDIR /

RUN export http_proxy=$http_proxy; export https_proxy=$https_proxy; export no_proxy=$no_proxy; /setup.sh; rm -f /setup.sh

RUN apt-get update; apt-get install -y nano vim

RUN pip3 install -r requirements.txt

CMD /startup.sh
