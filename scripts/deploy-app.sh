#!/usr/bin/env bash
set -euo pipefail
export PATH="$HOME/.local/bin:$PATH"
cd "$HOME/vle45/vle5"
docker build -t devops-lab-app:lab ./app
docker run -d --name vle5-smoke -p 8080:80 devops-lab-app:lab
curl --retry 10 --retry-connrefused --retry-delay 2 --fail http://localhost:8080
minikube image load devops-lab-app:lab
minikube kubectl -- apply -f k8s
minikube kubectl -- rollout status deployment/devops-app --timeout=180s
minikube kubectl -- get pods,services -o wide
curl --fail "$(minikube service devops-service --url)"
