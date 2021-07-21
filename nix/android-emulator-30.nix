# with import <nixpkgs> {};
# #{androidenv}:

# let 
# emulator = androidenv.emulateApp {
#   name = "android-30";
#   platformVersion = "30";
#   abiVersion = "x86_64"; # armeabi-v7a, mips, x86_64
#   systemImageType = "google_apis_playstore";
# }

#   in 
# emulator
