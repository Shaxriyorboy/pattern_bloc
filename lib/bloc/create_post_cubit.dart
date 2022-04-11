import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/model/post_model.dart';
import 'package:pattern_bloc/services/http_service.dart';
import 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState>{
  CreatePostCubit() : super(CreatePostInit());

  void apiPostCreate(Post post) async{
    emit(CreatePostLoading());
    final response = await Network.POST(Network.API_CREATE.toString(), Network.paramsCreate(post));
    if(response != null){
      emit(CreatePostLoaded(isCreated: true));
    }else{
      emit(CreatePostError(error: "Couldn't fetch posts"));
    }
  }

}