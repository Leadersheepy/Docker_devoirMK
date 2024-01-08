#!/bin/bash

# URL de votre backend
BACKEND_URL="http://localhost:8000"

# Envoyer une requête GET à l'URL de base
response=$(curl --write-out '%{http_code}' --silent --output /dev/null $BACKEND_URL)

# Vérifier si la réponse a un code de statut 200
if [ $response -eq 200 ]; then
    echo "Backend is up and running"
else
    echo "Backend is down. HTTP status code: $response"
fi