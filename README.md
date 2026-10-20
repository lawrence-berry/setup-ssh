<p align="center"><img src="public/icon.png" alt="setup-ssh icon" width="128" height="128"></p>

<h1 align="center">setup-ssh</h1>

<p align="center"><b>Shared SSH client defaults, kept out of ~/.ssh/config: no keys, hosts or identities.</b></p>

<p align="center">
  <img src="https://img.shields.io/badge/macOS-27%20%C2%B7%20daily%20use-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS 27 · daily use" />
  <img src="https://img.shields.io/badge/OpenSSH-7.3%2B-000000?style=for-the-badge&logo=openssh&logoColor=white" alt="OpenSSH 7.3+" />
  <img src="https://img.shields.io/badge/Shell-POSIX%20sh-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white" alt="Shell POSIX sh" />
</p>

<p align="center">
  <a href="https://github.com/lawrence-berry/setup-ssh/actions/workflows/macos.yml"><img src="https://img.shields.io/github/actions/workflow/status/lawrence-berry/setup-ssh/macos.yml?branch=main&style=for-the-badge&logo=apple&logoColor=white&label=macOS%2015" alt="macOS 15 CI status" /></a>
  <a href="https://github.com/lawrence-berry/setup-ssh/actions/workflows/linux.yml"><img src="https://img.shields.io/github/actions/workflow/status/lawrence-berry/setup-ssh/linux.yml?branch=main&style=for-the-badge&logo=ubuntu&logoColor=white&label=Ubuntu%2024.04" alt="Ubuntu 24.04 CI status" /></a>
</p>

Shared SSH client defaults, kept out of `~/.ssh/config` so they can live in version control. Nothing personal is included (no keys, hosts or identities); those stay in `~/.ssh/config`.

## Install

```sh
./install.sh
```

Adds an `Include` of this repo's `config` to `~/.ssh/config` (creating it with the right permissions if needed). Re-runnable.

## What it sets

`Host *` defaults: no host-key prompts or `known_hosts` writes, and a keepalive so idle sessions don't drop. Turning off host-key checking globally trades away MITM protection. That suits throwaway LAN and VM hosts; narrow it to specific hosts when connecting to anything that matters.

## Tests

CI lints `install.sh` with ShellCheck, then runs it twice in a scratch `HOME` on Ubuntu and macOS and checks that `~/.ssh/config` has exactly one `Include` line and is mode `600`.

Part of the [`setup-*`](https://lawrence-berry.github.io/setup) family; on a blank machine, `curl -fsSL https://lawrence-berry.github.io/setup | sh` installs them all (setup-mac and setup-iterm on macOS only).
