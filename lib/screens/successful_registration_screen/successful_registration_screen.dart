import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class SuccessfulRegistrationScreen extends StatelessWidget {
  const SuccessfulRegistrationScreen({Key? key}) : super(key: key);
  static const String routeName='/SuccessfulRegistrationScreen';

  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context)=> SuccessfulRegistrationScreen());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(height: 60,),
            Text("Account created successfuly", style: TextStyle(color: kMainColor, fontWeight: boldStyle, fontSize: 35), textAlign: TextAlign.center,),
            SizedBox(height: 80,),
            Image(image: AssetImage(Assets.cup)),
            SizedBox(height: 120,),
            CustomButton(text: 'Proceed', onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, BottomNavigationScreen.routeName, (route) => false);
            }, width: width, height: 60,),
          ],
        ),
      ),
    );
  }
}
