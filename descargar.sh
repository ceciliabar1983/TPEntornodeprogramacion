#!/bin/bash
url_imagenes=$1
url_sumaverificacion=$2

# Verifica si se han proporcionado las dos URLs solicitadas como argumentos
if [ $# -eq 2 ]; then
#Descargar la imagen comprimida y la suma de verificacion

	wget $url_imagenes  -O resultado/"imagenes.zip"
	wget -O resultado/sumaverificacion.txt  $url_sumaverificacion
 
   	# Verificamos las  suma de verificacion coicidan
	suma_verificacion_imagenes_generadas=$(sha256sum resultado/imagenes.zip | cut -d " " -f 1)

	suma_verificacion_imagenes_descargadas=$(cat resultado/sumaverificacion.txt) 

#Verificamos que coincidan 

	if [[ $suma_verificacion_imagenes_generadas =~  $suma_verificacion_imagenes_descargadas ]]; then
	echo "las sumas de verificacion no coinciden"
	./menu.sh
	exit 0
	else
	echo "las sumas de verificacion coinciden"
	./menu.sh
	exit 1
	fi
else
	echo " verifique los parametros ingresados"
	./menu.sh
	exit 2
fi
