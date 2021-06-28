{
  pkgs ? import <nixpkgs> 
    {
      config.android_sdk.accept_license = true;
      config.allowUnfree = true;
    #   overlays = [
    #     (self: super: {
    #       androidPkgs_9_0 = super.androidenv.composeAndroidPackages {
    #         platformVersions = [ "26" ];
    #         abiVersions = [ "x86" "x86_64"];
    #       };
    #     })
    #   ];
    }
}:


pkgs.mkShell {
  # nativeBuildInputs = with pkgs; [
  nativeBuildInputs = with pkgs; [
    git
    androidenv.androidPkgs_9_0.androidsdk
    androidenv.androidPkgs_9_0.emulator
    androidenv.androidPkgs_9_0.platforms
    androidenv.androidPkgs_9_0.platform-tools
    androidenv.androidPkgs_9_0.build-tools
    androidenv.androidPkgs_9_0.system-images
    jdk11
    flutter
    android-studio
    gitRepo
    gnupg
    python2
    curl
    procps
    openssl
    gnumake
    nettools
    schedtool
    utillinux
    m4
    gperf
    perl
    libxml2
    zip
    unzip
    bison
    flex
    lzop
    python3
  ];
  # flutter pub run build_runner watch
  # export FLUTTER_SDK=${pkgs.flutter.unwrapped}

   shellHook = ''
     export USE_CCACHE=1
     export ANDROID_JAVA_HOME=${pkgs.jdk11.home}
     #export ANDROID_HOME=${pkgs.androidenv.androidPkgs_9_0.androidsdk}
     #export ANDROID_SDK_ROOT=${pkgs.androidenv.androidPkgs_9_0.androidsdk}
     export ANDROID_HOME=~/Android/Sdk
     export PATH=$PATH:$ANDROID_HOME/tools/bin
     export PATH=$PATH:$ANDROID_HOME/platform-tools
   '';

  MY_ENVIRONMENT_VARIABLE = "world";
}
  


