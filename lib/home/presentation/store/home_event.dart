part of 'home_bloc.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetched extends PostEvent {
  final FiltersEntity? filtersEntity;
  final bool newFilters;
  PostFetched({this.filtersEntity, this.newFilters = false});
}
