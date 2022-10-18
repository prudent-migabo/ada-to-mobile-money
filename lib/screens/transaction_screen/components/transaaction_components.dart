import 'package:crypto_mob_app/screens/screens.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class TransactionComponents extends StatelessWidget {
  const TransactionComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(height: 40,),
        Container(
          padding: EdgeInsets.only(left: 35),
            child: Text('Transactions', style: TextStyle(fontSize: 30, color: kMainColor, fontWeight: boldStyle),)),
        SizedBox(height: 30,),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: 10,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    Card(
                      elevation: 0.0,
                     color: Colors.grey[200],
                      child: Container(
                        height: 50,
                        width: width,
                        child: Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.red[100],
                              child: Icon(Icons.call_made_sharp, color: Colors.red, size: 17,),
                            ),
                            title: Text("\$2,900 to ADA"),
                            trailing: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              color: Colors.red,
                              child: Container(
                                width: 70,
                                height: 20,
                                child: Center(child: Text('Failed', style: TextStyle(fontSize: 12),),),
                              ),
                            ),
                            onTap: (){
                              Navigator.pushNamed(context, TransactionDetailsScreen.routeName);
                            },
                          ),
                        ),
                      ),
                    ),
                     SizedBox(height: 15,),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
