import 'package:crypto_mob_app/screens/home_screen/components/components.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/HomeScreen';
  static Route route(){
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) =>  HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return HomeComponents();
  }
}

