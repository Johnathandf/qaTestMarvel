import 'package:flutter/material.dart';

import '../shered/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
          ListTile(
          leading: Image.asset(AppImages.user03),
          title: Text("Usuário 03"),
          subtitle:  const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text("Olá! tudo bem"),
              Text("08:59"),
            ],
          ),
          trailing:  PopupMenuButton<String>(
             onSelected: (menu) {
               
             },
             itemBuilder: (BuildContext bc) {
               return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(value: "Menu 1", child: Text("Opção 1")),
                const PopupMenuItem<String>(value: "Menu 2", child: Text("Opção 2")),
                const PopupMenuItem<String>(value: "Menu 3", child: Text("Opção 3")),
                  
               ];
             },

             ),
          // isThreeLine: true,
        ),
        Image.asset(AppImages.user01),
        Image.asset(AppImages.user02),
        Image.asset(AppImages.user03),
        Image.asset(AppImages.paisagem01),
        Image.asset(AppImages.paisagem02),
        Image.asset(AppImages.paisagem03)
        ],
    );

  }
}