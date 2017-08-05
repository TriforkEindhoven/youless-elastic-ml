FROM debian:jessie-slim

RUN apt-get update -y &&  \
	apt-get install -y wget git binutils curl make 

RUN wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz -P /tmp && \
	tar -C /usr/local -xzf /tmp/go1.7.3.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin \
	GOPATH=/work

RUN mkdir -p /work/src/github.com/christiangalsterer && \
	cd /work/src/github.com/christiangalsterer && \
	git clone https://github.com/christiangalsterer/httpbeat && \
	cd httpbeat && \
	git checkout tags/3.0.0 && \
	make && \
	mv httpbeat /usr/bin

COPY config/* /etc/httpbeat/

ENTRYPOINT ["/usr/bin/httpbeat"]
CMD ["-path.config", "/etc/httpbeat", "-e", "-v"]