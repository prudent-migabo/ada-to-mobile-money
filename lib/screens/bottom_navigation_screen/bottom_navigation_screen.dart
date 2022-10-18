import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
   BottomNavigationScreen({Key? key}) : super(key: key);
  static const String routeName = '/BottomNavigationScreen';
  static Route route(){
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) =>  BottomNavigationScreen());
  }

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
   List<Widget> _pages = [
     HomeScreen(),
     DashboardScreen(),
     TransactionScreen(),
     ProfileScreen(),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 7,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          iconSize: 30,
          selectedIconTheme: IconThemeData(color: kMainColor),
          selectedItemColor: kMainColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'DashBoard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cached_rounded),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
