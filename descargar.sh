#!/bin/bash


# Verifica si se han proporcionado las dos URLs solicitadas como argumentos
if [ $# -ne 2 ]; then
    echo "Error: Debe proporcionar dos URLs como argumentos (una para la imagen y otra con la  suma de verificación)."
    exit 1
fi

url_imagenes=$1
url_sumaverificacion=$2

#Descargar la imagen comprimida y la suma de verificacion

wget -0  imagenes.zip $url_imagenes
wget -0  sumaverificacion.txt  $url_sumaverificacion

# Verificamos que las  sumas de verificacion coicidan
suma_verificacion_imagenes_generadas=$(sha256sum --check ./imagenes.zip | cut -d " " -f 1)

suma_verificacion_imagenes_descargadas=$ (cat ./sumaverificacion.txt)

if [ $suma_verificacion_imagenes_generadas  -ne  $suma_verificacion_imagenes_descargas] ; then
echo "las sumas de verificacion no coinciden"
exit 1
else
echo "las sumas de verificacion coinciden"
fi
