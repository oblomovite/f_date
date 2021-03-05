let pkgs = import <nixpkgs> { };
in pkgs.mkShell {
  buildInputs = with pkgs; [
    android-studio
    flutter
    git
    jdk
    nodejs-14_x
    # nodePackages.firebase-tools
    sqlite
    flutter-beta
    # dart_dev
    rubyPackages.cocoapods
  ];


  # export DART_SDK=${pkgs.dart_dev}
  shellHook = ''
    export USE_CCACHE=1
    export ANDROID_JAVA_HOME=${pkgs.jdk.home}
    export ANDROID_HOME=~/Android/Sdk
    export FLUTTER_SDK=${pkgs.flutter-beta.unwrapped}
    flutter pub run build_runner watch
  '';
}
