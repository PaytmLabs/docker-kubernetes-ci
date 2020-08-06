# docker-kubernetes-ci 

Docker image to build and validate Kubernetes manifests

```shell
$ docker run --rm paytmcanada/kubernetes-ci:v0.3.1 helm version
version.BuildInfo{Version:"v3.2.2", GitCommit:"a6ea66349ae3015618da4f547677a14b9ecc09b3", GitTreeState:"clean", GoVersion:"go1.13.12"}

$ docker run --rm paytmcanada/kubernetes-ci:v0.3.1 helm2 version --client
Client: &version.Version{SemVer:"v2.15.2", GitCommit:"8dce272473e5f2a7bf58ce79bb5c3691db54c96b", GitTreeState:"clean"}

$ docker run --rm paytmcanada/kubernetes-ci:v0.3.1 jsonnet --version
Jsonnet commandline interpreter v0.16.0

$ docker run --rm paytmcanada/kubernetes-ci:v0.3.1 jsonnetfmt --version
Jsonnet reformatter v0.16.0

$ docker run --rm paytmcanada/kubernetes-ci:v0.3.1 kustomize version
{Version:kustomize/v3.6.1 GitCommit:c97fa946d576eb6ed559f17f2ac43b3b5a8d5dbd BuildDate:2020-05-27T20:47:35Z GoOs:linux GoArch:amd64}

$ docker run --rm paytmcanada/kubernetes-ci:v0.3.1 kubeval --version
Version: 0.15.0
Commit: df50ea7fd4fd202458002a40a6a39ffbb3125bad
Date: 2020-04-14T09:32:29Z
```
