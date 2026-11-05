#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$HOME/.local/bin"
curl -fLsS https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 -o "$HOME/.local/bin/minikube"
chmod +x "$HOME/.local/bin/minikube"
export PATH="$HOME/.local/bin:$PATH"
minikube start --driver=docker --cpus=2 --memory=1800mb
minikube kubectl -- get nodes
minikube kubectl -- config current-context
