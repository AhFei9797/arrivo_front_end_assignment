import 'package:arrivo_frond_end_assignment/api/api_client.dart';
import 'package:arrivo_frond_end_assignment/model/response/response_get_post.dart';

class PostRepository {
  PostRepository._internal();

  static final PostRepository _singleton = PostRepository._internal();

  factory PostRepository() {
    return _singleton;
  }

  Future<List<ResponseOnGetPostList>> getPostsAction() {
    return ApiClient.instance.getPosts();
  }

  Future<ResponseOnGetPostList> getPostByIdAction({required int id}) {
    return ApiClient.instance.getPostById(id: id);
  }
}
