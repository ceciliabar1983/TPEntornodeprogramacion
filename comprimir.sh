#!/bin/bash

# Generar archivo con la lista de nombres de todas las imágenes
ls fotos > lista_imagenes.txt

# Restringir permisos del archivo lista_imagenes.txt
chmod 644 lista_imagenes.txt

#Generar una lista con los  nombres válidos
sudo touch lista_nombres_validos.txt
sudo chmod 644 lista_nombres_validos.txt
sudo grep -E '^[[:upper:]][[:lower:]]+[[:space:]][[:upper:]][[:lower:]]+$' lista_imagenes.txt > lista_nombres_validos.txt


# Generar archivo con el total de personas cuyo nombre finaliza con la letra 'a'
sudo touch total_personas_comienzan_con_a.txt
sudo chmod 644 total_personas_comienzan_con_a.txt

sudo grep -i 'a\.jpg$' lista_imagenes.txt | wc -l > total_personas_comienzan_con_a.txt

# Crear archivo comprimido que incluya todos los archivos generados y las imágenes procesadas
sudo tar -czvf imagenes_procesadas.tar.gz lista_imagenes.txt lista_nombres_validos.txt total_personas_comienzan_con_a.txt imagenes_procesadas
