FROM ubuntu:trusty
MAINTAINER tkhs

ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN echo "Asia/Tokyo\n" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt-get update && apt-get install -y \
        ntp \
        curl \
        libav-tools \
        rtmpdump \
        swftools \
        git \
# http://blog.gopheracademy.com/advent-2014/easy-deployment/
    && mkdir /goroot && curl https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1 \
    && go get -v github.com/tkhs/radicast

ENTRYPOINT ["radicast"]
CMD ["--help"]
