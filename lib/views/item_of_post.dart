import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_bloc/bloc/list_post_cubit.dart';
import '../model/post_model.dart';

Slidable itemOfPost(Post post) {
  return Slidable(
    child: ListTile(
      title: Text(post.title!),
      subtitle: Text(post.body!),
    ),
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            BlocProvider.of<ListPostCubit>(context).apiDelete(post);
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
    startActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) async {
            BlocProvider.of<ListPostCubit>(context).callUpdatePage(context, post);
          },
          backgroundColor: Color(0xFF0392CF),
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ],
    ),
  );
}