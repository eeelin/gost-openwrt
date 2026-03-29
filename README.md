# gost-openwrt

OpenWrt package scaffold for building `gost` as an `.ipk` package.

## What is included

- OpenWrt package `Makefile`
- procd init script: `files/etc/init.d/gost`
- UCI config stub: `files/etc/config/gost`

## Current status

This is an initial scaffold PR intended to establish package layout and service wiring.
It is **not yet fully validated** against a specific OpenWrt SDK/image builder release.

## Next steps

- verify the correct upstream tag/versioning for gost v3
- confirm the OpenWrt golang packaging macros against target branch
- add default `/etc/gost/config.yaml` handling strategy
- test build in OpenWrt SDK and refine dependencies/install paths
- optionally add firewall/service docs and example configs
