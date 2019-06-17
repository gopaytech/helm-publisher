#!/usr/bin/env bash

git config --global user.email ${GITHUB_ACTOR}@users.noreply.github.com
git config --global user.name ${GITHUB_ACTOR}

git clone https://github.com/${CHART_REPOSITORY} helm-charts
git clone https://github.com/${PACKAGE_REPOSITORY} helm-packages

cd /helm-publisher/helm-charts/${CHART_DIRECTORY}
helm package .
mv ./*.tgz /helm-publisher/helm-packages/

cd /helm-publisher/helm-packages
helm repo index . --url ${PACKAGE_URL}

git remote set-url origin https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${PACKAGE_REPOSITORY}
git add .
git commit -m "update chart version ${CHART_VERSION}"
git push