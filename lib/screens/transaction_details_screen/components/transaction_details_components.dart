import 'package:crypto_mob_app/screens/transaction_details_screen/components/components.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class TransactionDetailsComponents extends StatelessWidget {
  const TransactionDetailsComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_rounded, color: primary,)),
            SizedBox(width: 15,),
            Text('Transactions', style: TextStyle(color: primary, fontSize: 30, fontWeight: boldStyle),),
          ],
        ),
        SizedBox(height: 25,),
        Card(
          elevation: 0.0,
          color: Colors.grey[100],
          child: Container(
            width: width,
            padding: EdgeInsets.all(15),
            child: DetailsTile(),
          ),
        )
      ],
    );
  }
}
