import 'package:bluebenx/core/constants/named_urls.dart';
import 'package:bluebenx/home/data/model/home_model.dart';
import 'package:bluebenx/home/domain/entity/filters_entity.dart';
import 'package:bluebenx/home/domain/entity/home_entity.dart';
import 'package:bluebenx/infra/http_client/http_client.dart';

abstract class HomeDatasource {
  Stream<List<HomeEntity>> getPrices({required FiltersEntity filtersEntity});
}

class HomeDatasourceImpl extends HomeDatasource {
  final IHttpClient _httpClient;

  HomeDatasourceImpl({
    required IHttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Stream<List<HomeEntity>> getPrices({
    required FiltersEntity filtersEntity,
  }) async* {
    var url = NamedUrls.coins
        .replaceAll('#page', '${filtersEntity.page}')
        .replaceAll('#limit', '${15}')
        .replaceAll('#coin', filtersEntity.vscurrency)
        .replaceAll('#orderBy', filtersEntity.order)
        .replaceAll('#select_data', filtersEntity.priceChangePercentage)
        .replaceAll('#sparkline', filtersEntity.sparkline.toString());
    try {
      var response = await _httpClient.get(url);
      yield (response.data as List)
          .map((result) => HomeModel.fromJson(result))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
