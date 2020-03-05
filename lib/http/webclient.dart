import 'package:dio/dio.dart';
import 'package:insta/model/post.dart';

class FindAll  {

Future<List<Post>> getPosts()  async {
  try {
    Response response = await Dio().get('https://mobile.int.granito.xyz/api/feed/getposts');
    //Post modelPost = Post.fromJson(response.data);
    return List<Post> modelPost = Post.fromJson(response.data);
  } on DioError catch (e) {
    throw (e.message);
  }
}


}