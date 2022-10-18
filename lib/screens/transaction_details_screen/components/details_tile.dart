import 'package:crypto_mob_app/utils/utils.dart';
import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Mobile Money to ADA', style: bold,),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.red,
              child: Container(
                width: 70,
                height: 20,
                child: Center(child: Text('Failed', style: TextStyle(fontSize: 12),),),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dollar Amount :', style: kGreyTextColor,),
            Text("\$2.900"),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dodging in ADA :', style: kGreyTextColor,),
            Text("\$2.900"),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Destination Number :', style: kGreyTextColor,),
            Text("56712394HDI"),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recipient Full Name :', style: kGreyTextColor,),
            Text("Prudent MIGABO"),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Transaction Fees :', style: kGreyTextColor,),
            Text("\$5"),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Telecommunication Network :', style: kGreyTextColor,),
            Text("JKHLI"),
          ],
        ),
      ],
    );
  }
}
