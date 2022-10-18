import 'package:crypto_mob_app/screens/register_screen/components/components.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
   static const String routeName = '/RegisterScreen';
   static Route route(){
     return MaterialPageRoute(
         settings: const RouteSettings(name: routeName),
         builder: (context) =>  RegisterScreen());
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: RegisterComponents(),
      ),
    );
  }
}
