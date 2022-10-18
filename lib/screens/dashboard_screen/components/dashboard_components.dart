import 'package:crypto_mob_app/screens/dashboard_screen/components/components.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:flutter/material.dart';

class DashboardComponents extends StatelessWidget {
  const DashboardComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text('Dashboard', style: TextStyle(color: kMainColor, fontSize: 35, fontWeight: boldStyle),)),
        SizedBox(height: 20,),
        CryptoReceivedComponent(),
        SizedBox(height: 10,),
        TileForAddAndConvert(),
        SizedBox(height: 20,),
        TransactionHistory()
      ],
    );
  }
}


