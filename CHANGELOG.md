# Changelog

All notable changes to this project will be documented in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).
This changelog is generated automatically based on [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

## [0.5.0](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.4.0...v0.5.0) (2025-08-28)


### ⚠ BREAKING CHANGES

* **deps:** Update Terraform terraform-google-modules/log-export/google to v10 ([#125](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/125))
* **deps:** Update Terraform terraform-google-modules/project-factory/google to v17 ([#124](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/124))

### Features

* **deps:** Update Terraform Google Provider to v6 (major) ([#121](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/121)) ([7824c8e](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/7824c8e1d833d52da89aa49b268fff3bb80a598b))
* **deps:** Update Terraform Google Provider to v7 (major) ([#146](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/146)) ([9eba14a](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/9eba14a20e61a0fbc6c2f9d9cb4113ac95a00bbf))


### Bug Fixes

* **deps:** Update Terraform terraform-google-modules/log-export/google to v10 ([#125](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/125)) ([5c5c587](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/5c5c587892b68e6725027b04fff087d50e493518))
* **deps:** Update Terraform terraform-google-modules/project-factory/google to v17 ([#124](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/124)) ([d0dd42d](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/d0dd42df6154475bbf7d7befc4d6bc8cbb4b500f))

## [0.4.0](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.3.2...v0.4.0) (2024-04-23)


### ⚠ BREAKING CHANGES

* **deps:** Update Terraform terraform-google-modules/log-export/google to v8 ([#101](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/101))

### Bug Fixes

* **deps:** Update Terraform terraform-google-modules/log-export/google to v8 ([#101](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/101)) ([cb8fef1](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/cb8fef19cd091ad7473ddb77131c9be2e5225958))

## [0.3.2](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.3.1...v0.3.2) (2023-12-15)


### Bug Fixes

* **deps:** Update Terraform Google Provider to v5 (major) ([#83](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/83)) ([a3f6212](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/a3f6212f5bc16cb75dbc0c71681fcc1cb539cf06))

## [0.3.1](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.3.0...v0.3.1) (2023-06-16)


### Bug Fixes

* Update int.cloudbuild.yaml to use LR billing ([#66](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/66)) ([107f65c](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/107f65cd676ff10e7aa2521b480c8da2c695016c))

## [0.3.0](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.2.0...v0.3.0) (2023-05-20)


### Features

* updates make target to generate display metadata as well ([#58](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/58)) ([0410217](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/04102170b3a9a67d5deb0eb372344857626c392a))


### Bug Fixes

* address linting errors in output.tf ([#56](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/56)) ([83a461c](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/83a461c66490ee78844758a2bbf91ec6c5bfc4cf))

## [0.2.0](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.1.6...v0.2.0) (2023-05-17)


### Features

* add link to in-console tour of solution ([#50](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/50)) ([c820d20](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/c820d207903be0fb8350b691239a94ab2dff2094))
* adds metadata autogen and validation ([#52](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/52)) ([0d7b83b](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/0d7b83bacbb77f02fe1b971035084c207a6841e0))

## [0.1.6](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.1.5...v0.1.6) (2023-03-13)


### Bug Fixes

* add explict dependency, change job freq ([#45](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/45)) ([759b994](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/759b994636265392dbe8c2e4b4e00f94ab8202a3))
* **deps:** update tf modules ([#41](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/41)) ([904e8bb](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/904e8bbf9a45f65289b5da1c2e060b72c01c5de7))
* enable uniform bucket level access ([#37](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/37)) ([9dfcef8](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/9dfcef81d91b5ac216a28de6fbbd3ca62957c73f))

## [0.1.5](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.1.4...v0.1.5) (2022-11-28)


### Bug Fixes

* simple_example fails to deploy: "Unsupported attrbitute" [#29](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/29) ([4a57d0a](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/4a57d0afef4fd2a86517684b7d485685a7525644))

## [0.1.4](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.1.3...v0.1.4) (2022-11-17)


### Bug Fixes

* Error when deploying multiple times in same project [#25](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/25) ([#26](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/26)) ([ac70578](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/ac70578f23e870feddfecb83709c6e65bd50a3c5))

## [0.1.3](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.1.2...v0.1.3) (2022-10-11)

### Features

* add support for destroy and fix roles ([#22](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/22))

### Bug Fixes

* update doc to point to correct upstream ([#23](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/issues/23)) ([145ca13](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/145ca1368f5e3a0dd9fd7d766d49364a67c54cb5))

## [0.1.2](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.1.1...v0.1.2) (2022-09-04)


### Bug Fixes

* moved Cloud Run to example ([84179a6](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/84179a69b9fa0da061209eba0997c0f692ffd26f))

## [0.1.1](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/compare/v0.1.0...v0.1.1) (2022-09-02)


### Bug Fixes

* data studio url output ([3300e14](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/3300e14bfbbeb5eaef9cb3610847db16b1d45b59))

## 0.1.0 (2022-09-02)


### Bug Fixes

* pin log export module ([7a958f9](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/commit/7a958f9958109086def3ea92fb8bb2951035c734))

## [0.1.0](https://github.com/terraform-google-modules/terraform-google-log-analysis/releases/tag/v0.1.0) - 2022-07-22

### Features

- Initial release

[0.1.0]: https://github.com/terraform-google-modules/terraform-google-log-analysis/releases/tag/v0.1.0
