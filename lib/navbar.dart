import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nutri_lens/pages/pages.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> _widgetOptions = const <Widget>[
    HomePage(),
    NewScan(),
    AllScans(),
    Stats(),
  ];

  int _selectedIndex = 0;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Color.fromARGB(255, 0, 0, 0),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 500),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 50.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/stockpfp.jpg',
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.account_circle_rounded),
                title: Text('Profile'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.info_outline),
                title: Text('About'),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('NutriLens'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _handleMenuButtonPressed,
          backgroundColor: Colors.black,
          child: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: _advancedDrawerController,
            builder: (_, value, __) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: Icon(
                  value.visible ? Icons.arrow_forward_rounded : Icons.person,
                  key: ValueKey<bool>(value.visible),
                  size: 30,
                ),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
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
              tabs: const [
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
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
