FROM golang:1.14-alpine AS go-builder

# https://github.com/google/go-jsonnet/pull/422
ARG JSONNET_VERSION=0.16.1-0.20200808175936-2e346e53e721
# https://github.com/instrumenta/kubeval/pull/220
ARG KUBEVAL_VERSION=0.0.0-20200515185822-7721cbec724c

ENV GO111MODULE='on'

RUN apk add --no-cache git
RUN go get \
        "github.com/google/go-jsonnet/cmd/jsonnet@v${JSONNET_VERSION}" \
        "github.com/google/go-jsonnet/cmd/jsonnetfmt@v${JSONNET_VERSION}" \
        "github.com/instrumenta/kubeval@v${KUBEVAL_VERSION}"

FROM alpine

ARG HELM2_VERSION=2.15.2
ARG HELM_VERSION=3.2.2
ARG JB_VERSION=0.4.0
ARG KUSTOMIZE_VERSION=3.6.1

RUN apk add --no-cache --virtual .builddeps \
       curl \
       tar \
    && apk add --no-cache --virtual .rundeps \
       bash \
       git \
    && curl -sSfL "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" \
        | tar -zxvf - -C /usr/local/bin --strip-component=1 linux-amd64/helm \
    && curl -sSfL "https://get.helm.sh/helm-v${HELM2_VERSION}-linux-amd64.tar.gz" \
        | tar -zxvf - -C /usr/local/bin --transform='s#^linux-amd64/helm$#helm2#' linux-amd64/helm \
    && curl -sSfL "https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${JB_VERSION}/jb-linux-amd64" -o /usr/local/bin/jb \
    && chmod +x /usr/local/bin/jb \
    &&  curl -sSfL "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" \
        | tar -zxvf - -C /usr/local/bin kustomize \
    &&  apk del .builddeps

COPY --from=go-builder /go/bin/jsonnet /go/bin/jsonnetfmt /go/bin/kubeval /usr/local/bin/
