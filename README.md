# How to use this gentoo repository

[Local overlays](https://wiki.gentoo.org/wiki/Overlay/Local_overlay) should be managed via `/etc/portage/repos.conf/`.
To enable this overlay create a `/etc/portage/repos.conf/kressh.conf` file:

```
[kressh]
location = /var/db/repos/kressh
sync-type = git
sync-uri = https://github.com/kressh/gentoo-repo.git
```

Afterwards, simply run `emerge --sync kressh`, and Portage should seamlessly make all our ebuilds available.
