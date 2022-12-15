enum PaAPIOperation {
  /// GetItems
  GetItems("GetItems"),

  /// SearchItems
  SearchItems("SearchItems");

  const PaAPIOperation(this.name);
  final String name;
}
