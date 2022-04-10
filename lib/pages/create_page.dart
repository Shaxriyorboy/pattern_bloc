import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/create_post_cubit.dart';
import 'package:pattern_bloc/views/view_of_cerate.dart';

import '../bloc/create_post_state.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detaile Page"),
        ),
        body: BlocBuilder<CreatePostCubit,CreatePostState>(builder: (BuildContext context, CreatePostState state){
          if(state is CreatePostError){
            return viewOfCreate(false, context,titleController,bodyController);
          }if(state is CreatePostLoaded){
            _finish(context);
          }if(state is CreatePostLoading){}
            return viewOfCreate(true, context,titleController,bodyController);

        },),
      ),
    );
  }}