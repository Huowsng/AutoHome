import 'dart:convert';

import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/datasource/socket/socket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LightCard extends StatefulWidget {
  const LightCard({
    Key? key,
  }) : super(key: key);

  @override
  State<LightCard> createState() => _LightCardState();
}

class _LightCardState extends State<LightCard> {
  late ValueNotifier<String> sensorData;
  late ValueNotifier<String> statusBySensorData;

  @override
  void initState() {
    sensorData = ValueNotifier('0');
    statusBySensorData = ValueNotifier('Chưa có dữ liệu');

    super.initState();
  }

  String lightSensorStatus(double value) {
    if (value > 0 && value <= 1) {
      return 'Ánh sáng thấp';
    } else if (value > 1 && value <= 5) {
      return 'Ánh sáng vừa phải';
    } else if (value > 5 && value <= 20) {
      return 'Ánh sáng khá cao';
    } else {
      return 'Ánh sáng mạnh';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: MediaQuery.of(context).size.width - 24 * 2,
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Palette.backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 2),
              color: Palette.shadowBlack.withOpacity(0.1),
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffF7759C),
              Color(0xffFF6BA1),
            ],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Palette.backgroundColor,
                      child: SvgPicture.asset(
                        'assets/images/sun.svg',
                        height: 26,
                        color: Palette.yellowColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Cường độ\nánh sáng',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Palette.backgroundColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Opacity(
              opacity: 0.3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Palette.backgroundColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: statusBySensorData,
                      builder: (context, status, child) {
                        return Text(
                          status,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Palette.backgroundColor,
                          ),
                        );
                      },
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/sun.svg',
                    height: 26,
                    color: Palette.backgroundColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ValueListenableBuilder<String>(
                    valueListenable: sensorData,
                    builder: (context, value, child) {
                      return Consumer(
                        builder: (context, ref, child) {
                          ref.watch(socketBH1750Provider).whenOrNull(
                            data: (data) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (data != null) {
                                  final dataSocket = Map<String, dynamic>.from(
                                    jsonDecode(data),
                                  );
                                  if (dataSocket['data'] != null) {
                                    if (dataSocket['data']['action'] != null) {
                                      sensorData.value =
                                          dataSocket['data']['action'];
                                      statusBySensorData.value =
                                          lightSensorStatus(
                                        double.parse(
                                          dataSocket['data']['action'],
                                        ),
                                      );
                                    }
                                  }
                                }
                              });
                            },
                          );
                          return Text(
                            value,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Palette.backgroundColor,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
