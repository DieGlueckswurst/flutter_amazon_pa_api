// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Listings _$ListingsFromJson(Map<String, dynamic> json) => Listings(
      json['Availability'] == null
          ? null
          : Availability.fromJson(json['Availability'] as Map<String, dynamic>),
      json['DeliveryInfo'] == null
          ? null
          : DeliveryInfo.fromJson(json['DeliveryInfo'] as Map<String, dynamic>),
      json['Price'] == null
          ? null
          : Price.fromJson(json['Price'] as Map<String, dynamic>),
      json['SavingBasis'] == null
          ? null
          : SavingBasis.fromJson(json['SavingBasis'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListingsToJson(Listings instance) => <String, dynamic>{
      'Availability': instance.availability,
      'DeliveryInfo': instance.deliveryInfo,
      'Price': instance.price,
      'SavingBasis': instance.savingBasis,
    };

Availability _$AvailabilityFromJson(Map<String, dynamic> json) => Availability(
      json['MaxOrderQuantity'] as num?,
      json['Message'] as String?,
      json['MinOrderQuantity'] as num?,
      json['Type'] as String?,
    );

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'MaxOrderQuantity': instance.maxOrderQuantity,
      'Message': instance.message,
      'MinOrderQuantity': instance.minOrderQuantity,
      'Type': instance.type,
    };

DeliveryInfo _$DeliveryInfoFromJson(Map<String, dynamic> json) => DeliveryInfo(
      json['IsAmazonFulfilled'] as bool?,
      json['IsFreeShippingEligible'] as bool?,
      json['IsPrimeEligible'] as bool?,
    );

Map<String, dynamic> _$DeliveryInfoToJson(DeliveryInfo instance) =>
    <String, dynamic>{
      'IsAmazonFulfilled': instance.isAmazonFulfilled,
      'IsFreeShippingEligible': instance.isFreeShippingEligible,
      'IsPrimeEligible': instance.isPrimeEligible,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      json['Amount'] as num?,
      json['Currency'] as String?,
      json['DisplayAmount'] as String?,
      json['Savings'] == null
          ? null
          : Savings.fromJson(json['Savings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'Amount': instance.amount,
      'Currency': instance.currency,
      'DisplayAmount': instance.displayAmount,
      'Savings': instance.savings,
    };

Savings _$SavingsFromJson(Map<String, dynamic> json) => Savings(
      json['Amount'] as num?,
      json['Currency'] as String?,
      json['DisplayAmount'] as String?,
      json['Percentage'] as num?,
    );

Map<String, dynamic> _$SavingsToJson(Savings instance) => <String, dynamic>{
      'Amount': instance.amount,
      'Currency': instance.currency,
      'DisplayAmount': instance.displayAmount,
      'Percentage': instance.percentage,
    };

SavingBasis _$SavingBasisFromJson(Map<String, dynamic> json) => SavingBasis(
      json['Amount'] as num?,
      json['Currency'] as String?,
      json['DisplayAmount'] as String?,
      json['PriceType'] as String?,
    );

Map<String, dynamic> _$SavingBasisToJson(SavingBasis instance) =>
    <String, dynamic>{
      'Amount': instance.amount,
      'Currency': instance.currency,
      'DisplayAmount': instance.displayAmount,
      'PriceType': instance.priceType,
    };
