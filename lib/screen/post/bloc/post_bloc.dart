import 'package:arrivo_frond_end_assignment/model/response/response_get_post.dart';
import 'package:arrivo_frond_end_assignment/respository/post_repository.dart';
import 'package:arrivo_frond_end_assignment/screen/post/bloc/post_event.dart';
import 'package:arrivo_frond_end_assignment/screen/post/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreenBloc extends Bloc<PostScreenEvent, PostScreenState> {
  final PostRepository _postRepository = PostRepository();
  PostScreenBloc() : super(PostScreenStateInitial()) {
    on<OnGetPostListAction>(
      (_, emit) async {
        try {
          List<ResponseOnGetPostList> response = await _postRepository.getPostsAction();
          emit(
            PostScreenGetPostListSuccess(response),
          );
        } catch (e) {
          emit(
            SidebarMenuError(e.toString()),
          );
        }
      },
    );
    on<OnGetPostByIdAction>((_, emit) async {
      try {
        ResponseOnGetPostList response = await _postRepository.getPostByIdAction(id: _.id);
        emit(
          PostScreenGetPostByIdSuccess(response),
        );
      } catch (e) {
        emit(
          SidebarMenuError(e.toString()),
        );
      }
    });
  }
}
