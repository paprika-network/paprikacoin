VERSION=1.0.2.0
rm -rf ./release-linux
mkdir release-linux

cp ./src/paprikacoind ./release-linux/
cp ./src/paprikacoin-cli ./release-linux/
cp ./src/qt/paprikacoin-qt ./release-linux/
cp ./PAPRIKACOIN_small.png ./release-linux/

cd ./release-linux/
strip paprikacoind
strip paprikacoin-cli
strip paprikacoin-qt

#==========================================================
# prepare for packaging deb file.

mkdir paprikacoincoin-$VERSION
cd paprikacoincoin-$VERSION
mkdir -p DEBIAN
echo 'Package: paprikacoincoin
Version: '$VERSION'
Section: base 
Priority: optional 
Architecture: all 
Depends:
Maintainer: Paprikacoin
Description: Paprikacoin coin wallet and service.
' > ./DEBIAN/control
mkdir -p ./usr/local/bin/
cp ../paprikacoind ./usr/local/bin/
cp ../paprikacoin-cli ./usr/local/bin/
cp ../paprikacoin-qt ./usr/local/bin/

# prepare for desktop shortcut
mkdir -p ./usr/share/icons/
cp ../PAPRIKACOIN_small.png ./usr/share/icons/
mkdir -p ./usr/share/applications/
echo '
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/usr/local/bin/paprikacoin-qt
Name=paprikacoincoin
Comment= paprikacoin coin wallet
Icon=/usr/share/icons/PAPRIKACOIN_small.png
' > ./usr/share/applications/paprikacoincoin.desktop

cd ../
# build deb file.
dpkg-deb --build paprikacoincoin-$VERSION

#==========================================================
# build rpm package
rm -rf ~/rpmbuild/
mkdir -p ~/rpmbuild/{RPMS,SRPMS,BUILD,SOURCES,SPECS,tmp}

cat <<EOF >~/.rpmmacros
%_topdir   %(echo $HOME)/rpmbuild
%_tmppath  %{_topdir}/tmp
EOF

#prepare for build rpm package.
rm -rf paprikacoincoin-$VERSION
mkdir paprikacoincoin-$VERSION
cd paprikacoincoin-$VERSION

mkdir -p ./usr/bin/
cp ../paprikacoind ./usr/bin/
cp ../paprikacoin-cli ./usr/bin/
cp ../paprikacoin-qt ./usr/bin/

# prepare for desktop shortcut
mkdir -p ./usr/share/icons/
cp ../PAPRIKACOIN_small.png ./usr/share/icons/
mkdir -p ./usr/share/applications/
echo '
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/usr/bin/paprikacoin-qt
Name=paprikacoincoin
Comment= paprikacoin coin wallet
Icon=/usr/share/icons/PAPRIKACOIN_small.png
' > ./usr/share/applications/paprikacoincoin.desktop
cd ../

# make tar ball to source folder.
tar -zcvf paprikacoincoin-$VERSION.tar.gz ./paprikacoincoin-$VERSION
cp paprikacoincoin-$VERSION.tar.gz ~/rpmbuild/SOURCES/

# build rpm package.
cd ~/rpmbuild

cat <<EOF > SPECS/paprikacoincoin.spec
# Don't try fancy stuff like debuginfo, which is useless on binary-only
# packages. Don't strip binary too
# Be sure buildpolicy set to do nothing

Summary: Paprikacoin wallet rpm package
Name: paprikacoincoin
Version: $VERSION
Release: 1
License: MIT
SOURCE0 : %{name}-%{version}.tar.gz
URL: https://www.paprikacoincoin.net/

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
%{summary}

%prep
%setup -q

%build
# Empty section.

%install
rm -rf %{buildroot}
mkdir -p  %{buildroot}

# in builddir
cp -a * %{buildroot}


%clean
rm -rf %{buildroot}


%files
/usr/share/applications/paprikacoincoin.desktop
/usr/share/icons/PAPRIKACOIN_small.png
%defattr(-,root,root,-)
%{_bindir}/*

%changelog
* Tue Aug 24 2021  Paprikacoin Project Team.
- First Build

EOF

rpmbuild -ba SPECS/paprikacoincoin.spec



