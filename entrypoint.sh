#!/usr/bin/env sh

git config --global user.email ${GITHUB_ACTOR}@users.noreply.github.com
git config --global user.name ${GITHUB_ACTOR}

git clone https://github.com/${CHART_REPOSITORY} helm-charts
git clone https://github.com/${PACKAGE_REPOSITORY} helm-packages

cd /helm-publisher/helm-charts/${CHART_DIRECTORY} || exit
if [ ${COMMIT_ID} ]; then
  git checkout ${COMMIT_ID}
fi

helm repo add stable https://kubernetes-charts.storage.googleapis.com
rm -rvf ./*.lock
helm dependency build
helm package .
mv ./*.tgz /helm-publisher/helm-packages/

cd /helm-publisher/helm-packages || exit
helm repo index . --url ${PACKAGE_URL}

git remote set-url origin https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${PACKAGE_REPOSITORY}
git add .
git commit -m "update chart version ${CHART_VERSION}"
git push
