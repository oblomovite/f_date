let 
  pkgs = import <nixpkgs> 
    {
      config.android_sdk.accept_license = true;
      config.allowUnfree = true;
    };

  # flutter = pkgs.flutterPackages.mkFlutter rec {
  #   pname = "flutter";
  #   version = "2.0.3";
  #   patches = pkgs.flutter.patches;
  #   dart = pkgs.fetchzip {
  #     url = "https://storage.googleapis.com/dart-archive/channels/stable/release/2.12.2/sdk/dartsdk-linux-x64-release.zip";
  #     sha256 = "1gg210gf4yif3bl9k19znkndc4c1cd529xwxpi20ykaw3zfxxz2z";
  #   };
  #   src = pkgs.fetchurl {
  #     url = "https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.0.3-stable.tar.xz";
  #     sha256 = "14a63cpkp78rgymmlrppds69jsrdarg33dr43nb7s61r0xfh9icm";
  # 
  #   };
  #   # src = pkgs.fetchFromGitHub {
  #   #   owner = "flutter";
  #   #   repo = "flutter";
  #   #   rev = "fed35b4d9c5dd5c1ea7e82b4ede98430a826391c";
  #   #   sha256 = "0hrpjsd5f7j6ln063ndxvxh1sq347kpbkyqsdnnysz4f1yflvddr";
  #   # };
  # };

in 

pkgs.mkShell {
  buildInputs = [
    pkgs.git
    pkgs.jdk

    # pkgs.flutter
    # nodePackages.firebase-tools
    pkgs.rubyPackages.cocoapods
    pkgs.android-studio
    # flutter
    pkgs.flutter

    # (pkgs.callPackage flutter {})

  ];

  # flutter pub run build_runner watch
  # export FLUTTER_SDK=${pkgs.flutter.unwrapped}
  shellHook = ''
    export USE_CCACHE=1
    export ANDROID_JAVA_HOME=${pkgs.jdk.home}
    export ANDROID_HOME=~/Android/Sdk
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools
  '';

  MY_ENVIRONMENT_VARIABLE = "world";
}
  


