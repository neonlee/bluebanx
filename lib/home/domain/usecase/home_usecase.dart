import 'package:bluebenx/home/domain/entity/filters_entity.dart';
import 'package:bluebenx/home/domain/entity/home_entity.dart';
import 'package:bluebenx/home/domain/repository/home_repository.dart';

class HomeUsecase {
  final HomeRepository _homeRepository;

  HomeUsecase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;
  Stream<List<HomeEntity>> call({required FiltersEntity filtersEntity}) async* {
    yield* _homeRepository.getPrices(filtersEntity: filtersEntity);
  }
}
