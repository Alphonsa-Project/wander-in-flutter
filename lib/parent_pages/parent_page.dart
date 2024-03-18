import 'package:flutter/material.dart';
import 'package:wander_in/parent_pages/profile.dart';
import 'package:wander_in/parent_pages/home_page.dart';
import 'package:wander_in/parent_pages/map.dart';
import 'package:wander_in/parent_pages/notification.dart';
import 'package:wander_in/parent_pages/plans.dart';

class ParentPage extends StatefulWidget {
  // final String user_type;
  const ParentPage({
    super.key,
    // required this.user_type,
  });

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  int selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        pageSnapping: true,
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        children: const [
          HomePage(),
          MapPage(),
          Planspage(),
          NotificationPage(),
          Profile()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(microseconds: 500),
              curve: Curves.easeIn);
        },
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        //type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              //backgroundColor: Colors.white,
              icon: Icon(Icons.home_rounded),
              activeIcon: Icon(Icons.home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_pin),
              activeIcon: Icon(Icons.location_on),
              label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              activeIcon: Icon(Icons.add_circle_outlined),
              label: "plan"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              activeIcon: Icon(Icons.notifications),
              label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              activeIcon: Icon(Icons.people),
              label: "Account"),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 15, height: .9),
        unselectedLabelStyle: const TextStyle(fontSize: 10, height: .8),
      ),
    );
  }
}
