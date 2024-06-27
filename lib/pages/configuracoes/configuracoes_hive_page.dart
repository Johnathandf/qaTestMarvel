import 'package:flutter/material.dart';
import 'package:trilhaapp/model/configuracoes_model.dart';
import 'package:trilhaapp/repositories/configuracoes_repository.dart';

class ConfiguracaoHivePage extends StatefulWidget {
  const ConfiguracaoHivePage({super.key});

  @override
  State<ConfiguracaoHivePage> createState() => _ConfiguracaoHivePageState();
}

class _ConfiguracaoHivePageState extends State<ConfiguracaoHivePage> {
    late ConfiguracoesRepository configuracoesRepository;
    var configuracoesModel = ConfiguracoesModel.vazio();

    TextEditingController nomeUsuarioController = TextEditingController();
    TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async{
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();

    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();
    
    setState(() {
      
    });
    
   
  }
  


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configurações Hive"),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Nome usuário"
                  ),
                  controller: nomeUsuarioController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Altura"
                  ),
                  controller: alturaController,
                ),
              ),
            SwitchListTile(
              title: const Text("Receber notificações"),
              onChanged: (bool value) {
              setState(() {
               configuracoesModel.receberNotificacoes = value; 
              });
            }, value: configuracoesModel.receberNotificacoes,),

            SwitchListTile(
              title: const Text("Tema escuro"),
              value: configuracoesModel.temaEscuro, onChanged: (value){
              setState(() {
               configuracoesModel.temaEscuro = value;
              });

            }),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextButton(onPressed: () async{
                FocusScope.of(context).unfocus();

                try{
                 configuracoesModel.altura = double.parse(alturaController.text);
                } catch(e){
                 
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context, 
                    builder: (_) {
                     return AlertDialog(
                       title: const Text("Meu App"),
                       content: const Text("Favor informar uma altura válida (Exemplo: 1.70)"),
                       actions: [TextButton(onPressed: () {
                       Navigator.pop(context);

                },          
                    child: const Text("OK"))],
          );
        });
          return;
      }
               configuracoesModel.nomeUsuario = nomeUsuarioController.text;
               configuracoesRepository.salvar(configuracoesModel);
               await Future.delayed(const Duration(milliseconds: 200));

                Navigator.pop(context);
              
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 105, 47, 232))
              ),
              child: const Text("Salvar",
                style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              )),
            )
          ],)
        ),

    ),);
  }
}