import 'package:crypto_mob_app/screens/recovery_phrase_screen/components/components.dart';
import 'package:flutter/material.dart';

class RecoveryPhraseScreen extends StatelessWidget {
  const RecoveryPhraseScreen({Key? key}) : super(key: key);
  static const String routeName = '/RecoveryPhraseScreen';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => RecoveryPhraseScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: RecoveryPhraseComponents(),
      ),
    );
  }
}
