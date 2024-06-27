import 'package:trilhaapp/model/tarefa_sqflite_model.dart';
import 'package:trilhaapp/repositories/sqflite/sqflite_database.dart';

class tarefaSQFLiteRepository{
  
  Future<List<TarefaSQFLiteModel>> obterDados(bool apenasNaoConcluidos) async{
    List<TarefaSQFLiteModel> tarefas = [];
    var db = await SQFLiteDataBase().obterDataBase();
    var result = await db.rawQuery(
      apenasNaoConcluidos ? "SELECT id, descricao, concluido FROM tarefas WHERE concluido = 0":
      'SELECT id, descricao, concluido FROM tarefas');
    for (var element in result) {
        tarefas.add(TarefaSQFLiteModel(
          int.parse(element["id"].toString()), 
          element["descricao"].toString(),
          element["concluido"] == 1)); 
    }
    return tarefas;
  }
  
  Future<void> salvar(TarefaSQFLiteModel tarefasSQFLModel) async{
      var db = await SQFLiteDataBase().obterDataBase();
      await db.rawInsert('INSERT INTO tarefas (descricao, concluido) values(?,?)',
        [tarefasSQFLModel.descricao, tarefasSQFLModel.concluido]
      );
  }

  Future<void> atualizar(TarefaSQFLiteModel tarefasSQFLModel) async{
      var db = await SQFLiteDataBase().obterDataBase();
      await db.rawInsert('UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?',
        [tarefasSQFLModel.descricao, tarefasSQFLModel.concluido, tarefasSQFLModel.id]
      );
  }

  Future<void> remover(int id) async{
      var db = await SQFLiteDataBase().obterDataBase();
      await db.rawInsert('DELETE FROM tarefas WHERE id = ?',
        [id]
      );
  }

}
