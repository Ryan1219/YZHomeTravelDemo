
#!/bin/bash
# Author zhangliangwang

############一些配置
#http://blog.csdn.net/potato512/article/details/52176073

# $1表示传入的第一个参数，启动脚本传入Debug或者Release就可以，本项目已写死Release
CONGRUATION=""

#$2表示SWITCH
#if [ $# != 2 ] ; then
  SWITCH="OFFLINE"
#  SWITCH="ONLINE"
#fi
if [ $# != 2 ] ; then
  SWITCH="OFFLINE"
fi

############基本配置
#BRANCHNAME=1.0.0
SCHEMENAME=Smile

DATE=`date +%Y%m%d`
TIME=`date +%H%M`
SOURCEPATH=$( cd "$( dirname $0 )" && pwd)
build_path=${SOURCEPATH}/build
appdirname=Release-iphoneos
compiled_path=${build_path}/${appdirname}
IPAPATH="${build_path}/${DATE}"
IPANAME="${SCHEMENAME}_${TIME}_${CONGRUATION}.ipa"
BUILDTIME="${TIME}"
SDK="iphoneos"
CODE_SIGN_IDENTITY="iPhone Distribution: Shenzhen Kaixinfang Network Technology Co., Ltd."
PROVISIONING_PROFILE="3ad4bbf3-b4be-4c2b-967d-70b027994795"
PROVISIONING_PROFILE_SPECIFIER="fanggs_distribute";
COMPILELIB=${SOURCEPATH}/ThirdPartyLibs/react-native
AUTOCOMPILE="NO"


############$packageType是启动脚本传入的参数值  0 测试环境， 1正式/预发布环境
if [ $CONGRUATION = debug ]; then
    PACKAGE_TYPE_PROCESSOR="PACKAGE_TYPE=0"
else
    PACKAGE_TYPE_PROCESSOR="PACKAGE_TYPE=1"
fi

############$SWITCH是ONLINE,则PACKAGE_ONLINE=1；OFFLINE,则PACKAGE_ONLINE=0
if [ $SWITCH = ONLINE ]; then
    PREPROCESSOR_DEFINITIONS=${PACKAGE_TYPE_PROCESSOR}" PACKAGE_ONLINE=1"
else
    PREPROCESSOR_DEFINITIONS=${PACKAGE_TYPE_PROCESSOR}" PACKAGE_ONLINE=0"
fi


############根据Debug和Release修改RN库的版本为debug或release
#if [ $CONGRUATION = debug ]; then
#  if [ -f ${COMPILELIB}"/lib/DEBUG.txt" ]; then
#    echo "is the same lib!"
#  else
#    echo "switch lib to debug!"
#    mv ${COMPILELIB}"/lib" ${COMPILELIB}"/lib_release"
#    mv ${COMPILELIB}"/lib_debug" ${COMPILELIB}"/lib"
#  fi
#else
#  if [ -f ${COMPILELIB}"/lib/DEBUG.txt" ]; then
#    echo "switch lib to release!"
#    mv ${COMPILELIB}"/lib" ${COMPILELIB}"/lib_debug"
#    mv ${COMPILELIB}"/lib_release" ${COMPILELIB}"/lib"
#  fi
#fi

#PREPROCESSOR_DEFINITIONS = ${ONLINE_PROCESSOR} 打印一些信息
echo "preprocessor:${PREPROCESSOR_DEFINITIONS}"

#git update
#git checkout $BRANCHNAME
#if [$? -ne 0 ]; then
#	exit 1
#fi

#git pull
#pod update --verbose --no-repo-update
#if [$? -ne 0 ]; then
#	exit 1
#fi

#delete trash files
#if [ -e $IPAPATH/* ]; then
#	mv $IPAPATH/* ~/.trash
#	if [ $? -ne 0 ]; then
#		echo "error: delete trash files failed!!"
#		exit 1
#	fi
#fi

#git log -2

############ 移除
rm -rf ${compiled_path}

xcodebuild clean -configuration Release -quiet  || exit

security unlock-keychain -p 123456 /Users/qfangtong/Library/Keychains/login.keychain

############BUILD
#target 不指定默认使用第一个target
#xcodebuild -project $SCHEMENAME.xcodeproj
xcodebuild -workspace $SCHEMENAME.xcworkspace \
   -configuration Release \
   -scheme $SCHEMENAME \
   -archivePath ${compiled_path}'/'$SCHEMENAME'.xcarchive' \
   BUILD_DIR=${build_path} \
   PRODUCTS_DIR="${compiled_path}" \
   CONFIGURATION_BUILD_DIR="${compiled_path}" \
   CODE_SIGN_IDENTITY="${CODE_SIGN_IDENTITY}" \
   PROVISIONING_PROFILE="${PROVISIONING_PROFILE}" \
   GCC_PREPROCESSOR_DEFINITIONS="${PREPROCESSOR_DEFINITIONS}" \
   archive


############判断编译结果
if test $? -eq 0
then
echo "~~~~~~~~~~~~~~~~~~~编译成功~~~~~~~~~~~~~~~~~~~"
else
echo "~~~~~~~~~~~~~~~~~~~编译失败~~~~~~~~~~~~~~~~~~~"
exit 1
fi

############重置Build版本号
app_infoplist_path=${compiled_path}/${SCHEMENAME}.app/Info.plist

#release 才自动加版本build号
#8.3
#if [ $CONGRUATION = release ]; then
#  buildnum=$(/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" "$app_infoplist_path")
#  buildnum=$(($buildnum + 1))
#  echo "-- Build number updated to $buildnum --"
#  /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildnum" "$app_infoplist_path"
#fi;

############创建文件夹
dis_path=${build_path}/${DATE}
if [ -d "$dis_path" ]; then
    echo ""
else 
    mkdir -pv ${dis_path}
  echo "创建${DATE}目录成功"
fi

echo "~~~~~~~~~~~~~~~~~~~开始打包~~~~~~~~~~~~~~~~~~~"
#xcrun打包
#xcrun -sdk iphoneos PackageApplication \
#        -v ${compiled_path}/${SCHEMENAME}.app \
#        -o ${IPAPATH}/${IPANAME}
############打包
xcodebuild -exportArchive \
-archivePath $compiled_path'/'$SCHEMENAME'.xcarchive' \
-exportPath ${IPAPATH}/${BUILDTIME}/ \
-exportOptionsPlist "${SOURCEPATH}/exportOptions.plist" \
-allowProvisioningUpdates

#-exportProvisioningProfile "${PROVISIONING_PROFILE_SPECIFIER}" \
if [ $AUTOCOMPILE = NO ]; then
if [ -e ${IPAPATH}/${BUILDTIME} ]; then
  if [ $CONGRUATION = release ]; then
    cp -r ${compiled_path}/${SCHEMENAME}.xcarchive  ${IPAPATH}/${BUILDTIME}/
  fi
  echo "----------------------------------- "
  echo "Build success!"
  echo "----------------------------------- "
  open ${IPAPATH}
else
  echo "----------------------------------- "
  echo "error : Build IPA Failed!!"
  echo "----------------------------------- "
fi
else
  echo "----------------------------------- "
  echo "Auto Build success!"
  echo "----------------------------------- "
fi


