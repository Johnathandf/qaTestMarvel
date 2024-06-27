import 'package:flutter/material.dart';
import 'package:trilhaapp/shered/app_images.dart';



class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.user01,
        height: 50,
        ),
         Image.asset(
          AppImages.user02,
        height: 50,
        ),
         Image.asset(
          AppImages.user03,
        height: 50,
        ),
         Image.asset(
          AppImages.paisagem01,
        height: 50,
        ),
         Image.asset(
          AppImages.paisagem02,
        height: 50,
        ),
         Image.asset(
          AppImages.paisagem03,
        height: 50,
        ),
        
      ],

    );
  }
}