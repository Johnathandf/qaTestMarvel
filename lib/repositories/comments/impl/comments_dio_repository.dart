import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/comments/comments_repository.dart';
import 'package:trilhaapp/repositories/json_placeholder_custom_dio.dart';

class CommentsDioRepository implements CommentsRepository{
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jsonPlaceHolderCustonDio = JsonPlaceHolderCustonDio();
    var response = await jsonPlaceHolderCustonDio.dio.get("/posts/$postId/comments");
    return (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
  }
  
}