#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

PAPRIKAD=${PAPRIKAD:-$SRCDIR/paprikacoind}
PAPRIKACLI=${PAPRIKACLI:-$SRCDIR/paprikacoin-cli}
PAPRIKATX=${PAPRIKATX:-$SRCDIR/paprikacoin-tx}
PAPRIKAQT=${PAPRIKAQT:-$SRCDIR/qt/paprikacoin-qt}

[ ! -x $PAPRIKAD ] && echo "$PAPRIKAD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
PAPRYVER=($($PAPRIKACLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for paprikacoind if --version-string is not set,
# but has different outcomes for paprikacoin-qt and paprikacoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$PAPRIKAD --version | sed -n '1!p' >> footer.h2m

for cmd in $PAPRIKAD $PAPRIKACLI $PAPRIKATX $PAPRIKAQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${PAPRYVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${PAPRYVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
