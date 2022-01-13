class Quote {
  double price;
  int volume24h;
  double volumeChange24h;
  double percentChange1h;
  double percentChange24h;
  double percentChange7d;
  double marketCap;
  int marketCapDominance;
  double fullyDilutedMarketCap;
  String lastUpdated;

  Quote(
      {price,
        volume24h,
        volumeChange24h,
        percentChange1h,
        percentChange24h,
        percentChange7d,
        marketCap,
        marketCapDominance,
        fullyDilutedMarketCap,
        lastUpdated});

  Quote.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    volumeChange24h = json['volume_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['volume_change_24h'] = volumeChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['market_cap'] = marketCap;
    data['market_cap_dominance'] = marketCapDominance;
    data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
