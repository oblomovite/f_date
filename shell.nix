let 
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {
    config.android_sdk.accept_license = true;

  };
  flutterPkgs = (import (builtins.fetchTarball "https://github.com/babariviere/nixpkgs/archive/flutter-testing.tar.gz")  {});
  unstablePkgs    = (import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz")   {});
  # flutter = (import sources.flutter { });

 # flutter = (import (builtins.fetchTarball
    # "https://github.com/babariviere/nixpkgs/archive/flutter-init.tar.gz") {}).flutter; # this will be replaced when merged into NixOS
in 

pkgs.mkShell {
  buildInputs = [
    pkgs.dart
    pkgs.git
    pkgs.jdk
    # nodePackages.firebase-tools
    # sqlite
    pkgs.rubyPackages.cocoapods
    flutterPkgs.flutter
    unstablePkgs.android-studio
  ];

  # flutter pub run build_runner watch

  # export DART_SDK=${pkgs.dart}
  shellHook = ''
    export USE_CCACHE=1
    export ANDROID_JAVA_HOME=${pkgs.jdk.home}
    export ANDROID_HOME=~/Android/Sdk
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    export FLUTTER_SDK=${flutterPkgs.flutter.unwrapped}
  '';

  MY_ENVIRONMENT_VARIABLE = "world";
}
  


