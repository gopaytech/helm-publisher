# HELM Publisher

Docker images that automate process of publishing Helm chart. It will pull your Helm chart, package it, and publish it to your Helm package repository.

## Usage

1. Create .env file that contains the [configuration](#configuration)
```env
  GITHUB_ACTOR=
  GITHUB_TOKEN=
  CHART_REPOSITORY=
  CHART_DIRECTORY=
  CHART_VERSION=
  COMMIT_ID=
  PACKAGE_REPOSITORY=
  PACKAGE_URL=
```
2. Type this command
```bash
  docker run gopaytech/helm-publisher --env-file=.env
```

## Configuration

Name               | Description                                                     | Required
------------------ | --------------------------------------------------------------- | ---------
GITHUB_ACTOR       | Author of the commit                                            | ✅
GITHUB_TOKEN       | Token of author, generate github token [here](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line) | ✅
CHART_REPOSITORY   | Chart repository name (eg: gate-sso/helm-charts)                | ✅
CHART_DIRECTORY    | Directory of the chart in the repository                        | ❌
CHART_VERSION      | Version of the chart                                            | ✅
COMMIT_ID          | Specific chart commit id to be published                        | ❌
PACKAGE_REPOSITORY | Package repository name (eg: gate-sso/helm-packages)            | ✅
PACKAGE_URL        | Helm package URL (eg: https://gate-sso.github.io/helm-packages) | ✅
