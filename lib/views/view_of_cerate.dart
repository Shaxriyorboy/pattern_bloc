import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/create_post_cubit.dart';
import 'package:pattern_bloc/model/post_model.dart';

Widget viewOfCreate(
    bool isLoading,
    BuildContext context,
    TextEditingController titleController,
    TextEditingController bodyController) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Title",
          ),
        ),
        TextFormField(
          controller: bodyController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Body",
          ),
        ),
        MaterialButton(
          onPressed: () {
            Post post = Post(
                title: titleController.text,
                body: bodyController.text,
                userId: 1);
            BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);
          },
          color: Colors.blue,
          child: Text("Save"),
        )
      ],
    ),
  );
}
