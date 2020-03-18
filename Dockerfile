FROM wonderfall/rtorrent-flood:new
HEALTHCHECK --interval=5m --timeout=3s CMD curl --fail http://127.0.0.1:3000/ || exit 1
# Do npm install as part of the image build, so that we can
# chown all of the files at build time instead of run time
RUN cd /usr/flood && npm install
RUN chown -R 1000:1000 /data /home/torrent /tmp /usr/flood /flood-db /etc/s6.d
