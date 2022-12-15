library flutter_amazon_pa_api;

import 'dart:convert';

import 'package:flutter_amazon_pa_api/get_items_response.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

class PaAPI {
  static const awsHmacAlgorithm = 'AWS4-HMAC-SHA256';
  static const aws4Request = 'aws4_request';

  /// Amazon Access Key
  String accessKey;

  /// Amazon Secret Key
  String secretKey;

  /// Service name
  String service = 'ProductAdvertisingAPI';

  /// Host
  late String host;

  /// Region
  late String region;

  /// Markeptlace default=us
  PaAPIMarketplace marketplace;

  /// API Request PATH
  late String path;

  /// Amazon associate tag
  late String partnerTag;

  PaAPI(
      {required this.accessKey,
      required this.secretKey,
      required this.partnerTag,
      this.marketplace = PaAPIMarketplace.us}) {
    this.host = this.marketplace.host;
    this.region = this.marketplace.region;
  }

  Future<GetItemsResponse> getItems(List<String> items) async {
    final body = {
      "ItemIds": items,
      "Resources": [
        "BrowseNodeInfo.BrowseNodes",
        "Images.Primary.Small",
        "Images.Primary.Medium",
        "Images.Primary.Large",
        "ItemInfo.ByLineInfo",
        "ItemInfo.ContentInfo",
        "ItemInfo.Title"
      ],
      "PartnerTag": this.partnerTag,
      "PartnerType": "Associates",
      "Marketplace": this.marketplace.name,
      "Operation": "GetItems"
    };
    final response = await _post('/paapi5/getitems', body);
    return GetItemsResponse.fromJson(response);
  }

  Future<dynamic> _post(String path, Map<String, dynamic> body) async {
    var headers = _createHeaders(path, 'GetItems', body);
    var url = Uri.parse('https://$host$path');
    var response =
        await http.post(url, headers: headers, body: json.encode(body));
    var responseBody = utf8.decode(response.bodyBytes);
    return jsonDecode(responseBody);
  }

  Map<String, String> _createHeaders(
      String path, String operation, Map<String, dynamic> body) {
    final currentDateTime = new DateTime.now().toUtc();
    var headers = {
      'host': this.host,
      'content-type': 'application/json; charset=utf-8',
      'content-encoding': 'amz-1.0',
      'x-amz-date': _getTimeStamp(currentDateTime),
      'x-amz-target': 'com.amazon.paapi5.v1.ProductAdvertisingAPIv1.$operation',
    };

    final signedHeaders =
        (headers.keys.toList()..sort()).map((s) => s.toLowerCase()).join(';');

    String canonicalURL = _prepareCanonicalRequest(path, headers, body);
    String stringToSign = _prepareStringToSign(canonicalURL, currentDateTime);
    String signature = _calculateSignature(stringToSign, currentDateTime);

    if (signature != null) {
      headers['Authorization'] =
          _buildAuthorizationString(signedHeaders, signature, currentDateTime);
      return headers;
    } else {
      return {};
    }
  }

  String _prepareCanonicalRequest(
      String path, Map<String, String> headers, Map<String, dynamic> payload) {
    final signedHeaders =
        (headers.keys.toList()..sort()).map((s) => s.toLowerCase()).join(';');

    final canonicalHeaders = headers.keys
        .map((key) => '${key.toLowerCase()}:${headers[key]?.trim()}')
        .toList()
      ..sort();

    var payloadHash =
        sha256.convert(utf8.encode(json.encode(payload))).toString();

    final canonicalURL = [
      'POST',
      path,
      '',
      ...canonicalHeaders,
      '',
      signedHeaders,
      payloadHash,
    ].join('\n');

    return canonicalURL;
  }

  String _prepareStringToSign(String canonicalURL, DateTime timestamp) {
    final credentialList = [
      _getDate(timestamp),
      this.region,
      this.service,
      aws4Request
    ];

    String stringToSign = [
      awsHmacAlgorithm,
      _getTimeStamp(timestamp),
      credentialList.join('/'),
      sha256.convert(utf8.encode(canonicalURL)).toString()
    ].join('\n');

    return stringToSign;
  }

  String _calculateSignature(String stringToSign, DateTime datetime) {
    var signatureKey = _getSignatureKey(datetime, this.region, this.service);
    var signature = Hmac(sha256, signatureKey)
        .convert(utf8.encode(stringToSign))
        .toString();
    return signature;
  }

  List<int> _getSignatureKey(DateTime datetime, String region, String service) {
    final credentialList = [
      _getDate(datetime),
      region,
      service,
      aws4Request,
    ];

    final signingKey = credentialList.fold(utf8.encode('AWS4$secretKey'),
        (List<int> key, String s) {
      final hmac = Hmac(sha256, key);
      return hmac.convert(utf8.encode(s)).bytes;
    });

    return signingKey;
  }

  String _buildAuthorizationString(
      String signedHeaders, String signature, DateTime datetime) {
    return '$awsHmacAlgorithm Credential=$accessKey/${_getDate(datetime)}/$region/$service/$aws4Request, ' +
        'SignedHeaders=$signedHeaders, ' +
        'Signature=$signature';
  }

  String _getTimeStamp(DateTime datetime) {
    return new DateFormat("yyyyMMdd'T'HHmmss'Z'").format(datetime);
  }

  String _getDate(DateTime datetime) {
    return new DateFormat("yyyyMMdd").format(datetime);
  }
}

enum PaAPIMarketplace {
  /// USA - Marketplace: "www.amazon.com", Host: "webservices.amazon.com", Region: "us-east-1"
  us("www.amazon.com", "webservices.amazon.com", "us-east-1"),

  /// Canada - Marketplace: "www.amazon.ca", Host: "webservices.amazon.ca", Region: "us-east-1"
  ca("www.amazon.ca", "webservices.amazon.ca", "us-east-1"),

  /// Mexico - Marketplace: "www.amazon.mx", Host: "webservices.amazon.mx", Region: "us-east-1"
  mx("www.amazon.com.mx", "webservices.amazon.com.mx", "us-east-1"),

  /// Brazil - Marketplace: "www.amazon.com.br", Host: "webservices.amazon.com.br", Region: "us-east-1"
  br("www.amazon.com.br", "webservices.amazon.com.br", "us-east-1"),

  /// UK - Marketplace: "www.amazon.co.uk", Host: "webservices.amazon.co.uk", Region: "eu-west-1"
  uk("www.amazon.co.uk", "webservices.amazon.co.uk", "eu-west-1"),

  /// France - Marketplace: "www.amazon.fr", Host: "webservices.amazon.fr", Region: "eu-west-1"
  fr("www.amazon.fr", "webservices.amazon.fr", "eu-west-1"),

  /// Germany - Marketplace: "www.amazon.de", Host: "webservices.amazon.de", Region: "eu-west-1"
  de("www.amazon.de", "webservices.amazon.de", "eu-west-1"),

  /// Spain - Marketplace: "www.amazon.es", Host: "webservices.amazon.es", Region: "eu-west-1"
  es("www.amazon.es", "webservices.amazon.es", "eu-west-1"),

  /// India - Marketplace: "www.amazon.in", Host: "webservices.amazon.in", Region: "eu-west-1"
  india("www.amazon.in", "webservices.amazon.in", "eu-west-1"),

  /// Italy - Marketplace: "www.amazon.it", Host: "webservices.amazon.it", Region: "eu-west-1"
  it("www.amazon.it", "webservices.amazon.it", "eu-west-1"),

  /// Arab Emirates - Marketplace: "www.amazon.ae", Host: "webservices.amazon.ae", Region: "eu-west-1"
  ae("www.amazon.ae", "webservices.amazon.ae", "eu-west-1"),

  /// Saudi Arabia - Marketplace: "www.amazon.sa", Host: "webservices.amazon.sa", Region: "eu-west-1"
  sa("www.amazon.sa", "webservices.amazon.sa", "eu-west-1"),

  /// Turkey - Marketplace: "www.amazon.com.tr", Host: "webservices.amazon.com.tr", Region: "eu-west-1"
  tr("www.amazon.com.tr", "webservices.amazon.com.tr", "eu-west-1"),

  /// Netherlands - Marketplace: "www.amazon.nl", Host: "webservices.amazon.nl", Region: "eu-west-1"
  nl("www.amazon.nl", "webservices.amazon.nl", "eu-west-1"),

  /// Sweden - Marketplace: "www.amazon.se", Host: "webservices.amazon.se", Region: "eu-west-1"
  se("www.amazon.se", "webservices.amazon.se", "eu-west-1"),

  /// Poland - Marketplace: "www.amazon.pl", Host: "webservices.amazon.pl", Region: "eu-west-1"
  pl("www.amazon.pl", "webservices.amazon.pl", "eu-west-1"),

  /// Egypt - Marketplace: "www.amazon.eg", Host: "webservices.amazon.eg", Region: "eu-west-1"
  eg("www.amazon.eg", "webservices.amazon.eg", "eu-west-1"),

  /// Belgium - Marketplace: "www.amazon.com.be", Host: "webservices.amazon.com.be", Region: "eu-west-1"
  be("www.amazon.com.be", "webservices.amazon.com.be", "eu-west-1"),

  /// Japan - Marketplace: "www.amazon.co.jp", Host: "webservices.amazon.co.jp", Region: "eu-west-1"
  jp("www.amazon.co.jp", "webservices.amazon.co.jp", "us-west-2"),

  /// Australia - Marketplace: "www.amazon.com.au", Host: "webservices.amazon.com.au", Region: "us-west-2"
  au("www.amazon.com.au", "webservices.amazon.com.au", "us-west-2"),

  /// Singapore - Marketplace: "www.amazon.sg", Host: "webservices.amazon.sg", Region: "us-west-2"
  sg("www.amazon.sg", "webservices.amazon.sg", "us-west-2");

  const PaAPIMarketplace(this.name, this.host, this.region);
  final String name;
  final String host;
  final String region;
}
