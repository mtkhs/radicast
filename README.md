# フォーク版の変更点など

* forked from [soh335/radicast](https://github.com/soh335/radicast)
* こちらを参考に変更点を取り込み：https://omiso46.blogspot.com/2018/05/raspberrypi-radiko-podcast_23.html
* Docker イメージを Alpine 化 (x86_64)
* partial key の取得方法の変更に伴う修正 from [kojisano/radicast](https://github.com/kojisano/radicast)
* rtmpdump と Flash の対応を削除して HLS 配信の録音に対応
* [Docker Hub](https://hub.docker.com/r/mtkhs/radicast/)

# radicast

* record radiko
* serve rss for podcast

## REQUIRE

* ffmpeg
* or docker (see docker section)

## INSTALL

```
$ go get github.com/mtkhs/radicast
```

## USAGE

### SETUP CONFIG.JSON

```
$ radicast --setup > config.json
```

### EDIT CONFIG.JSON

```
$ vim config.json
$ cat config.json

{
  "FMT": [
    "0 0 17 * * *"
  ]
}
```

cron specification is [here](https://godoc.org/github.com/robfig/cron#hdr-CRON_Expression_Format)

### LAUNCH

```
$ radicast
$ curl 127.0.0.1:3355/rss # podcast rss
```

### RELOAD CONFIG.JSON

* reload config when receive HUP signal

## DOCKER

```
$ mkdir workspace
$ cd workspace
$ docker pull mtkhs/radicast
$ docker run --rm mtkhs/radicast:latest --setup > config.json
$ docker run --rm -p 3355:3355 -v `pwd`:/workspace mtkhs/radicast:latest --config /workspace/config.json --output /workspace/output
```

* [docker-hub](https://hub.docker.com/r/mtkhs/radicast/)

## SEE ALSO

* [ripdiko](https://github.com/miyagawa/ripdiko)
* [rec_radiko.sh](https://gist.github.com/matchy2/3956266)

## LICENSE

* MIT
