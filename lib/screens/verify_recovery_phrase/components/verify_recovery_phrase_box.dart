import 'package:crypto_mob_app/utils/utils.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class VerifyRecoveryPhraseBox extends StatelessWidget {
  const VerifyRecoveryPhraseBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(15),
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: primary, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 20,
        runSpacing: 20,
        children: [
          CustomSelector(text: 'Failed'),
          CustomSelector(text: 'Temperature'),
          CustomSelector(text: 'Failed'),
          CustomSelector(text: 'Failed'),
          CustomSelector(text: 'Classics'),
          CustomSelector(text: 'Classics'),
          CustomSelector(text: 'Testing'),
          CustomSelector(text: 'Temperature'),
          CustomSelector(text: 'Temperature'),
          CustomSelector(text: 'Failed'),
          CustomSelector(text: 'Celebrate'),
          CustomSelector(text: 'Telephone'),
          CustomSelector(text: 'Celebrate'),
          CustomSelector(text: 'Telephone'),
          CustomSelector(text: 'Classics'),
        ],
      ),
    );
  }
}

class CustomSelector extends StatelessWidget {
   CustomSelector({
    Key? key, required this.text, this.onPressed,
  }) : super(key: key);

  String text;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: RoundedButtonWithoutIcon(
        elevation: 0.0,
        onPressed: (){}, label: Text(text, style: kStyleRecoveryPhrase,), radius: 20, primary: Colors.grey[200],),
    );
  }
}
