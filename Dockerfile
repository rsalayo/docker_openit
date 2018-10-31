FROM centos:6.8
MAINTAINER Romeo Salayo Jr <rsalayo@openit.com>

# Install requirements
RUN yum install -y ksh wget vixie-cron

# Download, Extract and Install OpeniT CoreServer
ADD setup/answer.key /tmp
ADD setup/init /
RUN useradd openit && \
	cd /tmp && \
	wget https://privatebox.openit.com/3151f37a0b9e1bfc3bab7f885166a80e/Server/Linux/openit_6_5_1_14_server_linux_x86_64.tar -O openit.tar && \
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