import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/consulta_cep.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/list_view.dart';
import 'package:trilhaapp/pages/list_view_horizontal.dart';
import 'package:trilhaapp/pages/tarefa_page/tarefa_sqflite_page.dart';
import 'package:trilhaapp/shered/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("QaTest")),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value){
                  setState(() {
                    posicaoPagina = value;
                  });
                  
                },
                children: const [
                ConsultaCEP(),
                CardPage(),
                ImageAssetsPage(),
                ListViewPage(),
                ListViewHorizontal(),
                TarefaSQFLitePage()
                
                
              ],),
          ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                controller.jumpToPage(value);

              },

              currentIndex: posicaoPagina, items: const [
              BottomNavigationBarItem(label: "Http", icon: Icon(Icons.get_app_rounded)),
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "Usuario", icon: Icon(Icons.person)),
              BottomNavigationBarItem(label: "Menssagens", icon: Icon(Icons.chat)),
              BottomNavigationBarItem(label: "Feed", icon: Icon(Icons.image)),
              BottomNavigationBarItem(label: "Tarefas", icon: Icon(Icons.list)),
          
        ]),




          ],
        ),

      ),
    );
  }
}