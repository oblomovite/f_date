{ sources ? import ./nix/sources.nix }:

let
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
    android-studio
    android.androidsdk
    android.platform-tools
];

  shellHook = ''
export PATH="$PATH":"$HOME/.pub-cache/bin"
'';

  ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";
  ANDROID_SDK_ROOT = "${android.androidsdk}/libexec/android-sdk";
  JAVA_HOME = pkgs.jdk8.home;
  GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${ANDROID_SDK_ROOT}/build-tools/${buildToolsVersion}/aapt2";
  FLUTTER_SDK = pkgs.flutter.unwrapped;
  DART_SDK = "${FLUTTER_SDK}/bin/cache/dart-sdk";

}
