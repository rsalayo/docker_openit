FROM centos:6.8
MAINTAINER Romeo Salayo Jr <rsalayo@openit.com>

# Install requirements
RUN yum install -y ksh wget vixie-cron

# Download, Extract and Install OpeniT CoreServer
ADD setup/answer.key /tmp
ADD setup/init /
RUN useradd openit && \
	cd /tmp && \
	wget https://www.dropbox.com/s/piouy2zsbfuf3v8/openit_6_3_0_5_server_linux_x86_64.tar?dl=1 -O openit.tar && \
	tar -xvpf /tmp/openit.tar && \
	chmod a+x /init && \
	cd /tmp/dist && \
	./setup -b -c /tmp/answer.key

# Cleanup
RUN rm -rf /tmp/*	

# Ports and Volumes
VOLUME /data
EXPOSE 80 7478

CMD ["/init"]