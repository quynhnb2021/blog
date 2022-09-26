# blog

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to run this project ?
  - Run project using Android Studio or VSCode:
      + ###### Find terminal in IDE and run code: 
        ##### flutter pub get
        ##### flutter pub run build_runner build --delete-conflicting-outputs
      + ###### Android Studio: Click the Play icon in the toolbar, or invoke Run > Run. The bottom Run pane shows logs output
      + ###### VSCode: Start my application by opening the root folder of my project (the one containing pubspec.yaml) in VS Code and clicking Run > Start Debugging or ##Run without Debugging

  - Run project in a terminal:
    + ###### flutter pub get 
    + ###### flutter pub run build_runner build --delete-conflicting-outputs
    + ###### flutter run
    
  - Some special cases run on iOS(Mac M1): 
    +  run terminal: 
    STEP 1: Install ffi
    ###### sudo arch -x86_64 gem install ffi
    STEP 2: Re-install dependencies
    ###### arch -x86_64 pod install
    + ###### Find iOS/Podfile, uncomment platform :ios, '11.0' and try again: flutter run 
