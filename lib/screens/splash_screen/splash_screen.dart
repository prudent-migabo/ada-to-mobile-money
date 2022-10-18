import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName='/SplashScreen';

  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context)=> SplashScreen());
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Image(image: AssetImage(logo),),
      ),
      nextScreen: Wrapper(),
      splashTransition: SplashTransition.scaleTransition,
      duration: 3000,
      backgroundColor: kMainColor,
    );
  }
}