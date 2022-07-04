import 'package:bluebenx/home/domain/entity/filters_entity.dart';
import 'package:bluebenx/home/domain/entity/home_entity.dart';
import 'package:bluebenx/home/domain/usecase/home_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.homeusecase}) : super(const PostState()) {
    on<PostFetched>(_onPostFetched);
  }

  final HomeUsecase homeusecase;
  Future<void> _onPostFetched(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    if (event.newFilters) {
      return await _featchData(event, emit);
    }
    if (state.hasReachedMax) return;
    if (state.status == PostStatus.initial) {
      return await _featchData(event, emit);
    }
    event.filtersEntity!.page++;
    await _featchData(event, emit);
  }

  Future<void> _featchData(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    return await emit.forEach<List<HomeEntity>>(
        homeusecase(filtersEntity: event.filtersEntity!),
        onError: (error, stackTrace) {
          return state.copyWith(status: PostStatus.failure);
        },
        onData: (data) => state.copyWith(
              status:
                  event.newFilters ? PostStatus.initial : PostStatus.success,
              posts: List.of(state.posts)..addAll(data),
              hasReachedMax: data.length == 15 ? false : true,
            ));
  }
}
