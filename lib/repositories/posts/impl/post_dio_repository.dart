

import 'package:trilhaapp/model/post_model.dart';
import 'package:trilhaapp/repositories/json_placeholder_custom_dio.dart';
import 'package:trilhaapp/repositories/posts/posts_repository.dart';

class PostsDioRepository implements PostsRepository{
  @override
  Future<List<PostModel>> getPosts() async{
    var jsonPlaceHolderCustonDio = JsonPlaceHolderCustonDio();
    var response = await jsonPlaceHolderCustonDio.dio.get("/posts");
      if (response.statusCode == 200){
       
        return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else{
        return []; 
    }
    
  }
}