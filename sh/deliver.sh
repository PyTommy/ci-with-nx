#!/bin/bash

declare -r ENV="${1:-develop}"
declare -r APP="${2:-api-1}"
declare -r CMD="${3:-build}"
declare -r GIT_HASH=$(git rev-parse --short HEAD)
declare -r TOKYO_REGION_GAR_URL="asia-northeast1-docker.pkg.dev";
declare -r REPO_NAME="ci-with-nx";
declare -r PROJECT_ID="tomitomi-dev";
declare CONTAINER_REPO="${TOKYO_REGION_GAR_URL}/${PROJECT_ID}/${REPO_NAME}";

declare -r SCRIPT_DIR=$(
  cd "$(dirname $0)"
  pwd 
)

declare -r ROOT_DIR=$(
  cd "${SCRIPT_DIR}/.."
  pwd
)

declare -r APP_DIR=$(
  cd "${ROOT_DIR}/apps/${APP}"
  pwd
)

gcloud auth configure-docker ${TOKYO_REGION_GAR_URL} --quiet
url=("${CONTAINER_REPO}/${APP}");

if [[ "$CMD" == "build" ]]; then
  echo "start to build ${APP}";
  docker build \
    -f ${APP_DIR}/Dockerfile \
    --cache-from=${url}:latest \
    -t ${url}:${GIT_HASH} \
    ./
  docker tag ${url}:${GIT_HASH} ${url}:latest
elif [[ "$CMD" == "push" ]]; then
  echo "start to push ${APP}";
  docker push ${url}:${GIT_HASH}
  docker push ${url}:latest
elif  [[ "$CMD" == "deploy" ]]; then
  echo "start to deploy ${APP}";
  gcloud run deploy ${APP} \
    --image=${url}:${GIT_HASH} \
    --region=asia-northeast1 \
    --max-instances=1 \
    --min-instances=0 \
    --platform=managed
else
  echo "invalid parameter specified.";
  exit 1;
fi