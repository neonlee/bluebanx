class FiltersEntity {
  String vscurrency;
  String order;
  String priceChangePercentage;
  bool sparkline;
  int perPage;
  int page;

  FiltersEntity({
    this.order = 'market_cap_desc',
    this.page = 1,
    this.perPage = 15,
    this.priceChangePercentage = '24h,30d,200d,1y',
    this.sparkline = false,
    this.vscurrency = 'usd',
  });

  static List<String> currentCoin = ['USD', 'EUR', 'JPY'];

  static List<OrderBy> orderBy = [
    OrderBy(name: 'gecko_desc', valueInString: 'gecko_desc'),
    OrderBy(name: 'gecko_asc', valueInString: 'gecko_asc'),
    OrderBy(name: 'market_cap_asc', valueInString: 'market_cap_asc'),
    OrderBy(name: 'market_cap_desc', valueInString: 'market_cap_desc'),
    OrderBy(name: 'volume_asc', valueInString: 'volume_asc'),
    OrderBy(name: 'volume_desc', valueInString: 'volume_desc'),
    OrderBy(name: 'id_asc', valueInString: 'id_asc'),
    OrderBy(name: 'id_desc', valueInString: 'id_desc'),
  ];

  static List<OrderBy> percentageChange = [
    OrderBy(name: '1h', valueInString: '1h'),
    OrderBy(name: '24h', valueInString: '24h'),
    OrderBy(name: '7d', valueInString: '7d'),
    OrderBy(name: '14d', valueInString: '14d'),
    OrderBy(name: '30d', valueInString: '30d'),
    OrderBy(name: '200d', valueInString: '200d'),
    OrderBy(name: '1y', valueInString: '1y'),
  ];
}

class OrderBy {
  String valueInString;
  String name;
  bool value;

  OrderBy({
    required this.name,
    required this.valueInString,
    this.value = false,
  });
}
