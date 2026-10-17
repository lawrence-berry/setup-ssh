# setup-ssh

<img src="public/icon.png" alt="" width="96">

Shared SSH client defaults, kept out of `~/.ssh/config` so they can live in version control. Nothing personal here — no keys, hosts, or identities; those stay in your own `~/.ssh/config`.

## Install

```sh
./install.sh
```

Adds an `Include` of this repo's `config` to `~/.ssh/config` (creating it with the right permissions if needed). Re-runnable.

## What it sets

`Host *` defaults: no host-key prompts or `known_hosts` writes, and a keepalive so idle sessions don't drop. Turning off host-key checking globally trades away MITM protection — fine for throwaway LAN/VM hosts, worth narrowing if you SSH to things that matter.
