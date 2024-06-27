import 'package:flutter/material.dart';

class Textlabel extends StatelessWidget {

  final String texto;
  const Textlabel({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }
}