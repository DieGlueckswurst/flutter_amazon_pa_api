import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_amazon_pa_api/items_result.dart';

part 'search_items_response.g.dart';

@JsonSerializable()
class SearchItemsResponse {
  @JsonKey(name: 'SearchResult')
  ItemsResult? searchResult;

  SearchItemsResponse(this.searchResult);

  factory SearchItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchItemsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchItemsResponseToJson(this);
}
