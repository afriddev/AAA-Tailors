import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../state/stateProvider.dart';
import 'package:provider/provider.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({Key? key}) : super(key: key);

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  @override
  Widget build(BuildContext context) {
    dynamic _deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(bottom: 5, left: 2, right: 2),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: GNav(
                onTabChange: (index) {
                  Provider.of<stateProvider>(context, listen: false)
                      .searchField
                      .clear();
                  Provider.of<stateProvider>(context, listen: false)
                      .setNavIndex(index);
                },
                tabBackgroundColor: Colors.purple.shade50,
                color: Colors.black,
                activeColor: Color(0xffda00ff),
                selectedIndex:
                    Provider.of<stateProvider>(context, listen: true).navIndex,
                curve: Curves.easeInOut, // tab animation curves
                duration: Duration(milliseconds: 900),
                gap: 2,
                padding: EdgeInsets.all(10),
                textStyle: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                        color: Color(0xffda00ff),
                        fontWeight: FontWeight.w400)),
                tabs: [
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: Icons.shopping_bag_outlined,
                    text: 'Bag',
                  ),
                  GButton(
                    icon: Icons.person_2_outlined,
                    text: 'Profile',
                  )
                ]),
          ),
        ));
  }
}
