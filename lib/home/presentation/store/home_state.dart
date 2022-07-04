part of 'home_bloc.dart';

enum PostStatus { initial, success, failure, loadingMore }

class PostError {}

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <HomeEntity>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<HomeEntity> posts;
  final bool hasReachedMax;

  PostState copyWith({
    PostStatus? status,
    List<HomeEntity>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];
}
