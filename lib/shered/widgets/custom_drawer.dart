
import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/characters/characters_page.dart';
import 'package:trilhaapp/pages/configuracoes/configuracoes_hive_page.dart';
import 'package:trilhaapp/pages/dados_Cadastrais/dados_cadastrais_hive.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/numeros_aleatorios/numeros_aleatorios_hive_page%20.dart';
import 'package:trilhaapp/pages/posts_page.dart';
import 'package:trilhaapp/shered/app_images.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: (BuildContext){
                  return Wrap(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },

                        title: const Text("Camera"),
                        leading: const Icon(Icons.camera),
                      ),
                       ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: const Text("Galeria"),
                        leading: const Icon(Icons.album),
                      ),

                  ],);
                });
              },
              child: UserAccountsDrawerHeader(
                decoration:const BoxDecoration(color: Colors.blue) ,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
              child: Image.asset(AppImages.qatest,height: 50,),),
              accountName: const Text("Johnathan Lemes"), 
              accountEmail: const Text("email@email.com")),
            ),
            
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 5),
                    Text("Dados cadastrais"),
                  ],
                )),
             onTap: () {
              Navigator.pop(context);
               Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => const DadosCadastraisHivePage()));
              
             },
            ),
          
            const Divider(),
            const SizedBox(height: 10,),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(width: 5),
                    Text("Termos de uso e privacidade"),
                  ],
                )),
             onTap: () {
               showModalBottomSheet(context: context, builder: (BuildContext bc){
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  child: const Column(
                    children: [
                      Text("Termos de uso e privacidade", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                      SizedBox(height: 20),
                      Text(
                      "Ao utilizar nossos serviços, você concorda com a coleta e o uso de suas informações conforme descrito neste documento. Comprometemo-nos a proteger sua privacidade e garantir que suas informações sejam utilizadas apenas para melhorar sua experiência. Não compartilharemos seus dados pessoais com terceiros sem seu consentimento prévio. Esteja ciente de que podemos atualizar este termo periodicamente, e recomendamos que você revise-o regularmente para estar informado sobre quaisquer alterações.", 
                      style: TextStyle(fontSize: 16),),
                    ],
                  ),);
               });
             },
            ),
            const Divider(),
            const SizedBox(height: 10,),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 5),
                    Text("Configurações"),
                  ],
                )),
             onTap: () {
              Navigator.pop(context);
               Navigator.push(context, MaterialPageRoute(
                builder: (bc) => 
                const ConfiguracaoHivePage() ));
              },
             ),
              const Divider(),
            const SizedBox(height: 10,),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.numbers),
                    SizedBox(width: 5),
                    Text("Gerador de números"),
                  ],
                )),
             onTap: () {
              Navigator.pop(context);
               Navigator.push(context, MaterialPageRoute(
                builder: (bc) => 
                const NumerosAleatoriosHivePage() ));
              },
             ),
             const SizedBox(
              height: 10,
              ),

              const Divider(),
            const SizedBox(height: 10,),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.post_add),
                    SizedBox(width: 5),
                    Text("Posts"),
                  ],
                )),
             onTap: () {
              Navigator.pop(context);
               Navigator.push(context, MaterialPageRoute(
                builder: (bc) => 
                const PostPage() ));
              },
             ),
             const Divider(),
             const SizedBox(
              height: 10,
              ),
            
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.help),
                    SizedBox(width: 5),
                    Text("Herois"),
                  ],
                )),
             onTap: () async{
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (bc) => const CharactersPage()));
             
              },
             ),
              const Divider(),
            const SizedBox(height: 10,),

            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 5),
                    Text("Sair"),
                  ],
                )),
             onTap: () {
               showDialog(context: context,
                builder: (BuildContext bc){
                  return  AlertDialog(
                    alignment: Alignment.centerLeft,
                    elevation: 8,


                    title: const Text("Sair", style: TextStyle(fontWeight: FontWeight.bold),),
                    content: const Wrap(
                      children: [
                        Text("Você sairá do aplicativo!"),
                        Text("Deseja realmente sair do aplicativo?"),
                      ],
                    ),
                    actions: [
                      TextButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: const Text("Não")),
                      TextButton(onPressed: () {
                        Navigator.pushReplacement(context, 
                          MaterialPageRoute(builder: (context) => const LoginPage()));
                      }, child: const Text("Sim")),
                    ],
                  );
               });
              },
             ),
            ],
          ),
        );
  }
}