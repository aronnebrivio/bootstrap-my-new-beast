FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y \
    sudo \
    git

RUN useradd -rm -G root,sudo -u 1000 -d /home/testuser -p "$(openssl passwd -1 password)" testuser
RUN chown -R testuser:testuser /home/testuser
USER testuser
WORKDIR /home/testuser
