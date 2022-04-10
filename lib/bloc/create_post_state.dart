import 'package:equatable/equatable.dart';
import 'package:pattern_bloc/model/post_model.dart';

abstract class CreatePostState extends Equatable{
  @override
  List<Object> get props => [];
}

class CreatePostInit extends CreatePostState{}

class CreatePostLoading extends CreatePostState{}

class CreatePostLoaded extends CreatePostState{
  final bool? isCreated;

  CreatePostLoaded({this.isCreated});
}

class CreatePostError extends CreatePostState{
  final error;

  CreatePostError({this.error});
}