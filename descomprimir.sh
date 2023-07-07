#!/bin/bash

# Verificamos si  exista el archivo descargado o creo en los scripts anteriores
if [ -f images.zip ]; then
    unzip images.zip
    echo "Se descomprimio correctamente."

else
    echo "El archivo images.zip no existe."
fi
