import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/update_post_state.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';

class UpdatePostCubit extends Cubit<UpdatePostState>  {
  UpdatePostCubit() : super(UpdatePostInit());


  void apiPostUpdate(Post post, TextEditingController titleController, TextEditingController bodyController) async{
    post.userId = 1;
    post.title = titleController.text;
    post.body = bodyController.text;
    emit(UpdatePostLoading());
    final response = await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }
}