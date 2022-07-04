import 'package:bluebenx/home/domain/entity/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    super.ath,
    super.circulatingSupply,
    super.currentPrice,
    super.fullyDilutedValuation,
    super.high24h,
    super.id,
    super.image,
    super.athDate,
    super.low24h,
    super.marketCap,
    super.marketCapChange24h,
    super.marketCapChangePercentage24h,
    super.marketCapRank,
    super.maxSupply,
    super.name,
    super.priceChange24h,
    super.priceChangePercentage24h,
    super.atl,
    super.symbol,
    super.athChangePercentage,
    super.totalVolume,
    super.atlChangePercentage,
    super.atlDate,
    super.lastUpdated,
    super.roi,
    super.totalSupply,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      currentPrice: json['current_price'],
      marketCap: json['market_cap'],
      marketCapRank: json['market_cap_rank'],
      fullyDilutedValuation: json['fully_diluted_valuation'],
      //totalVolume: json['total_volume'],
      high24h: json['high_24h'],
      low24h: json['low_24h'],
      priceChange24h: json['price_change_24h'],
      priceChangePercentage24h: json['price_change_percentage_24h'],
      //marketCapChange24h: json['market_cap_change_24h'],
      marketCapChangePercentage24h: json['market_cap_change_percentage_24h'],
      circulatingSupply: json['circulating_supply'],
      totalSupply: json['total_supply'],
      maxSupply: json['max_supply'],
      //ath: json['ath'] as double,
      athChangePercentage: json['ath_change_percentage'],
      athDate: json['ath_date'],
      atl: json['atl'],
      atlChangePercentage: json['atl_change_percentage'],
      atlDate: json['atl_date'],
      roi: json['roi'] != null ? RoiModel.fromJson(json['roi']) : null,
      lastUpdated: json['last_updated'],
    );
  }
}

class RoiModel extends RoiEntity {
  RoiModel({
    super.currency,
    super.percentage,
    super.times,
  });
  factory RoiModel.fromJson(Map<String, dynamic> json) {
    return RoiModel(
      times: json['times'],
      currency: json['currency'],
      percentage: json['percentage'],
    );
  }
}
