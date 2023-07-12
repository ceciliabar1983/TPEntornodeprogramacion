#!/bin/bash

# Verificamos si existe el archivo descargado o se creó en los scripts anteriores; si existe, se descomprime
if [[ -e ./resultado/"imagenes.zip" ]]; then
        sudo unzip ./resultado/"imagenes.zip" -d resultado
        echo "Se descomprimió correctamente."
        sudo rm -r resultado/imagenes.zip
	./menu.sh
        exit 0

else
         echo "El archivo imagenes.zip no existe."
	./menu.sh
	 exit 1
fi





