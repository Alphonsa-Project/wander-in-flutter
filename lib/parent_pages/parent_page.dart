import 'package:flutter/material.dart';
import 'package:wander_in/home1.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({
    Key? key,
  }) : super(key: key);

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
        children: const [home1(), home1(), home1()],
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
        selectedItemColor: const Color(0xff0054B3),
        unselectedItemColor: Colors.black26,
        //type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              //backgroundColor: Colors.white,
              icon: Icon(Icons.home_rounded),
              activeIcon: Icon(Icons.home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              activeIcon: Icon(Icons.home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              activeIcon: Icon(Icons.home_filled),
              label: "Home"),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 15, height: .9),
        unselectedLabelStyle: const TextStyle(fontSize: 10, height: .8),
      ),
    );
  }
}
