{ androidenv }:

let 
#  buildToolsVersion = "30.0.3";

  android = androidenv.composeAndroidPackages {
    # toolsVersion = "26.1.1";
    #platformToolsVersion = "30.0.5";
    # buildToolsVersions = [ buildToolsVersion ];
    # emulatorVersion = "30.3.4";
    platformVersions = [ "29" "30"];
    includeSources = true;
    includeSystemImages = true;
    # systemImageTypes = [ ];
    abiVersions = ["x86_64"];
    # cmakeVersions = [ "3.10.2" ];
    # includeNDK = true;
    # ndkVersions = ["22.0.7026061"];
    # useGoogleAPIs = true;
    # useGoogleTVAddOns = false;
#    extraLicenses = [
      # Already accepted for you with the global accept_license = true or
      # licenseAccepted = true on androidenv.
      # "android-sdk-license"

      # These aren't, but are useful for more uncommon setups.
      # "android-sdk-preview-license"
      # "android-googletv-license"
      # "android-sdk-arm-dbt-license"
      # "google-gdk-license"
      # "intel-android-extra-license"
      # "intel-android-sysimage-license"
      # "mips-android-sysimage-license"
#    ];
    # includeExtras = [
    #   "extras;google;gcm"
    # ];
  };
  androidSdk = android.androidsdk;
  androidPlatformTools = android.platform-tools;

in 

android



  # let 
  #   # Declaration of versions for everything. This is useful since these
  #   # versions may be used in multiple places in this Nix expression.

  #   android = {
  #     versions = {
  #       tools = "26.1.1";
  #       platformTools = "30.0.5";
  #       #buildTools = "30.0.2";
  #       buildTools = "30.0.3";
  #       ndk = [
  #         "22.1.7171670"
  #         "21.3.6528147" # LTS NDK
  #       ];
  #       cmake = "3.18.1";
  #       emulator = "30.6.3";
  #     };

  #     platforms = ["29" "30"];
  #     abis = [
  #       # "armeabi-v7a" "arm64-v8a" 
  #       "x86" "x86_64"
  #     ];
  #     extras = ["extras;google;gcm"];

  #   };


  #   androidComposition = androidenv.composeAndroidPackages {
  #     toolsVersion = android.versions.tools;
  #     platformToolsVersion = android.versions.platformTools;
  #     buildToolsVersions = [android.versions.buildTools];
  #     platformVersions = android.platforms;
  #     abiVersions = android.abis;

  #     includeSources = true;
  #     includeSystemImages = true;
  #     includeEmulator = true;
  #     emulatorVersion = android.versions.emulator;

  #     includeNDK = false; #true;
  #     # ndkVersions = android.versions.ndk;
  #     # cmakeVersions = [android.versions.cmake];

  #     # useGoogleAPIs = true;
  #     # includeExtras = android.extras;

  #     # If you want to use a custom repo JSON:
  #     # repoJson = ../repo.json;

  #     # If you want to use custom repo XMLs:
  #     /*repoXmls = {
  #       packages = [ ../xml/repository2-1.xml ];
  #       images = [
  #         ../xml/android-sys-img2-1.xml
  #         ../xml/android-tv-sys-img2-1.xml
  #         ../xml/android-wear-sys-img2-1.xml
  #         ../xml/android-wear-cn-sys-img2-1.xml
  #         ../xml/google_apis-sys-img2-1.xml
  #         ../xml/google_apis_playstore-sys-img2-1.xml
  #       ];
  #       addons = [ ../xml/addon2-1.xml ];
  #     };*/

  #     # Accepting more licenses declaratively:
  #     extraLicenses = [
  #       # Already accepted for you with the global accept_license = true or
  #       # licenseAccepted = true on androidenv.
  #       "android-sdk-license"

  #       # These aren't, but are useful for more uncommon setups.
  #       "android-sdk-preview-license"
  #       "android-googletv-license"
  #       "android-sdk-arm-dbt-license"
  #       "google-gdk-license"
  #       "intel-android-extra-license"
  #       "intel-android-sysimage-license"
  #       "mips-android-sysimage-license"
  #     ];
  #   }; 
  # in 
  # androidComposition.androidsdk
