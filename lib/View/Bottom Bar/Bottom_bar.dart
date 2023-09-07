import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Braelo Adds/Adds.dart';
import '../Component/drawer.dart';
import '../Explorer/PageMapView.dart';
import '../Home Screen/Home_Screen.dart';
import '../Listing/New_Listing.dart';
import '../Messages/Messages.dart';

class Bottom_bar extends StatefulWidget {
  const Bottom_bar({Key? key}) : super(key: key);

  @override
  State<Bottom_bar> createState() => _Bottom_barState();
}

class _Bottom_barState extends State<Bottom_bar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  static List<Widget> _widgetOptions = <Widget>[
    Home_Screen(),
    ExplorePageMapView(),
    New_Listing(),
    Adds(),
    drawer(),
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Explore',
      style: optionStyle,
    ),
    Text(
      'Index 2: New Listing',
      style: optionStyle,
    ),
    Text(
      'Index 3: Ads',
      style: optionStyle,
    ),
    Text(
      'Index 4: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/Home.svg",
              height: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/Explore.svg", height: 30),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/New_Listing.svg", height: 30),
            label: 'New Listing',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/Adds.svg", height: 30),
            label: 'Ads',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/Account.svg", height: 30),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xfff78828a),
        unselectedItemColor: Color(0xfff78828a),
        showSelectedLabels: true,
        selectedFontSize: 15,
        unselectedFontSize: 10,

        showUnselectedLabels: true,
        // Show labels for the unselected items
        onTap: _onItemTapped,
      ),
    );
  }
}
