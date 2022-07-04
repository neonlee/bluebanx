import 'package:bluebenx/home/domain/entity/filters_entity.dart';
import 'package:bluebenx/home/domain/entity/home_entity.dart';

abstract class HomeRepository {
  Stream<List<HomeEntity>> getPrices({required FiltersEntity filtersEntity});
}
