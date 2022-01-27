FROM golang:1.14-alpine AS go-builder

# https://github.com/google/go-jsonnet/pull/488
ARG JSONNET_VERSION=0.17.1-0.20210701111051-51daeb3229e4

ENV GO111MODULE='on'

SHELL ["/bin/ash", "-euo", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN apk add --no-cache git \
    && go get \
        "github.com/google/go-jsonnet/cmd/jsonnet-lint@v${JSONNET_VERSION}"

FROM alpine:3

ARG ARGOCD_VERSION=2.2.1
ARG HELM2_VERSION=2.17.0
ARG HELM_VERSION=3.7.1
ARG JB_VERSION=0.4.0
ARG JSONNET_VERSION=0.17.0
ARG KUBEVAL_VERSION=0.16.1
ARG KUSTOMIZE_VERSION=4.2.0
ARG PROMETHEUS_VERSION=2.28.0

LABEL \
  org.opencontainers.image.source="https://github.com/PaytmLabs/docker-kubernetes-ci" \
  org.opencontainers.image.url="https://github.com/PaytmLabs/docker-kubernetes-ci" \
  org.opencontainers.image.licenses="MIT"

SHELL ["/bin/ash", "-euo", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN apk add --no-cache --virtual .builddeps \
       curl \
       tar \
    && apk add --no-cache --virtual .rundeps \
       bash \
       git \
       jq \
       openssh-client \
    && curl -sSfL "https://github.com/argoproj/argo-cd/releases/download/v${ARGOCD_VERSION}/argocd-linux-amd64" -o /usr/local/bin/argocd \
    && chmod +x /usr/local/bin/argocd \
    && curl -sSfL "https://github.com/google/go-jsonnet/releases/download/v${JSONNET_VERSION}/go-jsonnet_${JSONNET_VERSION}_Linux_x86_64.tar.gz" \
        | tar -zxvf - -C /usr/local/bin jsonnet jsonnetfmt \
    && curl -sSfL "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" \
        | tar -zxvf - -C /usr/local/bin --strip-component=1 linux-amd64/helm \
    && curl -sSfL "https://get.helm.sh/helm-v${HELM2_VERSION}-linux-amd64.tar.gz" \
        | tar -zxvf - -C /usr/local/bin --transform='s#^linux-amd64/helm$#helm2#' linux-amd64/helm \
    && curl -sSfL "https://github.com/instrumenta/kubeval/releases/download/v${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz" \
        | tar -zxvf - -C /usr/local/bin kubeval \
    && curl -sSfL "https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${JB_VERSION}/jb-linux-amd64" -o /usr/local/bin/jb \
    && chmod +x /usr/local/bin/jb \
    &&  curl -sSfL "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" \
        | tar -zxvf - -C /usr/local/bin kustomize \
    && curl -sSfL "https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz" \
        | tar -zxvf - -C /usr/local/bin --strip-component=1 "prometheus-${PROMETHEUS_VERSION}.linux-amd64/promtool" \
    &&  apk del .builddeps

COPY --from=go-builder /go/bin/jsonnet-lint /usr/local/bin/
