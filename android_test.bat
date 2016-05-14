"C:\Development\Android SDK\platform-tools\adb.exe" connect 192.168.1.11
"C:\Development\Android SDK\platform-tools\adb.exe" shell am force-stop com.fouramgames.zenmathmachine
"C:\Development\Android SDK\platform-tools\adb.exe" shell am start -a android.intent.action.DELETE -d package:com.fouramgames.zenmathmachine

"C:\Development\Android SDK\platform-tools\adb.exe" install export/android/bin/bin/ZenMathMachine-release.apk
"C:\Development\Android SDK\platform-tools\adb.exe" shell am start -n com.fouramgames.zenmathmachine/com.fouramgames.zenmathmachine.MainActivity