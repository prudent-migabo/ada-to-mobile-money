import 'package:crypto_mob_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CardForProfileInfo extends StatelessWidget {
   CardForProfileInfo({Key? key, required this.text}) : super(key: key);

   String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.grey[200],
      child: Container(
        height: 55,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: bold,),
            Icon(Icons.edit, color: Theme.of(context).colorScheme.primary,),
          ],
        ),
      ),
    );
  }
}
