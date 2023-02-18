
Debian
====================
This directory contains files used to package paprikacoind/paprikacoin-qt
for Debian-based Linux systems. If you compile paprikacoind/paprikacoin-qt yourself, there are some useful files here.

## paprikacoin: URI support ##


paprikacoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install paprikacoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your paprikacoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/paprikacoin128.png` to `/usr/share/pixmaps`

paprikacoin-qt.protocol (KDE)

