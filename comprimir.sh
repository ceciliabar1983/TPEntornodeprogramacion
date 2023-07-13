#!/bin/bash
cd resultado
if [ -d fotos ]; then
# Generar archivo con la lista de nombres de todas las imágenes
	ls fotos > nombres_imagenes.txt
#Generar una lista con los nombres válidos
	ls fotos | sudo grep -oE '^[A-Z][a-z]+$' > lista_nombres_validos.txt
# Generar archivo con el total de personas cuyo nombre finaliza con la letra 'a'
	ls fotos |sudo grep -c '^[A-Z][a-z][a]$' > total_personas_comienzan_con_a.txt
# Crear archivo comprimido que incluya todos los archivos generados y las imágenes procesadas
	sudo zip -r imagenesdefinitivas.zip fotos nombres_imagenes.txt lista_nombres_validos.txt total_personas_comienzan_con_a.txt
	sudo rm -r fotos nombres_imagenes.txt lista_nombres_validos.txt total_personas_comienzan_con_a.txt
echo "Se comprimieron las imagenes"
cd ..
./menu.sh
exit 0
else
	echo " no se pudieron comprimir las imagenes"
	./menu.sh
exit 1
fi
