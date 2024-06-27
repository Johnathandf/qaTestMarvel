import 'dart:math';
import 'package:flutter/material.dart';
import 'package:trilhaapp/services/app_storage_service.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({super.key});

  @override
  State<NumerosAleatoriosHivePage> createState() => _NumerosAleatoriosHivePageState();
}

class _NumerosAleatoriosHivePageState extends State<NumerosAleatoriosHivePage> {
  int numeroGerado = 0;
  int quantidadeCliques = 0;
 AppStorageService storage = AppStorageService();

@override
  void initState() {
    
    super.initState();
    carregarDados();
  }
  void carregarDados() async {
     numeroGerado = await storage.getNumeroAleatorio();
      quantidadeCliques = await storage.getQuantidadeDeCliques();
     setState(() {
        
       
     });
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Gerador de números aleátorios"),),
        body: Container(
          alignment: Alignment.center,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado == null ? "Nenhum numero gerado" : numeroGerado.toString(), 
              style:  TextStyle(fontSize: 25),
              ),
              Text(
                quantidadeCliques == null ? "Nenhum clique efetuado" : quantidadeCliques.toString(), 
              style:  TextStyle(fontSize: 25),
              )
          ],),),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeCliques = quantidadeCliques  + 1;
            });
              await storage.setNumeroAleatorio(numeroGerado);   
              await storage.setQuantidadeDeCliques(quantidadeCliques);          
          },
          ),
      ),
    );
  }
}