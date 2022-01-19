import 'package:all_in_one/blocs/network_calls_bloc/network_call_bloc.dart';
import 'package:all_in_one/blocs/network_calls_bloc/network_call_state.dart';
import 'package:all_in_one/widget/bottom_loader.dart';
import 'package:all_in_one/widget/post_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:all_in_one/blocs/network_calls_bloc/network_call_event.dart';


class NetworkCallsScreen extends StatefulWidget {
  const NetworkCallsScreen({Key? key}) : super(key: key);

  @override
  _NetworkCallsScreenState createState() => _NetworkCallsScreenState();
}

class _NetworkCallsScreenState extends State<NetworkCallsScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
      super.initState();
      _scrollController.addListener(_onScroll);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Network Call'),),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state){
          switch (state.status){
            case PostStatus.failure:
              return const Center(child: Text('Failed To fetch Posts'));
            case PostStatus.success:
              if(state.posts.isEmpty){
                return const Center(child: Text('No Posts'));
              }
              return ListView.builder(itemBuilder: (BuildContext context, int index){
                return index >= state.posts.length ? const BottomLoader() : PostListItem(post: state.posts[index]);
              },
              itemCount: state.hasReachedMax ? state.posts.length : state.posts.length + 1,
                controller: _scrollController,
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }

  @override
  void dispose() {
    _scrollController..removeListener(_onScroll)..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if(!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
