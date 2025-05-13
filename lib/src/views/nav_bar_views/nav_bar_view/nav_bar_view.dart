import 'package:flutter/material.dart';
import 'package:grocery_app/src/views/auth_views/forgot_password/forgot_password_view.dart';
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
    ForgotPasswordView(),
    ForgotPasswordView(),
    ForgotPasswordView(),
    ForgotPasswordView(),
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
      bottomNavigationBar: StylishBottomBar(
        option: DotBarOptions(
          dotStyle: DotStyle.tile,
          gradient: const LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.pink,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        items: [
          BottomBarItem(
            icon: const Icon(Icons.abc),
            title: const Text('Abc'),
            backgroundColor: Colors.red,
            selectedIcon: const Icon(Icons.read_more),
          ),
          BottomBarItem(
            icon: const Icon(Icons.safety_divider),
            title: const Text('Safety'),
            backgroundColor: Colors.orange,
          ),
          BottomBarItem(
            icon: const Icon(Icons.cabin),
            title: const Text('Cabin'),
            backgroundColor: Colors.purple,
          ),
          BottomBarItem(
            icon: const Icon(Icons.cabin),
            title: const Text('Cabin'),
            backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
