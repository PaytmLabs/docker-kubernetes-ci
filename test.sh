#!/usr/bin/env bash
set -euo pipefail

readonly ARGOCD_VERSION=2.0.4
readonly HELM2_VERSION=2.17.0
readonly HELM_VERSION=3.5.1
readonly JB_VERSION=0.4.0
readonly JSONNET_VERSION=0.17.0
readonly KUSTOMIZE_VERSION=3.9.4
readonly KUBEVAL_VERSION=0.16.1
readonly PROMETHEUS_VERSION=2.28.0

printf ">>> Checking git is installed...\n"
if ! git --help >/dev/null; then
  echo ">>> git not installed properly."
  exit 1
fi

printf ">>> Checking jq is installed...\n"
if ! jq --help >/dev/null; then
  echo ">>> jq not installed properly."
  exit 1
fi

printf ">>> Checking argocd-util version is %s...\n" "${ARGOCD_VERSION}"
[[ "$(argocd-util version --short)" == "argocd-util: v${ARGOCD_VERSION}+"* ]]

printf ">>> Checking helm version is %s...\n" "${HELM_VERSION}"
[[ "$(helm version --template '{{.Version}}')" == "v${HELM_VERSION}" ]]

printf ">>> Checking helm2 version is %s...\n" "${HELM2_VERSION}"
[[ "$(helm2 version --client --template '{{.Client.SemVer}}')" == "v${HELM2_VERSION}" ]]

printf ">>> Checking jb version is %s...\n" "${JB_VERSION}"
[[ "$(jb --version 2>&1)" == "v${JB_VERSION}" ]]

printf ">>> Checking jsonnet version is %s...\n" "${JSONNET_VERSION}"
[[ "$(jsonnet --version)" == "Jsonnet commandline interpreter v${JSONNET_VERSION}" ]]

printf ">>> Checking jsonnetfmt version is %s...\n" "${JSONNET_VERSION}"
[[ "$(jsonnetfmt --version)" == "Jsonnet reformatter v${JSONNET_VERSION}" ]]

printf ">>> Checking jsonnet-lint version is %s...\n" "${JSONNET_VERSION}"
[[ "$(jsonnet-lint --version)" == "Jsonnet linter v${JSONNET_VERSION}" ]]

printf ">>> Checking kustomize version is %s...\n" "${KUSTOMIZE_VERSION}"
[[ "$(kustomize version)" == *"Version:kustomize/v${KUSTOMIZE_VERSION} "* ]]

printf ">>> Checking kubeval version is %s...\n" "${KUBEVAL_VERSION}"
[[ "$(kubeval --version | head -1)" == "Version: ${KUBEVAL_VERSION}" ]]

printf ">>> Checking promtool version is %s...\n" "${PROMETHEUS_VERSION}"
[[ "$(promtool --version | head -1)" == "promtool, version ${PROMETHEUS_VERSION} (branch:"* ]]
