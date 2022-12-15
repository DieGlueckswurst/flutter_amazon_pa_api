library flutter_amazon_pa_api;

import 'dart:convert';

import 'package:flutter_amazon_pa_api/get_items_response.dart';
import 'package:flutter_amazon_pa_api/search_items_response.dart';
import 'package:flutter_amazon_pa_api/paapi_operation.dart';
import 'package:flutter_amazon_pa_api/paapi_marketplace.dart';
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

  Future<GetItemsResponse> getItems(
      List<String> items, List<String> resources) async {
    final body = {
      "ItemIds": items,
      "Resources": resources,
      "PartnerTag": this.partnerTag,
      "PartnerType": "Associates",
      "Marketplace": this.marketplace.name,
      "Operation": PaAPIOperation.GetItems.name
    };
    final response =
        await _post('/paapi5/getitems', body, PaAPIOperation.GetItems);
    return GetItemsResponse.fromJson(response);
  }

  Future<SearchItemsResponse> searchItems(
      String keywords, List<String> resources) async {
    final body = {
      "Keywords": keywords,
      "Resources": resources,
      "PartnerTag": this.partnerTag,
      "PartnerType": "Associates",
      "Marketplace": this.marketplace.name,
      "Operation": PaAPIOperation.SearchItems.name
    };
    final response =
        await _post('/paapi5/getitems', body, PaAPIOperation.SearchItems);
    return SearchItemsResponse.fromJson(response);
  }

  Future<dynamic> _post(
      String path, Map<String, dynamic> body, PaAPIOperation operation) async {
    var headers = _createHeaders(path, operation.name, body);
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
