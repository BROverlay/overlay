# `BROverlay`
Overlay containing ebuilds made by a small Gentoo community, learning how to do them. The focus is to have general porpuse ebuilds, available for everyone.

## Installing 
Unfortunately, our overlay is not available on `eselect` or `layman` yet, so you have to do a manual installation.

## Manual Installation
Create a file `/etc/portage/repos.conf/broverlay.conf` with the following content:
```
[broverlay]
sync-uri = https://github.com/BROverlay/overlay.git
sync-type = git
sync-depth = 1
location = /var/db/repos/broverlay
```
By the way, don't forget to run `emaint sync -r broverlay`
