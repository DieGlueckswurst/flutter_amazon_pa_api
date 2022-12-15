// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offers _$OffersFromJson(Map<String, dynamic> json) => Offers(
      (json['Listings'] as List<dynamic>?)
          ?.map((e) => Listings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OffersToJson(Offers instance) => <String, dynamic>{
      'Listings': instance.listings,
    };
