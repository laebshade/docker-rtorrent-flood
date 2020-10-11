#!/bin/sh

mkdir -p /data/torrents
mkdir -p /data/.watch
mkdir -p /data/.session

rm -f /data/.session/rtorrent.lock

if [ ${RTORRENT_SOCK} = "false" ]; then
    sed -i -e 's|^scgi_local.*$|scgi_port = 0.0.0.0:5000|' /home/torrent/.rtorrent.rc
fi

exec su-exec $UID:$GID /bin/s6-svscan /etc/s6.d
