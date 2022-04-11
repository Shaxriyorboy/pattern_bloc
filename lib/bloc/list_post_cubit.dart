import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/list_post_state.dart';
import 'package:pattern_bloc/model/post_model.dart';
import 'package:pattern_bloc/services/http_service.dart';

import '../pages/create_page.dart';
import '../pages/update_page.dart';

class ListPostCubit extends Cubit<ListPostState>{
  ListPostCubit() : super(ListPostInit());

  void apiPostList() async{
    emit(ListPostLoading());
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null){
      emit(ListPostLoaded(posts: Network.parsePostList(response)));
    }else{
      emit(ListPostError(error: "Couldn't fetch posts"));
    }
  }

  void apiDelete(Post post)async{
    emit(ListPostLoading());
    final response = await Network.DEL(Network.API_DELETE+post.id.toString(), Network.paramsEmpty());
    if(response != null){
      apiPostList();
    }else{
      emit(ListPostError(error: "Couldn't delete posts"));
    }
  }

  void callCreatePage(BuildContext context) async {
    var results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreatePage()));
    if (results != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }

  void callUpdatePage(BuildContext context, Post post) async {
    var results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UpdatePage(post: post)));
    if (results != null) {
      apiPostList();
    }
  }

}