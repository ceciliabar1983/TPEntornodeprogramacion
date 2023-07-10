#!/bin/bash
# Obtener la cantidad de imágenes a generar como argumento
                                                                                                 

if [ $# -ne 1 ]; then 
    echo "Debe pasar la cantidad de imágenes necesarias para generar como argumento"
    exit 1
fi

cant_imagenes=$1
sleep_interval=5

# Creo la carpeta fotos (la elimino por si existe y no está vacía y la vuelvo a generar)
sudo rm -fr fotos 2>>/dev/null # el mensaje de error no se muestra por pantalla
sudo mkdir fotos > /dev/null

# URL del archivo de nombres
nombre_url="https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"
archivo_de_nombres="names.csv"

# Descargar la lista de nombres
wget -O "$archivo_de_nombres" "$nombre_url"

# Verificar que la descarga se realizó correctamente
if [ $? -ne 0 ]; then
    echo "Error al descargar el archivo de nombres"
    exit 1
fi

# Generar y comprimir las imágenes
for (( i=1; i<=cant_imagenes; i++ )); do
    nombre_imagen=$(sort -R "$archivo_de_nombres" | head -n 1).jpg #ordeno aleatoriamente las líneas del archivo y toma la primera línea
    wget -O "./fotos/$nombre_imagen" "https://source.unsplash.com/random/900x700/?person" #descargo la imagen y la guardo
    sleep $sleep_interval     
done

imagenes_zip="imagenes.zip"


# Comprimir las imágenes

zip -r "$imagenes_zip" ./fotos/*.jpg


#Calcular la suma de verificacion
archivo="imagenes.zip"
suma_verificacion=$(sha256sum "$archivo")
echo "$suma_verificacion" > sumaverificacion.txt




 
#sudo find . -maxdepth 1 -type f -name '*.jpg' -exec sha256sum {} \; > "$sumaverificacion_archivo"
