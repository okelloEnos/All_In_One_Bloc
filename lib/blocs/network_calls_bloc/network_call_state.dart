import 'package:all_in_one/model/post.dart';
import 'package:equatable/equatable.dart';
enum PostStatus {initial, failure, success}

class PostState extends Equatable{
  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  const PostState({this.posts = const <Post>[], this.status = PostStatus.initial, this.hasReachedMax = false});

  PostState copyWith({List<Post>? inner_posts, PostStatus? inner_status, bool? inner_hasReachedMax}){

    return PostState(status: inner_status ?? status, posts: inner_posts ?? posts, hasReachedMax: inner_hasReachedMax ?? hasReachedMax);
  }

  @override
  List<Object?> get props => [status, posts, hasReachedMax];
}