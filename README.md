# `vulnmap-iac-rules` SDK
---

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/khulnasoft-lab/vulnmap-iac-rules/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/khulnasoft-lab/vulnmap-iac-rules/tree/main)
[![Shellspec Tests](https://github.com/khulnasoft-lab/vulnmap-iac-rules/actions/workflows/main.yml/badge.svg)](https://github.com/khulnasoft-lab/vulnmap-iac-rules/actions/workflows/main.yml)
[![Contract Tests](https://github.com/khulnasoft-lab/vulnmap-iac-rules/actions/workflows/contract.yml/badge.svg)](https://github.com/khulnasoft-lab/vulnmap-iac-rules/actions/workflows/contract.yml)
[![Registries Tests](https://github.com/khulnasoft-lab/vulnmap-iac-rules/actions/workflows/registries.yml/badge.svg)](https://github.com/khulnasoft-lab/vulnmap-iac-rules/actions/workflows/registries.yml)
[![Golang Version](https://img.shields.io/github/go-mod/go-version/khulnasoft-lab/vulnmap-iac-rules)](https://github.com/khulnasoft-lab/vulnmap-iac-rules)

[![Latest release version](https://img.shields.io/github/v/release/khulnasoft-lab/vulnmap-iac-rules)](https://github.com/khulnasoft-lab/vulnmap-iac-rules)
[![Latest release date](https://img.shields.io/github/release-date/khulnasoft-lab/vulnmap-iac-rules)](https://github.com/khulnasoft-lab/vulnmap-iac-rules)

`vulnmap-iac-rules` is a Golang SDK that provides flags for writing, debugging, testing, bundling, and distributing custom rules for the [Vulnmap IaC CLI](https://github.com/khulnasoft-lab/vulnmap/).

---

# About
The SDK is a tool for writing, debugging, testing, and bundling custom rules for [Vulnmap Infrastructure as Code](https://vulnmap.khulnasoft.com/product/infrastructure-as-code-security/). See our [Custom Rules documentation](https://docs.vulnmap.khulnasoft.com/products/vulnmap-infrastructure-as-code/custom-rules) to learn more.

<!---
This should be generated automatically from the UML code. We need to specify the branch name though, and this can not happen while we are in main. We need to get the branch name first if we continue using two branches. For now, we can use the rendered image instead.

![system overview](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.github.com/khulnasoft-lab/vulnmap-iac-rules/main/assets/overview-activity-swimlanes.puml)
-->
![image](https://user-images.githubusercontent.com/6989529/139833924-da0f79c7-997b-4510-a6e9-f40f39b28482.png)


# Install
The SDK can be installed through multiple channels.

## Install with npm or Yarn

[vulnmap-iac-rules available as an npm package](https://www.npmjs.com/package/vulnmap-iac-rules). If you have Node.js installed locally, you can install it by running:

```bash
npm install vulnmap-iac-rules@latest -g
```

or if you are using Yarn:

```bash
yarn global add vulnmap-iac-rules
```

## Install with Docker

[vulnmap-iac-rules available as a docker image](https://hub.docker.com/r/khulnasoft-lab/vulnmap-iac-rules). If you have Docker installed locally, you can install it by running:

```bash
docker pull khulnasoft-lab/vulnmap-iac-rules:latest
```

You can then run the container like so:
```bash
docker run --rm -v $(pwd):/app khulnasoft-lab/vulnmap-iac-rules --help
```

## More installation methods

<details>
  <summary>Standalone executables (macOS, Linux, Windows)</summary>

### Standalone executables

Use [GitHub Releases](https://github.com/khulnasoft-lab/vulnmap-iac-rules/releases) to download a standalone executable of Vulnmap CLI for your platform.

For example, to download and run the latest SDK on macOS, you could run:

```bash
wget https://github.com/khulnasoft-lab/vulnmap-iac-rules/releases/download/v0.1.0/vulnmap-iac-rules_0.1.0_Darwin_x86_64.tar.gz
chmod +x ./vulnmap-iac-rules
mv ./vulnmap-iac-rules /usr/local/bin/
```

Drawback of this method is, that you will have to manually keep the SDK up to date.

</details>

<details>
  <summary>Install with Homebrew (macOS, Linux)</summary>

### Homebrew

Install the SDK from [Vulnmap tap](https://github.com/khulnasoft-lab/homebrew-tap) with [Homebrew](https://brew.sh) by running:

```bash
brew tap vulnmap/tap
brew install vulnmap-iac-rules
```

</details>

<details>
  <summary>Scoop (Windows)</summary>

### Scoop

Install the SDK from our [Vulnmap bucket](https://github.com/khulnasoft-lab/scoop-vulnmap) with [Scoop](https://scoop.sh) on Windows:

```
scoop bucket add vulnmap https://github.com/khulnasoft-lab/scoop-vulnmap
scoop install vulnmap-iac-rules
```

</details>

---

# Getting started with vulnmap-iac-rules

Once you installed the `vulnmap-iac-rules` SDK, you can verify it's working by running

```bash
vulnmap-iac-rules --help
```

For more help, read the documentation about [Vulnmap Infrastructure as Code](https://docs.vulnmap.khulnasoft.com/vulnmap-infrastructure-as-code).

# Getting support

We recommend reaching out via the [support@khulnasoft.com](mailto:support@khulnasoft.com) email whenever you need help with the SDK or Vulnmap in general.


* See [DEVELOPMENT.md](DEVELOPMENT.md) for how to setup the environment, add a new command, run the code locally, and run the tests.
* See [RELEASE.md](RELEASE.md) for how to release a new version of the SDK.

---

# Contributing

This project is open source but we don't encourage outside contributors.
