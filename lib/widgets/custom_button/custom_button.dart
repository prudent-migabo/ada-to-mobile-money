import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key, required this.text, required this.onPressed, this.width, this.height}) : super(key: key);
   String text;
   VoidCallback onPressed;
   double? width;
   double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
        height: height,
        child: ElevatedButton(onPressed: onPressed, child: Text(text, style: bold.copyWith(fontSize: 16),)));
  }
}
