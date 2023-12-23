import 'package:arrivo_frond_end_assignment/model/response/response_get_post.dart';
import 'package:equatable/equatable.dart';

abstract class PostScreenState extends Equatable {
  const PostScreenState();
  @override
  List<Object> get props => [];
  get temp => null;
}

class PostScreenStateInitial extends PostScreenState {}

class PostScreenStateLoading extends PostScreenState {}

class PostScreenGetPostListSuccess extends PostScreenState {
  final List<ResponseOnGetPostList> response;
  const PostScreenGetPostListSuccess(this.response);
  @override
  List<Object> get props => [response];
}

class PostScreenGetPostByIdSuccess extends PostScreenState {
  final ResponseOnGetPostList response;
  const PostScreenGetPostByIdSuccess(this.response);
  @override
  List<Object> get props => [response];
}

class SidebarMenuError extends PostScreenState {
  final String errMessage;
  const SidebarMenuError(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
