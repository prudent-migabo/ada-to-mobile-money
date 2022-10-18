import 'package:crypto_mob_app/screens/conversion_screen/convert_mobile/components/components.dart';
import 'package:flutter/material.dart';

class ConvertMobileScreen extends StatelessWidget {
  const ConvertMobileScreen({Key? key}) : super(key: key);
  static const String routeName = '/ConvertMobileScreen';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => ConvertMobileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConvertMobileComponents(),
      ),
    );
  }
}
