import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nutri_lens/pages/pages.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    NewScan(),
    AllScans(),
    Stats(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                //print(index);
              });
            },
            haptic: true,
            gap: 8,
            textSize: 20,
            padding: EdgeInsets.all(16),
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            duration: Duration(milliseconds: 300),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.camera_alt_rounded,
                text: "New Scan",
              ),
              GButton(
                icon: Icons.document_scanner_rounded,
                text: "All Scans",
              ),
              GButton(
                icon: Icons.pie_chart_rounded,
                text: "Stats",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
