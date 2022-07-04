import 'package:bluebenx/home/data/datasource/home_remote_datasource.dart';
import 'package:bluebenx/home/domain/entity/filters_entity.dart';
import 'package:bluebenx/home/domain/entity/home_entity.dart';
import 'package:bluebenx/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDatasource _homeDatasource;

  HomeRepositoryImpl({required HomeDatasource homeDatasource})
      : _homeDatasource = homeDatasource;
  @override
  Stream<List<HomeEntity>> getPrices(
      {required FiltersEntity filtersEntity}) async* {
    yield* _homeDatasource.getPrices(filtersEntity: filtersEntity);
  }
}
