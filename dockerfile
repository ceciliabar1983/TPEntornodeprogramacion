FROM ubuntu:latest
VOLUME /var/container/TPEntorno/ProyectoEntorno/imagenes
WORKDIR /var/container/TPEntorno/ProyectoEntorno
COPY . .
RUN apt-get update && apt-get install -y wget

CMD [ "bash", "/var/container/TPEntorno/ProyectoEntorno/menu.sh"]

