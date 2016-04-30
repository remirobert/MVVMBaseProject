#!/bin/bash

echo "___  ____   _ _   ____  ___"
echo "|  \/  | | | | | | |  \/  |"
echo "| .  . | | | | | | | .  . |"
echo "| |\/| | | | | | | | |\/| |"
echo "| |  | \ \_/ | \_/ / |  | |"
echo "\_|__|_/\___/ \___/\_| _|_/__          _           _   "
echo "| ___ \                | ___ \        (_)         | |  "
echo "| |_/ / __ _ ___  ___  | |_/ / __ ___  _  ___  ___| |_ "
echo "| ___ \/ _\ / __|/ _ \\ |  __/ \'__/ _ \\| |/ _ \\/ __| __|"
echo "| |_/ / (_| \__ \  __/ | |  | | | (_) | |  __/ (__| |_ "
echo "\____/ \__,_|___/\___| \_|  |_|  \___/| |\___|\___|\__|"
echo "                                     _/ |              "
echo "                                    |__/               "

if [ $# -ne 1 ]; then
    echo "Please specify the name of the project"
    exit 1
fi

LC_CTYPE=C
LANG=C
OLDNAME="App"
NEWNAME=${1// /_}

echo "rename $OLDNAME to $NEWNAME"
mv "$OLDNAME" "$NEWNAME"
echo " . rename the root folder for the project"
mv "${OLDNAME}Tests" "${NEWNAME}Tests"
echo " . rename the folder for Tests"
mv "${OLDNAME}.xcodeproj" "${NEWNAME}.xcodeproj"
echo " . rename the xcodeproject file"
mv "${NEWNAME}.xcodeproj/xcshareddata/xcschemes/${OLDNAME}.xcscheme" "${NEWNAME}.xcodeproj/xcshareddata/xcschemes/${NEWNAME}.xcscheme" > /dev/null
find . -type f  -print0 | xargs -0 sed -i '' "s/${OLDNAME}/${NEWNAME}/g"
echo "Rename completed"
rm -rfv *.xcworkspace

echo "Installe pods"
pod install

echo "remove setup files"
rm -f install.sh
rm -rf .git

git init
echo "Initialize git."
echo "Operation completed"
