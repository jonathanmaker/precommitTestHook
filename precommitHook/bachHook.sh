#!/bin/sh

# Lista de archivos que, si son modificados, requieren una actualización en copyright.txt
REQUIRE_UPDATE=("build.gradle" "pom.xml")

# Bandera para rastrear si se requiere actualización
require_update=false

# Revisar si alguno de los archivos especificados fue modificado
for file in "${REQUIRE_UPDATE[@]}"; do
    if git diff --cached --name-only | grep --quiet "$file"; then
        require_update=true
        break
    fi
done

# Si se requiere actualización, asegurarse de que copyright.txt también esté en la lista de modificados
if $require_update; then
    if ! git diff --cached --name-only | grep --quiet "copyright.txt"; then
        echo "ERROR: Debes actualizar copyright.txt ya que modificaste dependencies.gradle o pom.xml"
        exit 1
    fi
fi

# Continuar con el commit si todo está en orden
exit 0
