import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomBar.dart';
import '../screens/navScreens/export.dart';

class NavScreen extends StatefulWidget {
  final int currentIndex;
  const NavScreen({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<List> _screensData = [
    [
      CupertinoIcons.home,
      'Home',
      const Home(key: PageStorageKey('homeScreen'))
    ],
    [
      Icons.bookmarks_outlined,
      'Catalog',
      const Catalog(key: PageStorageKey('catalog'))
    ],
    [CupertinoIcons.cart, 'Cart', const Cart(key: PageStorageKey('cart'))],
    [CupertinoIcons.heart, 'Wishlist', const Wish(key: PageStorageKey('wish'))],
    [
      CupertinoIcons.person,
      'Profile',
      const Profile(key: PageStorageKey('profile'))
    ],
  ];
  final List<Widget> _screens = [
    const Home(key: PageStorageKey('homeScreen')),
    const Catalog(key: PageStorageKey('catalog')),
    const Cart(key: PageStorageKey('cart')),
    const Wish(key: PageStorageKey('wish')),
    const Profile(key: PageStorageKey('profile')),
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomBar(
              screens: _screensData,
              setIndex: (int value) => setState(() => _currentIndex = value),
              index: _currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}
