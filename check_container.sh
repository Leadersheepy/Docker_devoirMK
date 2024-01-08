#!/bin/bash

# Récupérer la liste des conteneurs
containers=$(docker ps -a --format "{{.ID}} {{.Status}}")

# Parcourir chaque conteneur
while IFS= read -r line; do
    # Extraire l'ID et l'état du conteneur
    id=$(echo $line | cut -d' ' -f1)
    status=$(echo $line | cut -d' ' -f2)

    # Vérifier si le conteneur est en cours d'exécution
    if [ "$status" != "Up" ]; then
        echo "Container $id is $status"
    fi
done <<< "$containers"