import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class SuccessfulCreationWallet extends StatelessWidget {
  const SuccessfulCreationWallet({Key? key}) : super(key: key);
  static const String routeName='/SuccessfulCreationWallet';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context)=> SuccessfulCreationWallet());
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final primary = Theme.of(context).colorScheme.primary;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(height: 60,),
            Text("Wallet created successfuly", style: TextStyle(color: primary, fontWeight: boldStyle, fontSize: 35), textAlign: TextAlign.center,),
            SizedBox(height: 80,),
            Image(image: AssetImage(Assets.cup)),
            SizedBox(height: 120,),
            CustomButton(text: 'Go to wallet', onPressed: (){
              _onSubmit(context);
            }, width: width, height: 60,),
          ],
        ),
      ),
    );
  }
  Future _onSubmit(BuildContext context) async{
    var res = await Navigator.pushNamed(context, MyWalletsScreen.routeName);
    if(res == 'okay'){
      Navigator.pushNamed(context, BottomNavigationScreen.routeName);
    }

  }
}
