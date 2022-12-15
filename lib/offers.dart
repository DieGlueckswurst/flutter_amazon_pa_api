import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_amazon_pa_api/listings.dart';

part 'offers.g.dart';

@JsonSerializable()
class Offers {
  @JsonKey(name: 'Listings')
  List<Listings>? listings;

  Offers(this.listings);

  factory Offers.fromJson(Map<String, dynamic> json) => _$OffersFromJson(json);
  Map<String, dynamic> toJson() => _$OffersToJson(this);
}
