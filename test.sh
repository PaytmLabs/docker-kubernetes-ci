#!/usr/bin/env bash
set -euo pipefail

readonly ARGOCD_VERSION=2.3.0
readonly HELM2_VERSION=2.17.0
readonly HELM_VERSION=3.8.0
readonly JB_VERSION=0.4.0
readonly JSONNET_VERSION=0.18.0
readonly KUSTOMIZE_VERSION=4.5.5
readonly KUBEVAL_VERSION=0.16.1
readonly PROMETHEUS_VERSION=2.33.4

printf ">>> Checking bash is installed...\n"
if ! bash --help >/dev/null; then
  echo ">>> bash not installed properly."
  exit 1
fi

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

printf ">>> Checking ssh client is installed...\n"
if ! ssh -V 2>/dev/null; then
  echo ">>> ssh client not installed properly."
  exit 1
fi

printf ">>> Checking argocd version is %s...\n" "${ARGOCD_VERSION}"
[[ "$(argocd version --client --short)" == "argocd: v${ARGOCD_VERSION}+"* ]]

printf ">>> Checking helm version is %s...\n" "${HELM_VERSION}"
[[ "$(helm version --template '{{.Version}}')" == "v${HELM_VERSION}" ]]

printf ">>> Checking helm2 version is %s...\n" "${HELM2_VERSION}"
[[ "$(helm2 version --client --template '{{.Client.SemVer}}')" == "v${HELM2_VERSION}" ]]

printf ">>> Checking jb version is %s...\n" "${JB_VERSION}"
[[ "$(jb --version 2>&1)" == "v${JB_VERSION}" ]]

printf ">>> Checking jsonnet version is %s...\n" "${JSONNET_VERSION}"
[[ "$(jsonnet --version)" == "Jsonnet commandline interpreter (Go implementation) v${JSONNET_VERSION}" ]]

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
