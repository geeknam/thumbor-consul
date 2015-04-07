FROM ubuntu:14.04

MAINTAINER Nam Ngo <nam@kogan.com.au>

ENV HOME /root

RUN apt-get update

# Thumbor Requirements
RUN apt-get install -y build-essential python-dev python-pycurl python-pip git supervisor curl runit
RUN apt-get install -y python-numpy python-opencv webp libpng-dev libtiff-dev libjasper-dev libjpeg-dev
RUN apt-get install -y libdc1394-22-dev libdc1394-22 libdc1394-utils

ENV CT_URL https://github.com/hashicorp/consul-template/releases/download/v0.1.0/consul-template_0.1.0_linux_amd64.tar.gz
RUN curl -L $CT_URL | tar -C /usr/local/bin --strip-components 1 -zxf -
ADD consul-template.service /etc/service/consul-template/run
ADD thumbor.conf /etc/consul-templates/thumbor.conf

# Install thumbor and thumbor_aws
COPY requirements.txt /root/requirements.txt
RUN pip install -r /root/requirements.txt

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY thumbor.conf /root/thumbor.conf

CMD ["/usr/bin/supervisord"]

CMD ["/usr/bin/runsvdir", "/etc/service"]