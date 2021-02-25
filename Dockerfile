FROM zxing/alpine

WORKDIR /
ENV _VERSION 6.4.0

RUN set -x && \
	wget --no-check-certificate https://github.com/xmrig/xmrig-proxy/releases/download/v${_VERSION}/xmrig-proxy-${_VERSION}-linux-static-x64.tar.gz && \ 
	tar xzf xmrig-proxy-${_VERSION}-linux-static-x64.tar.gz && \
	cd xmrig-proxy-${_VERSION}&& \
	mkdir /xmrig-proxy && \
	mv xmrig-proxy /usr/bin/ && \
	cd .. && \
	rm -rf *.tar.gz xmrig-proxy-${_VERSION}
ADD config.json /xmrig-proxy/

EXPOSE 33333/tcp

VOLUME /xmrig-proxy
WORKDIR /xmrig-proxy

CMD /usr/bin/xmrig-proxy -c /xmrig-proxy/config.json