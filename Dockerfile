FROM alpine

ARG HELM2_VERSION=2.15.2
ARG HELM_VERSION=3.2.2
ARG KUBEVAL_VERSION=0.15.0
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

    && curl -sSfL "https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz" \
        | tar -zxvf - -C /usr/local/bin kubeval \

    &&  curl -sSfL "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" \
        | tar -zxvf - -C /usr/local/bin kustomize \

    &&  apk del .builddeps
