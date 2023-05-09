# `BROverlay`
Overlay containing ebuilds made by a small Gentoo community, learning how to do them. The focus is to have general-purpose ebuilds, available to everyone.

## Installing 
This overlay can be installed both manually or using overlay managers, such as
`eselect-repository`. Don't forget to `emaint sync -a` or `emerge --sync`
after doing any installation procedure below.

### Using `eselect-repository`

```
eselect repository enable broverlay
```

### Using `layman`

```
layman -L
layman -a broverlay
```

### Manual Installation
Create a file `/etc/portage/repos.conf/broverlay.conf` with the following content:
```
[broverlay]
sync-uri = https://github.com/BROverlay/overlay.git
sync-type = git
sync-depth = 1
location = /var/db/repos/broverlay
```
By the way, don't forget to run `emaint sync -r broverlay`

## Contributing
Please follow the guidelines below when submitting a pull request:

* Use `pkgdev` to create and verify commits;
* Commits must be signed (preferably following [GLEP 63][glep63]);
 
Also, use the following name convention for commits in the overlay:

* To add a package: `category/package: +`;
* To remove a package: `category/package: -`;
* To bump/update a package: `category/package: New version`;
* To change something else: `category/package: What changed`;

## Thanks to
* You, for using the overlay
* [GentooBR Overlay][gentoobr], this README was based on their work.

[glep63]: https://www.gentoo.org/glep/glep-0063.html
[gentoobr]: https://github.com/gentoobr/
