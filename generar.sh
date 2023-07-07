#!/bin/bash

# Obtener la cantidad de imágenes a generar como argumento
if [ $# -ne 1 ]; then
	echo "Debe la pasar la cantidad de imagenes  necesarias para  generar como argumento"
	exit 1
fi

cant_imagenes=$1
sleep_interval=5

# Lista de nombres de personas
nombre_url="https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"
archivo_de_nombres="names.csv"

# Descargar la lista de nombres
wget -O "archivo_de_nombres" "$nombre_url"


# Generar y comprimir las imágenes
for ((i=1; i<=cant_imagenes; i++)); do
    nombre=$(sort -R "$archivo_de_nombres" | head -n 1)
    nombre_imagen=$(echo "$nombre" | tr ' ' '_' | tr '[:upper:]' '[:lower:]').jpg
    wget -O "$nombre_imagen" "https://source.unsplash.com/random/900x700/?person"
    sleep $sleep_interval	
done

# Generar el archivo con la suma de verificación

sumaverificacion_archivo="sumaverificacion.txt"
find . -maxdepth 1 -type f -name '*.jpg' -exec sha256sum {} \; > "$sumaverificacion_archivo"

# Comprimir las imágenes
zip -r images.zip *.jpg "$sumaverificacion_archivo"


