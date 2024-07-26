#!/bin/bash

# Ruta del archivo de lista de cuentas
LISTA_CUENTAS="/opt/lista.txt"

# Verifica si el archivo de lista existe
if [[ ! -f "$LISTA_CUENTAS" ]]; then
  echo "El archivo $LISTA_CUENTAS no existe."
  exit 1
fi

# Itera sobre cada línea del archivo
while IFS= read -r cuenta; do
  if [[ -n "$cuenta" ]]; then
    echo "Eliminando cuenta: $cuenta..."
    zmprov da "$cuenta"
    if [[ $? -eq 0 ]]; then
      echo "Cuenta $cuenta eliminada exitosamente."
    else
      echo "Error al eliminar la cuenta $cuenta."
    fi
  fi
done < "$LISTA_CUENTAS"

echo "Proceso de eliminación completado."

