#!/bin/bash

IFS=$'\n'

source ./build_env.sh

CURDIR=`pwd`
cd "$CURDIR"

if [ -f "aeneas-mac-installer-packages/python-$PYTHON_VER.pkg" ]; then
        BUILDTMP="$(mktemp -d "$TMPDIR"/python.build.XXXXXXXX)"
	pkgutil --expand-full aeneas-mac-installer-packages/python-$PYTHON_VER.pkg $BUILDTMP/python-$PYTHON_VER.pkg
        BUILDTMP="$BUILDTMP/python-$PYTHON_VER.pkg"
	cd "$BUILDTMP"
	for file in `find $BUILDTMP/Payload -type f | perl -lne 'print if -B'`; do
		codesign -s "Developer ID Application" -v --force --entitlements "$CURDIR/entitlements.plist" --deep --options runtime "$file"
	done
	codesign -s "Developer ID Application" -v --force --entitlements "$CURDIR/entitlements.plist" --deep --options runtime Payload/Library/Frameworks/Python.framework/Versions/3.9/Python
	cd "$CURDIR"
	pkgbuild --prior aeneas-mac-installer-packages/python-$PYTHON_VER.pkg --root "$BUILDTMP/Payload" --scripts "$BUILDTMP/Scripts" "python-$PYTHON_VER.pkg"
        [ $? = 0 ] || exit 1
	productsign --timestamp --sign "Developer ID Installer" python-$PYTHON_VER.pkg aeneas-mac-installer-packages/python-$PYTHON_VER.pkg
        rm -rf $BUILDTMP
else
        echo "Found python-$PYTHON_VER.pkg"
fi

cd $CURDIR

#echo -e "\n\nNow run build_installer.sh\n\n"

exit 0
