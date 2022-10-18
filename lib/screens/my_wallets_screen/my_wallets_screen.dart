import 'package:crypto_mob_app/screens/my_wallets_screen/components/components.dart';
import 'package:flutter/material.dart';

class MyWalletsScreen extends StatelessWidget {
  const MyWalletsScreen({Key? key}) : super(key: key);
  static const String routeName = '/MyWalletsScreen';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => MyWalletsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyWalletsComponents(),
    );
  }
}
