#!/bin/bash

# Verificamos si existe el archivo descargado o se creó en los scripts anteriores; si existe, se descomprime
if [ -f imagenes.zip ]; then
        mkdir -p /var/container/TPEntorno/ProyectoEntorno/imagenes_descomprimidas
        unzip imagenes.zip -d /var/container/TPEntorno/ProyectoEntorno/imagenes_descomprimidas

        echo "Se descomprimió correctamente."

else
         echo "El archivo imagenes.zip no existe."
fi





