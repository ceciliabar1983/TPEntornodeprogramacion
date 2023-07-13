#!/bin/bash
#Obtener la cantidad de imágenes a generar como argumento
if [ $# -ne 1 ]; then   
    echo "Debe pasar la cantidad de imágenes necesarias para generar como argumento"
    exit 1
fi
cant_imagenes=$1
sleep_interval=5
# Creo la carpeta fotos (la elimino por si existe y no está vacía y la vuelvo a generar)
sudo rm -fr fotos 2>/dev/null # el mensaje de error no se muestra por pantalla
sudo mkdir fotos > /dev/null
# URL del archivo de nombres
nombre_url="https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"
archivo_de_nombres="nombres.csv"
# Descargar la lista de nombres
wget -O "$archivo_de_nombres" "$nombre_url"
# Verificar que la descarga se realizó correctamente
if [ $? -ne 0 ]; then   
    echo "Error al descargar el archivo de nombres"
    exit 1
fi

# Generar imágenes
for ((i=1; i<=cant_imagenes; i++)); do
    nombre_imagen=$(sort -R "$archivo_de_nombres" |tail -n 1| cut -d "," -f 1| cut -d " " -f 1 )
    wget -O "./fotos/$nombre_imagen" "https://source.unsplash.com/random/900x700/?person"
    sleep $sleep_interval
done
  
# Comprimir las imagenes
sudo rm -fr imagenes.zip  2>/dev/null # El mensaje de error no se muestra por pantalla
zip -r imagenes.zip fotos
sudo chmod +x imagenes.zip >/dev/null
sudo rm -r fotos >/dev/null
# Calcular la suma de verificación
archivo="imagenes.zip"
suma_verificacion=$(sha256sum "$archivo")
echo "$suma_verificacion" > sumaverificacion.txt
sudo mv imagenes.zip resultado
sudo mv sumaverificacion.txt resultado

