import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Container(
        width: width,
        height: 115,
        color: kMainColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: kMainColor,),
              hintText: 'Search',
              hintStyle: TextStyle(color: kMainColor),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}