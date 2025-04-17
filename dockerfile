FROM ubuntu:25.04
WORKDIR /app
RUN apt-get update && apt-get install -y ca-certificates wget unzip
RUN wget https://github.com/kgretzky/evilginx2/releases/download/v3.3.0/evilginx-v3.3.0-linux-64bit.zip
RUN unzip -j evilginx-v3.3.0-linux-64bit.zip
RUN chown -R root:root /app
USER root
RUN chmod +x evilginx
EXPOSE 443
ENTRYPOINT ./evilginx -c /app/config