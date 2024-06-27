import 'package:flutter/material.dart';
import 'package:trilhaapp/shered/app_images.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(elevation: 6, child: Image.asset(AppImages.paisagem01)),
                Card(elevation: 6, child: Image.asset(AppImages.paisagem02)),
                Card(elevation: 6, child: Image.asset(AppImages.paisagem03)),
                Card(elevation: 6, child: Image.asset(AppImages.paisagem01)),
                Card(elevation: 6, child: Image.asset(AppImages.paisagem02)),
                Card(elevation: 6, child: Image.asset(AppImages.paisagem03)),
                      
            ]),
          ),
          Expanded(flex: 3, child: Container(

          ))
        ],
      ),
    );
  }
}