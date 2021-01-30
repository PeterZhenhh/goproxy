# Usage: https://hub.docker.com/r/phuslu/goproxy-vps/

FROM alpine:3.6

RUN apk add --no-cache curl xz tar && \
	mkdir /tmp/goproxy-vps && \
	goproxy_vps_loc=$(curl -Lks https://github.com/PeterZhenhh/prom-releases/ | grep -oE '/PeterZhenhh/prom-releases/.*/prom_linux_amd64-r1651.tar.xz' | head -1) && \
	curl -L https://github.com${goproxy_vps_loc} | xz -d | tar xvf - -C /tmp/ && \
	mv /tmp/goproxy-vps/goproxy-vps / && \
	rm -rf /tmp/goproxy-vps && \
	apk del curl xz tar

ENTRYPOINT ["/goproxy-vps"]

