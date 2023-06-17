import 'dart:async';

import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/features/home_page/home_screen.dart';
import 'package:autohome/src/features/schedule/schedule_screen.dart';
import 'package:autohome/src/features/voice/controllers/voice_controller.dart';
import 'package:autohome/src/features/voice/voice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  Timer? _timer;

  void changeIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          ScheduleScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              offset: const Offset(0, -5),
              color: Palette.shadowBlack.withOpacity(0.06),
            )
          ],
        ),
        child: BottomAppBar(
          notchMargin: 8,
          clipBehavior: Clip.hardEdge,
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 75,
            decoration: const BoxDecoration(color: Palette.backgroundColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBold.home,
                        size: 26,
                        color: _currentIndex == 0
                            ? Palette.elementBlack
                            : Palette.elementBlue,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Trang chủ',
                        style: TextStyle(
                          letterSpacing: -0.03,
                          color: _currentIndex == 0
                              ? Palette.elementBlack
                              : Palette.elementBlue,
                        ),
                      )
                    ],
                  ),
                  onPressed: () => changeIndex(0),
                ),
                MaterialButton(
                  padding: const EdgeInsets.only(right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(
                      //   IconlyBold.timeSquare,
                      //   size: 26,
                      //   color: _currentIndex == 1
                      //       ? Palette.elementBlack
                      //       : Palette.elementBlue,
                      // ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Ghi chú',
                        style: TextStyle(
                          letterSpacing: -0.03,
                          color: _currentIndex == 1
                              ? Palette.elementBlack
                              : Palette.elementBlue,
                        ),
                      )
                    ],
                  ),
                  onPressed: () => changeIndex(1),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          ref.read(recorderProvider);
          return Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 14,
                  offset: Offset(0, 4),
                  color: Color.fromARGB(255, 8, 31, 65),
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: FloatingActionButton(
              backgroundColor: Palette.mainBlue,
              child: const Icon(
                IconlyBold.voice,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    _timer = Timer(const Duration(seconds: 2), () async {
                      await ref.read(recorderProvider).stopRecorder().then(
                            (_) => Navigator.of(context).pop(),
                          );
                    });
                    ref.read(recorderProvider).record();
                    return const Dialog(
                      child: VoiceDialog(),
                    );
                  },
                ).then((val) {
                  if (_timer!.isActive) {
                    _timer!.cancel();
                  }
                });
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
