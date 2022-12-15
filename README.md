# flutter_amazon_pa_api

Flutter package for Amazon PA-API 5.0.

## Getting Started

As this package is not available via pub you have to add it manually to your `pubspec.yaml`. 
There are at least two ways to use it in your project.

### Option 1 - Add git repo to `pubspec.yaml`
```yaml
flutter_amazon_pa_api:
  git:
    url: https://github.com/meganii/flutter_amazon_pa_api.git
    ref: master
```

### Option 2 - Add local copy to `pubspec.yaml`
```yaml
flutter_amazon_pa_api:
  path: ../flutter_amazon_pa_api
```   

## Usage in your project
After adding the package to your `pubspec.yaml` you have to add the package to your code.
```dart
import 'package:flutter_amazon_pa_api/flutter_amazon_pa_api.dart';
PaAPI paAPI = PaAPI(
      accessKey: "<your access key>",
      secretKey: "<your secretkey>",
      partnerTag: "<your partner tag>",
      // marketplace is defaulting to US. Use the PaAPIMarketplace enum to select your marketplace
      marketplace: PaAPIMarketplace.de);

// this will get all Items for this ASIN
paAPI.getItems(["B00S7N8G2Q"]);
```

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
