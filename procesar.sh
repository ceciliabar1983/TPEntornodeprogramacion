#!/bin/bash
cd resultado/fotos
sudo chmod +x *.jpg
echo "Procesando las imágenes..."
sleep 5s

# Recortar las imágenes al tamaño deseado
for foto in *; do
   if [[ "$foto" =~ ^[A-Z][a-z]+$ ]]; then
      sudo convert "$foto" -gravity center -resize 512x512+0+0 -extend 512x512 "$foto"
   fi
done

echo "Las imágenes fueron procesadas exitosamente."
cd ..
./menu.sh
exit 0
else
	echo " No se encuentra el directorio"
cd ..
./menu.sh
exit 1
fi



 

