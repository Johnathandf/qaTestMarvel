class TarefaSQFLiteModel{
  int _id =0;
  String _descricao = "";
  bool _concluido = false;

  TarefaSQFLiteModel(this._id, this._descricao, this._concluido);

  int get id => _id;

  set id(int _id){
    _id = id;
  }

  String get descricao => _descricao;

  set descricao(String descricao){
    _descricao = descricao;
  }

 bool get concluido => _concluido;

  set concluido(bool concluido){
    _concluido = concluido;
  }
}