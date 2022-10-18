import 'package:flutter/material.dart';

class ContainerForLogos extends StatelessWidget {
   ContainerForLogos({Key? key, required this.image, required this.onTap}) : super(key: key);
  ImageProvider image;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade500),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Center(child: Image(image: image, width: 20, height: 20,)),
      ),
    );
  }
}
