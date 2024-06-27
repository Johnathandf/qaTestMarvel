import 'package:flutter/material.dart';
import 'package:trilhaapp/services/app_storage_service.dart';

class ConfiguracaoSharedPreferecesPage extends StatefulWidget {
  const ConfiguracaoSharedPreferecesPage({super.key});

  @override
  State<ConfiguracaoSharedPreferecesPage> createState() => _ConfiguracaoSharedPreferecesPageState();
}

class _ConfiguracaoSharedPreferecesPageState extends State<ConfiguracaoSharedPreferecesPage> {
    AppStorageService storage = AppStorageService();

    TextEditingController nomeUsuarioController = TextEditingController();
    TextEditingController alturaController = TextEditingController();

    String? nomeUsuario;
    double? altura;
    bool receberNotificacoes = false;
    bool temaEscuro = false;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async{
    
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    alturaController.text = (await (storage.getConfiguracoesAlturaUsuario())).toString();
    receberNotificacoes = await storage.getConfiguracaoReceberNotificacao();
    temaEscuro = await storage.getConfiguracoesTemaEscuro();
    
    setState(() {
      
    });
    
   
  }
  


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Configurações"),
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
              title: Text("Receber notificações"),
              onChanged: (bool value) {
              setState(() {
                receberNotificacoes = value; 
              });
            }, value: receberNotificacoes,),

            SwitchListTile(
              title: Text("Tema escuro"),
              value: temaEscuro, onChanged: (value){
              setState(() {
                temaEscuro = value;
              });

            }),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextButton(onPressed: () async{
                FocusScope.of(context).unfocus();

                try{
                 await storage.setConfiguracoesAlturaUsuario(double.parse(alturaController.text));
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
                await storage.setConfiguracoesNomeUsuario(nomeUsuarioController.text);
                await storage.setConfiguracaoReceberNotificacao(receberNotificacoes);
                await storage.setConfiguracoesTemaEscuro(temaEscuro);
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