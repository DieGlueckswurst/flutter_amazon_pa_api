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
