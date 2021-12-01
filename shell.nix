
{ sources ? import ./nix/sources.nix }:



let
  # androidComposition = androidenv.composeAndroidPackages {
  #   toolsVersion = "26.1.1";
  #   platformToolsVersion = "30.0.5";
  #   buildToolsVersions = [ "30.0.3" ];
  #   includeEmulator = true;
  #   emulatorVersion = "30.3.4";
  #   platformVersions = [ "28" "29" "30" ];
  #   includeSources = false;
  #   includeSystemImages = false;
  #   systemImageTypes = [ "google_apis_playstore" ];
  #   abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
  #   cmakeVersions = [ "3.10.2" ];
  #   includeNDK = false;
  #   # includeNDK = true;
  #   # ndkVersions = ["22.0.7026061"];
  #   useGoogleAPIs = false;
  #   useGoogleTVAddOns = false;
  #   includeExtras = [
  #     "extras;google;gcm"
  #   ];
  # };

  pkgs = import sources.nixpkgs { 
    config.android_sdk.accept_license = true;
    config.allowUnfree = true;
  };

  buildToolsVersion = "30.0.3";
  android = pkgs.callPackage ./nix/android.nix {};

in 
pkgs.mkShell rec {
  buildInputs = with pkgs; [
    flutter
    jdk8
    niv
    dart
    # android-studio
    android.androidsdk
    android.platform-tools
    android-tools
    androidStudioPackages.dev

    genymotion

    qemu
    xorg.libX11
    libpulseaudio
    nss
    libGL
    nspr

    git
    gitRepo
    gnupg
    python2
    curl
    procps
    openssl
    gnumake
    nettools
    # For nixos < 19.03, use `androidenv.platformTools`
    # androidenv.androidPkgs_9_0.platform-tools
    jdk
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

#   shellHook = ''
# export PATH="$PATH":"$HOME/.pub-cache/bin"
# '';

  ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";
  ANDROID_SDK_ROOT = "${android.androidsdk}/libexec/android-sdk";
  JAVA_HOME = pkgs.jdk8.home;
  GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${ANDROID_SDK_ROOT}/build-tools/${buildToolsVersion}/aapt2";
  FLUTTER_SDK = pkgs.flutter.unwrapped;
  DART_SDK = "${FLUTTER_SDK}/bin/cache/dart-sdk";

}
