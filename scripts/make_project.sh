#! /bin/bash

NEW_PROJECT_NAME=$1

ROOT_DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "Root Directory : ${ROOT_DIR}"

cd "${ROOT_DIR}"
cd "../src/libFramework"
BASE_PROJECT="$( cd "$( dirname "$0" )" && pwd )"
echo "Base Projct : ${BASE_PROJECT}"

cd "${ROOT_DIR}"
cd "../"

rm -rf "${NEW_PROJECT_NAME}"

cp -rf "${BASE_PROJECT}" "${NEW_PROJECT_NAME}"

cd "${ROOT_DIR}"
cd "../${NEW_PROJECT_NAME}"
NEW_PROJECT="$( cd "$( dirname "$0" )" && pwd )"
echo "New Projct : ${NEW_PROJECT}"

rm -rf "${NEW_PROJECT}/.DS_Store"
rm -rf "${NEW_PROJECT}/build"
rm -rf "${NEW_PROJECT}/libFramework.framework"

mv "${NEW_PROJECT}/libFramework" "${NEW_PROJECT}/${NEW_PROJECT_NAME}"
mv "${NEW_PROJECT}/libFramework.xcodeproj" "${NEW_PROJECT}/${NEW_PROJECT_NAME}.xcodeproj"
mv "${NEW_PROJECT}/${NEW_PROJECT_NAME}.xcodeproj/xcuserdata/jenkins.xcuserdatad/xcschemes/libFramework.xcscheme" "${NEW_PROJECT}/${NEW_PROJECT_NAME}.xcodeproj/xcuserdata/jenkins.xcuserdatad/xcschemes/${NEW_PROJECT_NAME}.xcscheme"
mv "${NEW_PROJECT}/libFramework.xcodeproj" "${NEW_PROJECT}/${NEW_PROJECT_NAME}.xcodeproj"
mv "${NEW_PROJECT}/${NEW_PROJECT_NAME}/libFramework.h" "${NEW_PROJECT}/${NEW_PROJECT_NAME}/${NEW_PROJECT_NAME}.h"

XCODE_PROJECT="${NEW_PROJECT}/${NEW_PROJECT_NAME}.xcodeproj/project.pbxproj"
SCHEMES_FILE="${NEW_PROJECT}/${NEW_PROJECT_NAME}.xcodeproj/xcuserdata/jenkins.xcuserdatad/xcschemes/${NEW_PROJECT_NAME}.xcscheme"
SCHEMES_PLIST_FILE="${NEW_PROJECT}/${NEW_PROJECT_NAME}.xcodeproj/xcuserdata/jenkins.xcuserdatad/xcschemes/xcschememanagement.plist"

sed -i "" "s/libFramework/${NEW_PROJECT_NAME}/g" ${XCODE_PROJECT}
sed -i "" "s/libFramework/${NEW_PROJECT_NAME}/g" ${SCHEMES_FILE}
sed -i "" "s/libFramework/${NEW_PROJECT_NAME}/g" ${SCHEMES_PLIST_FILE}



