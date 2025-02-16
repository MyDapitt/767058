FROM debian:bookworm

RUN  sed -i "s|deb.debian.org|mirrors.linode.com|g" /etc/apt/sources.list.d/debian.sources && \
     apt-get update && \
     apt-get install -y \
     qemu-system-x86 \
     git \
     wget \
     python3 && \
     apt-get upgrade -y
     
RUN wget -q "https://cors.caliph.my.id/https://archive.org/download/windows-11-24h2-x64/Windows%2011%2024H2%20x64.iso" -O windows.iso && \
     qemu-img create -f qcow2 windows.qcow2 200G

EXPOSE 5900 443 80
CMD ["/bin/bash" "run.sh"]

