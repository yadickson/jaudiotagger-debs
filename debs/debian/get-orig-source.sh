#!/bin/bash

set -ex

PKG="${1}"
VERSION="${2}"
ORIG_TARBALL="../${PKG}_${VERSION}.orig.tar.xz"

[ ! -f "${ORIG_TARBALL}" ] || exit 0

ORIG_FILE="${PKG}-${VERSION}.tar.gz"

rm -rf "${PKG}-${VERSION}"
rm -f "${ORIG_FILE}"

wget -c -t 1 -T 5 "https://bitbucket.org/ijabz/jaudiotagger/get/v${VERSION}.tar.gz" -O "${ORIG_FILE}" || exit 1

tar -xzf "${ORIG_FILE}"

mv ijabz* "${PKG}-${VERSION}"

rm -f "${PKG}-${VERSION}/"*.jar
rm -f "${PKG}-${VERSION}/"*.iml
rm -f "${PKG}-${VERSION}/"*.ipr
rm -f "${PKG}-${VERSION}/"*.iws
rm -f "${PKG}-${VERSION}/"*.bat
rm -f "${PKG}-${VERSION}/"build.*
rm -f "${PKG}-${VERSION}/".ignore
rm -rf "${PKG}-${VERSION}/.hg"*
rm -rf "${PKG}-${VERSION}/"testdata
rm -rf "${PKG}-${VERSION}/"srctest
rm -rf "${PKG}-${VERSION}/"testtagdata
rm -rf "${PKG}-${VERSION}/"trunk
rm -rf "${PKG}-${VERSION}/"www

tar -cJf "${ORIG_TARBALL}" --exclude='Test*.*' --exclude='*.html' --exclude-vcs "${PKG}-${VERSION}" || exit 1

rm -rf "${PKG}-${VERSION}"
rm -f "${ORIG_FILE}"
