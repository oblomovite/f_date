with import <nixpkgs> {};

androidenv.emulateApp {
  name = "Pixel_4_API_29";
  platformVersion = "29";
  abiVersion = "x86";
  # enableGPU = true;
  # avdHomeDir = "/home/skykanin/.android/avd";
  systemImageType = "google_apis";
}
