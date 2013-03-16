#!/bin/sh

err () { echo "$1" >&2; exit 1; }

[ -n "$1" ] || err "usage: $0 upstream-branch"
branch=$1

pkgn=$(dpkg-parsechangelog | grep -m1 "^Source:" | cut -d' ' -f2)
ver=$(cat version.txt)
git archive --prefix=$pkgn-$ver/ $branch | xz -9ev > ../${pkgn}_${ver}.orig.tar.xz

