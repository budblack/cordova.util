##############################
# cd ./sub/spa
# yarn
# yarn build
# 
# cd ../..
# rm -rf ./www/*
# mv ./sub/spa/dist/* ./www/
##############################
sudo chmod -R ugo+rw $ANDROID_HOME
cordova platforms rm android 
cordova platforms add android
cordova clean
cordova prepare
cordova build android -release -- --gradleArg=-PcdvBuildMultipleApks=false
jarsigner -verbose -keystore ./net.msign.tool.util.keystore -signedjar $(pwd)/platforms/android/app/build/outputs/apk/release/app-release-signed.apk $(pwd)/platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk net.msign.tool.util.keystore -storepass budblack -keypass budblack
rm $(pwd)/platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk 