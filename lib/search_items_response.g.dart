// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchItemsResponse _$SearchItemsResponseFromJson(Map<String, dynamic> json) =>
    SearchItemsResponse(
      json['SearchResult'] == null
          ? null
          : ItemsResult.fromJson(json['SearchResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchItemsResponseToJson(
        SearchItemsResponse instance) =>
    <String, dynamic>{
      'SearchResult': instance.searchResult,
    };
