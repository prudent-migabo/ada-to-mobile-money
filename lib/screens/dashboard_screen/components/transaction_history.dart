import 'package:crypto_mob_app/utils/utils.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerRoundedForDash().copyWith(color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 5.0,
          spreadRadius: 2.0,
          offset: Offset(2.0, 2.0),
        )
      ],),
      height: 300,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
              child: Text('Transaction history', style: TextStyle(fontSize: 22, color: kMainColor, fontWeight: boldStyle),)),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
               itemCount: 10,
               itemBuilder: (context, index){
                 return Column(
                   children: [
                     ListTile(
                       leading: CircleAvatar(
                         radius: 15,
                         backgroundColor: Color(0xfffdd6d8),
                         child: Icon(Icons.call_made_sharp, color: Colors.red, size: 17,),
                       ),
                       title: Text("\$2,900 ADA", style: bold,),
                       trailing: Card(
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                         color: Color(0xfffd4a55),
                         child: Container(
                           width: 70,
                           height: 20,
                           child: Center(child: Text('Failed', style: TextStyle(fontSize: 12),),),
                         ),
                       ),
                     ),
                     SizedBox(height: 10,),
                     Divider(height: 1, color: Colors.grey[300],),
                     SizedBox(height: 10,),
                   ],
                 );
               }),
          ),
        ],
      ),
    );
    //   Container(
    //   padding: EdgeInsets.all(10),
    //   height: 300,
    //   decoration: containerRoundedForDash().copyWith(color: Colors.white,
    //   boxShadow: [
    //     BoxShadow(
    //       color: Colors.grey.shade300,
    //       blurRadius: 5.0,
    //       spreadRadius: 2.0,
    //       offset: Offset(2.0, 2.0),
    //     )
    //   ]),
    //   child: ListView.builder(
    //     itemCount: 10,
    //       itemBuilder: (context, index){
    //     return Column(
    //       children: [
    //         ListTile(
    //           leading: CircleAvatar(
    //             radius: 15,
    //             backgroundColor: Colors.red[200],
    //             child: Icon(Icons.call_made_sharp, color: Colors.red,),
    //           ),
    //       ),
    //         Divider(height: 1, color: Colors.grey,),
    //       ],
    //     );
    //   }),
    // );
  }
}