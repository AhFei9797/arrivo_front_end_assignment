import 'package:arrivo_frond_end_assignment/model/response/response_get_post.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/posts')
  Future<List<ResponseOnGetPostList>> getPosts();

  @GET('posts/{id}')
  Future<ResponseOnGetPostList> getPostById({@Path('id') required int id});
}
