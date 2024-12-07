#!/bin/bash

docker compose up -d --force-recreate
docker compose exec -it ollama pull llama3.2

echo "open-webui may take a few minutes to get ready...."
echo "navigate to http://localhost:3000 after a few minutes"
echo "then set your default model to llama3.2"
