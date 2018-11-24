cordova clean
cordova platform rm android && cordova platform add android
cordova build android -- --gradleArg=-PcdvBuildMultipleApks=false
