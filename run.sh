#!/bin/bash

function is_running(){
    docker compose logs | grep "Uvicorn running on" &> /dev/null
}

function await_running(){
  try=0
  max_tries=60
  echo "Waiting for open-webui to be ready..."
  while [ $max_tries -gt 0 ]; do
    if is_running; then
      echo "open-webui is ready"
      return 0
    fi
    sleep 1
    try=$((try+1))
  done

  echo "open-webui failed to start"
  exit 1
}

function Main(){
  docker compose up -d --force-recreate
  docker compose exec -it ollama ollama pull llama3.2

  echo "open-webui may take a few minutes to get ready...."
  echo "navigate to http://localhost:3000 after a few minutes"
  echo "then set your default model to llama3.2"

  await_running
}

Main
