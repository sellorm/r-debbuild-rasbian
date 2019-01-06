#!/usr/bin/env bash
set -euo pipefail

VERSION=${1:-default}

if [[ ${VERSION} == "default" ]]; then
  echo "Error: missing directory name"
  echo "Usage: $(basename ${0}) <dir_name>"
  exit 1
fi


if [[ ! -d ${VERSION} ]]; then
  echo "Error: Specified directory does not exist"
  echo "Usage: $(basename ${0}) <dir_name>"
  exit 1
fi

DEB_CURRENT_VERSION=$(./dcf-get-version.py ${VERSION}/DEBIAN/control)
DEB_NEXT_VERSION=$(./dcf-next-version.py ${VERSION}/DEBIAN/control)

sed -i.bak "s/Version: ${DEB_CURRENT_VERSION}/Version: ${DEB_NEXT_VERSION}/" ${VERSION}/DEBIAN/control

dpkg-deb --build ${VERSION} ${VERSION}_${DEB_NEXT_VERSION}_armhf.deb

