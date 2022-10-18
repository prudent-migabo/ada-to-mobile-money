import 'package:crypto_mob_app/screens/create_wallet_screen/components/components.dart';
import 'package:flutter/material.dart';

class CreateWalletScreen extends StatelessWidget {
  const CreateWalletScreen({Key? key}) : super(key: key);
  static const String routeName = '/CreateWalletScreen';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => CreateWalletScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CreateWalletForm(),
      ),
    );
  }
}
