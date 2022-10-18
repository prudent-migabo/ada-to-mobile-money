import 'package:crypto_mob_app/screens/conversion_screen/convert_ada/components/components.dart';
import 'package:flutter/material.dart';

class ConvertAdaScreen extends StatelessWidget {
  const ConvertAdaScreen({Key? key}) : super(key: key);
  static const String routeName = '/ConvertADA';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => ConvertAdaScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConvertAdaComponents(),
      ),
    );
  }
}
