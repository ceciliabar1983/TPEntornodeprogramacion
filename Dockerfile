#Imagen de Ubuntu
FROM ubuntu

VOLUME /var/container/TPEntorno/ProyectoEntorno/resultado

#Instalamos los programas necesarios para la ejecucion

RUN apt-get update && apt-get install -y git wget zip imagemagick

#Agregamos los scripts y la carpeta resultado

ADD menu.sh /var/container/TPEntorno/ProyectoEntorno/menu.sh
ADD generar.sh /var/container/TPEntorno/ProyectoEntorno/generar.sh
ADD descargar.sh /var/container/TPEntorno/ProyectoEntorno/descargar.sh
ADD descomprimir.sh /var/container/TPEntorno/ProyectoEntorno/descomprimir.sh
ADD procesar.sh /var/container/TPEntorno/ProyectoEntorno/procesar.sh
ADD comprimir.sh /var/container/TPEntorno/ProyectoEntorno/comprimir.sh
ADD nombres.csv /var/container/TPEntorno/ProyectoEntorno/nombres.csv
ADD resultado /var/container/TPEntorno/ProyectoEntorno/resultado

#Cambiamos la ubicacion de trabajo del Proyecto

WORKDIR /var/container/TPEntorno/ProyectoEntorno/resultado
#Ejecutamos el menu.sh
CMD [ "bash", "/var/container/TPEntorno/ProyectoEntorno/menu.sh"]
