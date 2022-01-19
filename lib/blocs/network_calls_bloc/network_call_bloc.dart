import 'dart:convert';

import 'package:all_in_one/blocs/network_calls_bloc/network_call_state.dart';
import 'package:all_in_one/model/post.dart';
import 'package:bloc/bloc.dart';
import 'package:all_in_one/blocs/network_calls_bloc/network_call_event.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);
const _postLimit = 20;

EventTransformer<E> throttleDroppable<E>(Duration duration){
  return (events, mapper){
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}
class PostBloc extends Bloc<PostEvent, PostState>{
  PostBloc({required this.httpClient}) : super(const PostState()){
    on<PostFetched>(_onPostsFetched, transformer: throttleDroppable(throttleDuration));
  }

  final http.Client httpClient;

  Future<void> _onPostsFetched(PostFetched event, Emitter<PostState> emit) async{
    if (state.hasReachedMax) return;

    try{
      if(state.status == PostStatus.initial){
        final posts = await _fetchPosts();

        return emit(state.copyWith(
          inner_status: PostStatus.success,
          inner_posts: posts,
          inner_hasReachedMax: false
        ));
      }

      final posts = await _fetchPosts(state.posts.length);
      emit(posts.isEmpty ? state.copyWith(inner_hasReachedMax: true) :
      state.copyWith(inner_status: PostStatus.success,
      inner_posts: List.of(state.posts)..addAll(posts),
      inner_hasReachedMax: false));
    } catch (_){
      emit(state.copyWith(inner_status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts([int starting = 0]) async{
    final response = await httpClient.get(Uri.https('jsonplaceholder.typicode.com', '/posts',
    <String, String>{'_start': '$starting', '_limit': '$_postLimit'}));

    if(response.statusCode == 200){
      final body = json.decode(response.body) as List;
      return body.map((dynamic json){
        return Post(
            userId: json['userId'] as int,
            id: json['id'] as int,
            title: json['title'] as String,
            body: json['body'] as String);
      }).toList();
    }

    throw Exception('error fetching posts');
  }
}