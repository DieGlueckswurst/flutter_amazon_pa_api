/// List of implemented handled responses
enum PaAPIResource {
  /// BrowseNodeInfo.BrowseNodes
  BrowseNodeInfo_BrowseNodes("BrowseNodeInfo.BrowseNodes"),

  /// Images.Primary.Small
  Images_Primary_Small("Images.Primary.Small"),

  /// Images.Primary.Medium
  Images_Primary_Medium("Images.Primary.Medium"),

  /// Images.Primary.Large
  Images_Primary_Large("Images.Primary.Large"),

  /// ItemInfo.ByLineInfo
  ItemInfo_ByLineInfo("ItemInfo.ByLineInfo"),

  /// ItemInfo.ContentInfo
  ItemInfo_ContentInfo("ItemInfo.ContentInfo"),

  /// ItemInfo.Title
  ItemInfo_Title("ItemInfo.Title"),

  /// Offers.Listings.Availability.MaxOrderQuantity
  Offers_Listings_Availability_MaxOrderQuantity(
      "Offers.Listings.Availability.MaxOrderQuantity"),

  /// Offers.Listings.Availability.Message
  Offers_Listings_Availability_Message("Offers.Listings.Availability.Message"),

  /// Offers.Listings.Availability.MinOrderQuantity
  Offers_Listings_Availability_MinOrderQuantity(
      "Offers.Listings.Availability.MinOrderQuantity"),

  /// Offers.Listings.Availability.Type
  Offers_Listings_Availability_Type("Offers.Listings.Availability.Type"),

  /// Offers.Listings.DeliveryInfo.IsAmazonFulfilled
  Offers_Listings_DeliveryInfo_IsAmazonFulfilled(
      "Offers.Listings.DeliveryInfo.IsAmazonFulfilled"),

  /// Offers.Listings.DeliveryInfo.IsFreeShippingEligible
  Offers_Listings_DeliveryInfo_IsFreeShippingEligible(
      "Offers.Listings.DeliveryInfo.IsFreeShippingEligible"),

  /// Offers.Listings.DeliveryInfo.IsPrimeEligible
  Offers_Listings_DeliveryInfo_IsPrimeEligible(
      "Offers.Listings.DeliveryInfo.IsPrimeEligible"),

  /// Offers.Listings.Price
  Offers_Listings_Price("Offers.Listings.Price"),

  /// Offers.Listings.SavingBasis
  Offers_Listings_SavingBasis("Offers.Listings.SavingBasis");

  const PaAPIResource(this.name);
  final String name;
}
