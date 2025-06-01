import 'package:flutter/material.dart';
import 'package:grocery_app/src/views/auth_views/forgot_password/forgot_password_view.dart';
import 'package:grocery_app/src/views/auth_views/sign_in_view/sign_in_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/cart_nav_view/cart_nav_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/favorite_nav_view/favorite_nav_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/home_nav_view/home_nav_view.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/profile_view/profile_nav_view.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _currentIndex = 0;
  late final PageController _pageController;

  final List<Widget> _tabs = [
   HomeNavView(),
    ProfileNavView(),
   FavoriteNavView(),
    CartNavView()
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _tabs,
        onPageChanged: (index) => setState(() => _currentIndex = index),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          StylishBottomBar(
            option: AnimatedBarOptions(
              barAnimation: BarAnimation.fade,
              iconStyle: IconStyle.animated,
              opacity: 0.3,
            ),
            items: [
              BottomBarItem(
                icon: const Icon(Icons.home_outlined,color: Colors.grey,),
                title: const Text('Home',style: TextStyle(color: Colors.green),),
                selectedIcon: const Icon(Icons.home,color: Colors.green,),
              ),
              BottomBarItem(
                icon: const Icon(Icons.person_outline,color: Colors.grey,),
                title: const Text('Profile',style: TextStyle(color: Colors.blue),),
                selectedIcon: const Icon(Icons.person,color: Colors.blue,),
              ),
              BottomBarItem(
                icon: const Icon(Icons.favorite_border,color: Colors.grey,),
                title: const Text('Favorite',style: TextStyle(color: Colors.red),),
                selectedIcon: const Icon(Icons.favorite,color: Colors.red,),
              ),
              // Placeholder for spacing, no icon here
              BottomBarItem(
                icon: const SizedBox.shrink(),
                title: const SizedBox.shrink(),
                backgroundColor: Colors.transparent,
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              // Prevent selecting the floating button slot
              if (index == 3) return;
              setState(() {
                _currentIndex = index;
                _pageController.jumpToPage(index);
              });
            },
          ),
          // Floating action button for the last item
          Positioned(
            right: 16,
            bottom: 8,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              elevation: 6,
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                  _pageController.jumpToPage(3);
                });
              },
              child: const Icon(Icons.shopping_cart,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
