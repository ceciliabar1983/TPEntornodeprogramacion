#!/bin/bash


# Verifica si se han proporcionado las dos URLs solicitadas como argumentos
if [ $# -eq 2 ]; then
#Descargar la imagen comprimida y la suma de verificacion

	sudo wget  -O resultado/"imagenes.zip" $1
 	suma_verificacion_imagenes_generadas=$(sha256sum resultado/imagenes.zip | tr -d " " )
	sudo  wget -O resultado/sumaverificacion.txt $2
 	suma_verificacion_imagenes_descargadas=$(cat resultado/sumaverificacion.txt) 

#Verificamos que coincidan 

	if [[ $suma_verificacion_imagenes_generadas ==  $suma_verificacion_imagenes_descargadas ]]; then
		echo "las sumas de verificacion coinciden"
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
