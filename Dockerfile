FROM alpine:3.8

ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH
ENV TZ='Asia/Tokyo'

RUN apk add --update --no-cache --virtual=build-dependencies build-base go git zlib-dev curl \
    && apk add --update --no-cache bash ca-certificates tzdata rtmpdump ffmpeg \
    && curl http://www.swftools.org/swftools-0.9.2.tar.gz | tar xz -C /tmp \
    && cd /tmp/swftools-0.9.2 && ./configure && make \
    && mv /tmp/swftools-0.9.2/src/swfextract /usr/local/bin/ \
    && go get -v github.com/tkhs/radicast \
    && apk update \
    && apk del --update build-dependencies \
    && rm -r /tmp/swftools-0.9.2 \
    && rm -r /root/.cache

ENTRYPOINT [ "radicast" ]
CMD [ "--help" ]

