#!/bin/bash

# Verificar si existe el directorio "fotos" en la ubicación actual
if [ ! -d fotos ]; then
         echo "Error: No se encuentra el directorio 'fotos' o no existe."
   exit 1
fi

# Crear la carpeta "imagenes_procesadas" si no existe
mkdir -p imagenes_procesadas

# Recortar las imágenes al tamaño deseado y moverlas a "imagenes_procesadas"

for archivo in fotos/*; do
  nombre_archivo=$(basename "$archivo")
  nombre_persona="${nombre_archivo%.*}"  # Eliminar extensión del archivo

  # Extraer el nombre y apellido del nombre de archivo
  apellido=$(echo "$nombre_persona" | cut -d' ' -f1)
  nombre=$(echo "$nombre_persona" | cut -d' ' -f2 | cut -d',' -f1)

  # Verificar si el nombre y apellido son válidos
  if [[ $apellido =~ ^[[:upper:]][[:lower:]]+$ && $nombre =~ ^[[:upper:]][[:lower:]]+$ ]]; then
    # Formatear el nombre de la persona para utilizarlo en el archivo de salida
    nombre_persona="${nombre}_${apellido}"

    # Recortar la imagen y guardarla en "imagenes_procesadas"
    sudo convert "$archivo" -resize 512x512 "imagenes_procesadas/${nombre_persona}_recortada.jpg"
  fi
done
