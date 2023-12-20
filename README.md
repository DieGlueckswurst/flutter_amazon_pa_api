# flutter_amazon_pa_api

Flutter package for Amazon PA-API 5.0.

## Getting Started

As this package is not available via pub you have to add it manually to your `pubspec.yaml`. 
There are at least two ways to use it in your project.

### Option 1 - Add git repo to `pubspec.yaml`
```yaml
flutter_amazon_pa_api:
  git:
    url: https://github.com/DieGlueckswurst/flutter_amazon_pa_api.git
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
import 'package:flutter_amazon_pa_api/search_items_response.dart';
import 'package:flutter_amazon_pa_api/paapi_resource.dart';

// list all resources you want to fetch
var resources = [
      PaAPIResource.BrowseNodeInfo_BrowseNodes.name,
      PaAPIResource.Images_Primary_Small.name,
      PaAPIResource.Images_Primary_Medium.name,
      PaAPIResource.Images_Primary_Large.name,
      PaAPIResource.ItemInfo_ByLineInfo.name,
      PaAPIResource.ItemInfo_ContentInfo.name,
      PaAPIResource.ItemInfo_Title.name,
      PaAPIResource.Offers_Listings_Price.name,
      PaAPIResource.Offers_Listings_SavingBasis.name,
      PaAPIResource.Offers_Listings_Availability_MaxOrderQuantity.name,
      PaAPIResource.Offers_Listings_DeliveryInfo_IsAmazonFulfilled.name,
    ];

PaAPI paAPI = PaAPI(
      accessKey: "<your access key>",
      secretKey: "<your secretkey>",
      partnerTag: "<your partner tag>",
      // marketplace is defaulting to US. Use the PaAPIMarketplace enum to select your marketplace
      marketplace: PaAPIMarketplace.de);

// this will get all Items for this ASIN
await paAPI.getItems(["B00S7N8G2Q"], resources);
// this will get all Items for these keywords
await paAPI.searchItems("urban classics damen ladies laces dress kleid", resources)
```

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
