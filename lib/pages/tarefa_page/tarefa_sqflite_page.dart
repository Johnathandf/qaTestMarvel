import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trilhaapp/model/tarefa_sqflite_model.dart';
import 'package:trilhaapp/repositories/sqflite/tarefa_sqflite_repository.dart';





class TarefaSQFLitePage extends StatefulWidget {
  const TarefaSQFLitePage({super.key});

  @override
  State<TarefaSQFLitePage> createState() => _TarefaSQFLitePageState();
}

class _TarefaSQFLitePageState extends State<TarefaSQFLitePage> {
  tarefaSQFLiteRepository tarefaRepository = tarefaSQFLiteRepository();
  var _tarefas = <TarefaSQFLiteModel>[];
  var descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;


@override
  void initState() {
    
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async{
    _tarefas = await tarefaRepository.obterDados(apenasNaoConcluidos);
  
    
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          descricaoController.text = "";
          showDialog(context: context, builder: (BuildContext bc) {
            return AlertDialog(
              title: const Text("Adicionar Tarefa"),
              content:  TextField(
                controller: descricaoController,

              ),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text("Cancelar")),
                TextButton(onPressed: () async{
                 await tarefaRepository.salvar(
                    TarefaSQFLiteModel(0, descricaoController.text, false));
                  Navigator.pop(context);
                  obterTarefas();
                  setState(() {
                    
                  });

                }, 
                child: const Text("Salvar"))
              ],
            );
          });

        },),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Apenas Não Concluídos", 
                  style: TextStyle(fontSize: 18),),
                  Switch(value: apenasNaoConcluidos, 
                    onChanged: (bool value) {
                      apenasNaoConcluidos = value;
                      obterTarefas();
                    
                  })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (BuildContext bc, int index){
                  var tarefa = _tarefas[index];
                  return Dismissible(
                  onDismissed: (DismissDirection dismissDirection) async{
                    tarefaRepository.remover(tarefa.id);
                    obterTarefas();
                  },
                  key: Key(tarefa.descricao),
                  child: ListTile(
                    title: Text(tarefa.descricao),
                    trailing: Switch(
                      onChanged: (bool value) async{
                        tarefa.concluido = value;
                        tarefaRepository.atualizar(tarefa);
                        obterTarefas();
                                
                    }, value: tarefa.concluido),
                  ),
                ); 
              
              },
              
                  ),
            ),
          ],
        ),
      ));
  }
}