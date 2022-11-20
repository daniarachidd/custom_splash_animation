import 'package:custom_splash_animation/constants/colors.dart';
import 'package:custom_splash_animation/constants/images_string.dart';
import 'package:custom_splash_animation/constants/sizes.dart';
import 'package:custom_splash_animation/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {
  bool animate = false;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children:  [
          AnimatedPositioned(
            top: animate ? 0 : -30,
            left: animate ? 0 : -30,
            duration: const Duration(milliseconds: 2000),
            child: const Image(
              image: AssetImage(tSplashTopIcon),
            ),
          ),
          AnimatedPositioned(
            top: 150,
            left: animate ? defaultSize : -100,
            duration: const Duration(milliseconds: 2000),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: animate ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(appName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400 ),),
                  Text(tagline, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            bottom: animate ? 100 : -100,
            child: const Image(
              image: AssetImage(splashImage),
            ),
          ),
          AnimatedPositioned(
            bottom: 40,
            right: animate ? defaultSize : -40,
            duration: const Duration(milliseconds: 2000),
            child: Container(
              width: splashContainerSize,
              height: splashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: primaryColor,
              ),

            ),
          )
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500)); // 1/2 seconds
    setState(() {
      animate = true;
    });

    await Future.delayed(const Duration(milliseconds: 5000)); // 5 seconds
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));

  }
}
