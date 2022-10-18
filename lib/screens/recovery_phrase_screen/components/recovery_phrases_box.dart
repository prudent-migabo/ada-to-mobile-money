import 'package:flutter/material.dart';

class RecoveryPhrasesBox extends StatelessWidget {
  const RecoveryPhrasesBox({Key? key}) : super(key: key);

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
          Text('Failed'),
          Text('Temperature'),
          Text('Failed'),
          Text('Failed'),
          Text('Classics'),
          Text('Classics'),
          Text('Testing'),
          Text('Temperature'),
          Text('Temperature'),
          Text('Failed'),
          Text('Celebrate'),
          Text('Telephone'),
          Text('Celebrate'),
          Text('Telephone'),
          Text('Classics'),
        ],
      ),
    );
  }
}
