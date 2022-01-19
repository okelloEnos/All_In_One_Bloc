import 'package:all_in_one/model/post.dart';
import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: Text('${post.id}'),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
        dense: true,
      ),
    );
  }
}
