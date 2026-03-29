# gost-openwrt

Build `gost` as an OpenWrt `.ipk` package.

## Target

- **OpenWrt:** 22.03.x
- **Architecture:** arm64
- **Current SDK in CI:** 22.03.7 `armsr/armv8`

## Release model

This repository builds on **git tag push**.

If you push tag `v3.1.0`, the workflow will:
1. build package version `3.1.0`
2. download the matching prebuilt Linux arm64 binary from `go-gost/gost` releases
3. repackage it into an OpenWrt `.ipk`
4. upload the resulting package to the GitHub Release for `v3.1.0`

## Notes

- The package version is derived from this repository tag.
- The workflow validates that the same version tag exists upstream in `go-gost/gost`, then selects a Linux arm64 prebuilt asset.
- This repo currently targets **OpenWrt 22.03.x arm64 only**.
