FROM balenalib/raspberry-pi-debian

RUN apt update -y && apt upgrade -y

ADD engine_3.1.61_armv7.tar.gz /tmp


RUN cd /tmp && \
tar xvf engine_3.1.61_armv7.tar.gz -C ./

RUN cd /tmp/acestream.engine && \
    mv androidfs/system / && \
    mv androidfs/acestream.engine / && \
    mkdir -p /storage && \
    mkdir -p /system/etc && \
    ln -s /etc/resolv.conf /system/etc/resolv.conf && \
    ln -s /etc/hosts /system/etc/hosts && \
    chown -R root:root /system && \
    find /system -type d -exec chmod 755 {} \; && \
    find /system -type f -exec chmod 644 {} \; && \
    chmod 755 /system/bin/* /acestream.engine/python/bin/python

# If you want build image with custom configuration, uncomment next line
# ADD acestream.conf  /acestream.engine/

EXPOSE 8621 6878


CMD "/system/bin/acestream.sh"
