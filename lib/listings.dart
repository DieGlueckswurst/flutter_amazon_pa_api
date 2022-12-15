import 'package:json_annotation/json_annotation.dart';

part 'listings.g.dart';

@JsonSerializable()
class Listings {
  @JsonKey(name: 'Availability')
  Availability? availability;

  @JsonKey(name: 'DeliveryInfo')
  DeliveryInfo? deliveryInfo;

  @JsonKey(name: 'Price')
  Price? price;

  @JsonKey(name: 'SavingBasis')
  SavingBasis? savingBasis;

  Listings(this.availability, this.deliveryInfo, this.price, this.savingBasis);

  factory Listings.fromJson(Map<String, dynamic> json) =>
      _$ListingsFromJson(json);
  Map<String, dynamic> toJson() => _$ListingsToJson(this);
}

@JsonSerializable()
class Availability {
  @JsonKey(name: 'MaxOrderQuantity')
  num? maxOrderQuantity;

  @JsonKey(name: 'Message')
  String? message;

  @JsonKey(name: 'MinOrderQuantity')
  num? minOrderQuantity;

  @JsonKey(name: 'Type')
  String? type;

  Availability(
      this.maxOrderQuantity, this.message, this.minOrderQuantity, this.type);

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);
  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);
}

@JsonSerializable()
class DeliveryInfo {
  @JsonKey(name: 'IsAmazonFulfilled')
  bool? isAmazonFulfilled;

  @JsonKey(name: 'IsFreeShippingEligible')
  bool? isFreeShippingEligible;

  @JsonKey(name: 'IsPrimeEligible')
  bool? isPrimeEligible;

  DeliveryInfo(this.isAmazonFulfilled, this.isFreeShippingEligible,
      this.isPrimeEligible);

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) =>
      _$DeliveryInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DeliveryInfoToJson(this);
}

@JsonSerializable()
class Price {
  @JsonKey(name: 'Amount')
  num? amount;

  @JsonKey(name: 'Currency')
  String? currency;

  @JsonKey(name: 'DisplayAmount')
  String? displayAmount;

  @JsonKey(name: 'Savings')
  Savings? savings;

  Price(this.amount, this.currency, this.displayAmount, this.savings);

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable()
class Savings {
  @JsonKey(name: 'Amount')
  num? amount;

  @JsonKey(name: 'Currency')
  String? currency;

  @JsonKey(name: 'DisplayAmount')
  String? displayAmount;

  @JsonKey(name: 'Percentage')
  num? percentage;

  Savings(this.amount, this.currency, this.displayAmount, this.percentage);

  factory Savings.fromJson(Map<String, dynamic> json) =>
      _$SavingsFromJson(json);
  Map<String, dynamic> toJson() => _$SavingsToJson(this);
}

@JsonSerializable()
class SavingBasis {
  @JsonKey(name: 'Amount')
  num? amount;

  @JsonKey(name: 'Currency')
  String? currency;

  @JsonKey(name: 'DisplayAmount')
  String? displayAmount;

  @JsonKey(name: 'PriceType')
  String? priceType;

  SavingBasis(this.amount, this.currency, this.displayAmount, this.priceType);

  factory SavingBasis.fromJson(Map<String, dynamic> json) =>
      _$SavingBasisFromJson(json);
  Map<String, dynamic> toJson() => _$SavingBasisToJson(this);
}
