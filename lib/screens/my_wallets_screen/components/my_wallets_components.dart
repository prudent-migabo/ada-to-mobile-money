import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class MyWalletsComponents extends StatelessWidget {
  const MyWalletsComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Row(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context, 'okay');
                  },
                  child: Icon(Icons.arrow_back_rounded, color: primary,)),
              SizedBox(width: 15,),
              Text('My Wallet', style: TextStyle(color: primary, fontSize: 30, fontWeight: boldStyle),),
            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Container(
              height: double.infinity,
              child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index){
              return Column(
                children: [
                  Card(
                    color: Colors.blue[50],
                    child: Container(
                      height: 90,
                      child: Center(
                        child: ListTile(
                        leading: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: primary,
                            child: Container(
                              width: 50,
                                height: 60,
                                child: Icon(Icons.account_balance_wallet_rounded, color: Colors.white,))),
                        title: Text('Prudent MIGABO', style: bold,),
                        subtitle: Text('3456MN|00'),
                          trailing: RoundedButtonWithIcon(
                            radius: 7,
                            icon: Icon(Icons.delete_outline_outlined, color: primary, size: 15,),
                            onPressed: (){},
                            label: Text('Delete', style: TextStyle(fontSize: 12, color: primary),),
                            primary: Colors.blue[50],
                            borderColor: primary,
                            elevation: 0.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
