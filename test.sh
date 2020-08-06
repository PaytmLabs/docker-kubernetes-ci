#!/usr/bin/env bash
set -euo pipefail

readonly HELM2_VERSION=2.15.2
readonly HELM_VERSION=3.2.2
readonly JSONNET_VERSION=0.16.0
readonly KUBEVAL_VERSION=0.15.0
readonly KUSTOMIZE_VERSION=3.6.1

printf ">>> Checking git is installed...\n"
git --help >/dev/null

printf ">>> Checking helm version is %s...\n" "${HELM_VERSION}"
[[ "$(helm version --template '{{.Version}}')" == "v${HELM_VERSION}" ]]

printf ">>> Checking helm2 version is %s...\n" "${HELM2_VERSION}"
[[ "$(helm2 version --client --template '{{.Client.SemVer}}')" == "v${HELM2_VERSION}" ]]

printf ">>> Checking jsonnet version is %s...\n" "${JSONNET_VERSION}"
[[ "$(jsonnet --version)" == "Jsonnet commandline interpreter v${JSONNET_VERSION}" ]]

printf ">>> Checking jsonnetfmt version is %s...\n" "${JSONNET_VERSION}"
[[ "$(jsonnetfmt --version)" == "Jsonnet reformatter v${JSONNET_VERSION}" ]]

printf ">>> Checking kustomize version is %s...\n" "${KUSTOMIZE_VERSION}"
[[ "$(kustomize version)" == *"Version:kustomize/v${KUSTOMIZE_VERSION} "* ]]

printf ">>> Checking kubeval version is %s...\n" "${KUBEVAL_VERSION}"
[[ "$(kubeval --version | head -1)" == "Version: ${KUBEVAL_VERSION}" ]]
