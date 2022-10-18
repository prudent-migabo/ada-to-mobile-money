import 'package:crypto_mob_app/screens/login_screen/components/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/LoginScreen';
  static Route route(){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
        builder: (context) => LoginScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
          child: LoginComponents()),
    );
  }
}
