// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(
                flex: 3,
              ),
              Lottie.asset(
                'assets/images/splash.json',
                controller: _animationController,
                height: 350,
                animate: true,
                onLoaded: (composition) {
                  _animationController
                    ..duration = composition.duration
                    ..forward().whenComplete(() {
                      Navigator.popAndPushNamed(context, '/home');
                    });
                },
              ),
              const Spacer(
                flex: 3,
              ),
              Row(
                children: [
                  const Spacer(),
         
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'SmartHome',
                    style: TextStyle(
                      color: Color(0xFF917456),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
