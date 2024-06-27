import 'package:flutter/material.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';
import 'package:trilhaapp/repositories/dados_cadastrais_repository.dart';
import 'package:trilhaapp/repositories/linguagem_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';

import '../../shered/widgets/text_label.dart';

class DadosCadastraisHivePage extends StatefulWidget {
  const DadosCadastraisHivePage({super.key});

  @override
  State<DadosCadastraisHivePage> createState() => _DadosCadastraisHivePageState();
}

class _DadosCadastraisHivePageState extends State<DadosCadastraisHivePage> {
  late DadosCadastraisRepository dadosCadastraisRepository;
  var dadosCadastraisModel = DadosCadastraisModel.vazio();
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  var nivelRepository = NivelRepository();
  var linguagemRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  bool salvando = false;

  List<DropdownMenuItem> returnItens(int quantidadeMax){
    var itens = <DropdownMenuItem>[];
    for(var i = 0; i<= quantidadeMax; i++){
      itens.add( DropdownMenuItem(
          child: Text(i.toString()),
            value: i,
      ),);
    }
      return itens;
  }


  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagemRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async{
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nome ?? "";
    dataNascimentoController.text = 
      dadosCadastraisModel.dataNascimento == null ? "" :dadosCadastraisModel.dataNascimento.toString();
    
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus dados")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: salvando 
        ? const Center(child: CircularProgressIndicator()) : ListView(
          children: [
            const Textlabel(texto: "Nome"),
            TextField(
              controller: nomeController,
            ),

            const Textlabel(texto: "Data de Nascimento"),
            TextField(
              controller: dataNascimentoController,
              readOnly: true,
              onTap: () async{
                var data = await showDatePicker(
                  context: context, 
                  initialDate: DateTime(2000, 1, 1),
                  firstDate: DateTime(1900, 5, 20), 
                  lastDate: DateTime(2023, 10, 23),
               );
                
              if(data != null){
                dataNascimentoController.text = data.toString();
                dadosCadastraisModel.dataNascimento = data;
              }

              },
            ),

            const Textlabel(texto: "Nível de experiência"),
            Column(children: niveis.map((nivel) => RadioListTile(
              dense: true,
              title: Text(nivel.toString()),
              selected: dadosCadastraisModel.nivelExperiencia == nivel,
              value: nivel,
              groupValue: dadosCadastraisModel.nivelExperiencia,
              onChanged: (value){
                print(value);
                setState(() {
                  dadosCadastraisModel.nivelExperiencia = value.toString();
                });
                
              }))
              .toList()),

            const Textlabel(texto: "Linguagens preferidas"),
            Column(
              children: linguagens
                .map((linguagem) => CheckboxListTile(
                    dense: true,
                    title: Text(linguagem),
                    value: dadosCadastraisModel.linguagens.contains(linguagem), 
                    onChanged: (bool? value){
                      if (value!){
                        setState(() {
                            dadosCadastraisModel.linguagens.add(linguagem);
                        });

                        
                      } else{
                        setState(() {
                          dadosCadastraisModel.linguagens.remove(linguagem);
                        });
                        
                      }
                    }),)                 
              .toList(),
            ),

          const Textlabel(texto: "Tempo de Experiência"),
            DropdownButton(
              value: dadosCadastraisModel.tempodeExperiencia,
              isExpanded: true,
              items: returnItens(50),
              onChanged: (value){
                setState(() {
                  dadosCadastraisModel.tempodeExperiencia = int.parse(value.toString());
                });
             }),

           Textlabel(
              texto: "Pretenção Salarial. R\$: ${dadosCadastraisModel.salario?.round().toString()}"),
            Slider(
              min: 0, 
              max:10000,  
              value: dadosCadastraisModel.salario ?? 0, 
              onChanged: (double value) {

              setState(() {
                dadosCadastraisModel.salario = value;
              });    
                
            
            }),

            TextButton(onPressed: () async{
              setState(() {
                salvando =false;
              });

              if(nomeController.text.trim().length < 3){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("O nome deve ser preenchido")));
                    return;
              }
              if(dadosCadastraisModel.dataNascimento == null){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Data de nascimento inválida")));
                    return;
              }

              if(dadosCadastraisModel.nivelExperiencia == null || dadosCadastraisModel.nivelExperiencia!.trim() == ''){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("O nível deve ser selecionado")));
                    return;
              }

              if(dadosCadastraisModel.linguagens.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Deve ser selecionado ao menos uma linguagem")));
                    return;
              }

              if(dadosCadastraisModel.tempodeExperiencia == null || dadosCadastraisModel.tempodeExperiencia == 0){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Deve ter ao menos um ano de experiência em uma das linguagens")));
                    return;
              }

              if(dadosCadastraisModel.salario == null || dadosCadastraisModel.salario == 0){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("A pretenção salarial deve ser maior que 0")));
                    return;
              }
              dadosCadastraisModel.nome = nomeController.text;
              dadosCadastraisRepository.salvar(dadosCadastraisModel);

              setState(() {
                salvando = true;
              });
              Future.delayed(const Duration(seconds: 3), (){
                 ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Dados salvo com sucesso!")));
                setState(() {
                salvando = false;
              });
              Navigator.pop(context);
            });
              
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 105, 47, 232))
              ),
              child: const Text("Salvar",
                style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ))
              
              ],
        ),
      ),
    );
  }
}