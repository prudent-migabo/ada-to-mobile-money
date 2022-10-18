import 'package:flutter/material.dart';

void isLoading({
  BuildContext? context,
}) => showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (context)=> Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(child: CircularProgressIndicator()),
      ),
    ));

class IsLoading extends StatelessWidget {
  const IsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(),);
  }
}
