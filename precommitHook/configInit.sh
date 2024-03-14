#!/bin/bash
# setup.sh

# Copiar el pre-commit hook al lugar correcto y darle permisos de ejecución
cp scripts/bachHook.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "Configuración del entorno completada."
