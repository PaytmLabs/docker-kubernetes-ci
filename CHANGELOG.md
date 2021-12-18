# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
## [v0.8.0] - 2021-12-17
### Changed
- Upgrade Helm to v3.7.1
- Upgrade Argo CD to v2.2.1

## [v0.7.0] - 2021-08-26
### Changed
- Replace `argocd-util` by `argocd`
- Upgrade Helm to v3.6.0
- Upgrade Kustomize to v4.2.0
- Upgrade Argo CD to v2.1.1

## [v0.6.0] - 2021-07-12
### Added
- Add `argocd-util`
- Add `jq`
- Add `promtool`

## [v0.5.0] - 2021-07-02
### Changed
- Upgrade Helm to v3.5.1
- Upgrade Kubeval to v0.16.1
- Upgrade Kustomize to v3.9.4

## [v0.4.0] - 2020-12-09
### Added
- Add `jsonnet-lint`

### Changed
- Upgrade Jsonnet to v0.17.0
- Upgrade Helm2 to v2.17.0
- Upgrade Helm to v3.4.1
- Upgrade Kustomize to v3.8.1

## [v0.3.2] - 2020-08-10
### Fixed
- jsonnet: Build from `master` branch for [native Go implementation of `std.manifestJsonEx()`](https://github.com/google/go-jsonnet/pull/422)
- kubeval: Build from `master` branch for [long lines over stdin fix](https://github.com/instrumenta/kubeval/pull/220)

## [v0.3.1] - 2020-08-06
### Added
- Add `jb` (jsonnet-bundler)

### Changed
- Accept `jsonnet` version as Docker build argument

## [v0.3.0] - 2020-08-06
### Added
- Add `jsonnet`

## [v0.2.0] - 2020-07-08
### Added
- Add `git`

### Changed
- Move `curl` to build dependencies

## [v0.1.0] - 2020-07-07
### Added
- Initial commit

[Unreleased]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.8.0...HEAD
[v0.8.0]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.7.0...v0.8.0
[v0.7.0]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.6.0...v0.7.0
[v0.6.0]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.3.2...v0.4.0
[v0.3.2]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.3.1...v0.3.2
[v0.3.1]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.3.0...v0.3.1
[v0.3.0]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/PaytmLabs/docker-kubernetes-ci/releases/tag/v0.1.0

