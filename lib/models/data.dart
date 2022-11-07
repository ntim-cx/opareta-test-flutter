import 'package:opareta_test/models/quote.dart';

class Data {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? cmcRank;
  int? numMarketPairs;
  int? circulatingSupply;
  int? totalSupply;
  int? maxSupply;
  String? lastUpdated;
  String? dateAdded;
  List<String>? tags;
  Map<String, Quote> quote = {};

  Data(
      {id,
      name,
      symbol,
      slug,
      cmcRank,
      numMarketPairs,
      circulatingSupply,
      totalSupply,
      maxSupply,
      lastUpdated,
      dateAdded,
      tags,
      quote});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    cmcRank = json['cmc_rank'];
    numMarketPairs = json['num_market_pairs'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    maxSupply = json['max_supply'];
    lastUpdated = json['last_updated'];
    dateAdded = json['date_added'];
    tags = json['tags'].cast<String>();
    if (json['quote'] != null) {
      (json['quote'] as Map<String, dynamic>).forEach((key, value) {
        quote[key] = Quote.fromJson(value);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['cmc_rank'] = cmcRank;
    data['num_market_pairs'] = numMarketPairs;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    data['max_supply'] = maxSupply;
    data['last_updated'] = lastUpdated;
    data['date_added'] = dateAdded;
    data['tags'] = tags;
    if (quote != null) {
      data["quote"] = {};
      quote.forEach((key, value) {
        data["quote"][key] = value.toJson();
      });
    }
    return data;
  }
}
