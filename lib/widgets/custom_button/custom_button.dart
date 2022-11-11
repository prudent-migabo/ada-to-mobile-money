import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key, required this.text, required this.onPressed, this.width, this.height, this.textColor, this.buttonColor}) : super(key: key);
   String text;
   VoidCallback onPressed;
   double? width;
   double? height;
   Color? textColor;
   Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
        height: height,
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(
           backgroundColor: buttonColor,
          ),
            onPressed: onPressed,
            child: Text(text, style: bold.copyWith(fontSize: 16, color: textColor),),
        ));
  }
}
