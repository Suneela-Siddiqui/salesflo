
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesflo_project/posts_cubit/cubit/posts_cubit.dart';
import 'package:salesflo_project/posts_cubit/model/entity.dart';

class PostsView extends StatelessWidget {
  const PostsView({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsCubit, List<Post>>(
        builder: (context, posts) {
          if (posts.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.indigo),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    posts[index].title,
                    style: const TextStyle
                    (fontSize: 20,
                     color: Colors.black87),),
          
                  subtitle: Text(
                    posts[index].body,
                    style: const TextStyle
                    (fontSize: 15,
                     color: Colors.black54),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}