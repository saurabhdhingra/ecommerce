import 'package:flutter/material.dart';
import 'package:ecommerce/screens/navscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const NavScreen(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: Image.asset(
            'assets/splash.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
