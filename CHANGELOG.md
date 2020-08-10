# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
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

[Unreleased]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.3.2...HEAD
[v0.3.2]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.3.1...v0.3.2
[v0.3.1]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.3.0...v0.3.1
[v0.3.0]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/PaytmLabs/docker-kubernetes-ci/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/PaytmLabs/docker-kubernetes-ci/releases/tag/v0.1.0

