import 'dart:convert';

import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/core/utils/app_utils.dart';
import 'package:autohome/src/core/utils/toast_utils.dart';
import 'package:autohome/src/datasource/socket/socket.dart';
import 'package:autohome/src/features/home_page/controller/humi_temp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TemperatureAndHumidityCard extends StatefulWidget {
  const TemperatureAndHumidityCard({
    Key? key,
  }) : super(key: key);

  @override
  State<TemperatureAndHumidityCard> createState() =>
      _TemperatureAndHumidityCardState();
}

class _TemperatureAndHumidityCardState
    extends State<TemperatureAndHumidityCard> {
  late ValueNotifier<String> temperature;
  late ValueNotifier<String> humidity;

  @override
  void initState() {
    temperature = ValueNotifier('0.0');
    humidity = ValueNotifier('0.0');

    super.initState();
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
                      backgroundColor: Palette.elementBlue.withOpacity(0.7),
                      child: const Icon(
                        PhosphorIcons.thermometerFill,
                        color: Palette.mainBlue,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Nhiệt độ\nvà độ ẩm',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Palette.textBlack,
                      ),
                    ),
                  ],
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          icon: const Icon(
                            PhosphorIcons.arrowsClockwise,
                            color: Palette.mainBlue,
                            size: 28,
                          ),
                          onPressed: () async {
                            ref.read(humiTempProvider.notifier).getData();
                            ToastUtils.make(
                              message: 'Đang lấy dữ liệu nhiệt độ và độ ẩm',
                            );
                            await ref
                                .read(humiTempProvider.notifier)
                                .getData()
                                .then((_) {
                              ToastUtils.make(
                                message: 'Đã lấy dữ liệu thành công',
                              );
                            }).catchError((error) {
                              AppUtils.logger(
                                error!,
                                location: runtimeType,
                                isError: true,
                              );
                              ToastUtils.make(
                                message:
                                    'Lấy dữ liệu không thành công, vui lòng thử lại',
                              );
                            });
                          },
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
            Opacity(
              opacity: 0.2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Palette.mainBlue,
                  ),
                ),
              ),
            ),
            // ,
            Consumer(
              builder: (context, ref, child) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref.watch(humiTempProvider).whenOrNull(
                    error: (err) {
                      temperature.value = 'err°C';
                      humidity.value = 'err%';
                    },
                    loading: () {
                      temperature.value = '...°C';
                      humidity.value = '...%';
                    },
                    loaded: (data) {
                      temperature.value =
                          '${data['temp']!.toStringAsFixed(0)}°C';
                      humidity.value = '${data['humi']!.toStringAsFixed(0)}%';
                    },
                  );
                });
                ref.watch(socketDHTProvider).whenOrNull(
                  data: (data) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (data != null) {
                        final dataSocket = Map<String, dynamic>.from(
                          jsonDecode(data),
                        );
                        if (dataSocket['data'] != null) {
                          if (dataSocket['data']['action'] != null) {
                            humidity.value =
                                dataSocket['data']['action']['hump'].toString();
                            temperature.value =
                                dataSocket['data']['action']['temp'].toString();
                          }
                        }
                      }
                    });
                  },
                );
                return Row(
                  children: [
                    const Tooltip(
                      message: 'Nhiệt độ',
                      child: Icon(
                        PhosphorIcons.thermometer,
                        color: Palette.elementGray,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ValueListenableBuilder<String>(
                      valueListenable: temperature,
                      builder: (context, temp, child) {
                        return Tooltip(
                          richMessage: TextSpan(
                            text: 'Nhiệt độ hiện tại là ',
                            children: [
                              TextSpan(
                                text: temp,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          child: Text(
                            temp,
                            style: const TextStyle(
                              fontSize: 24,
                              height: 1.2,
                              letterSpacing: 0.5,
                              color: Palette.mainBlue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 24),
                    const Tooltip(
                      message: 'Nhiệt độ',
                      child: Icon(
                        PhosphorIcons.drop,
                        color: Palette.elementGray,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ValueListenableBuilder<String>(
                      valueListenable: humidity,
                      builder: (context, humi, child) {
                        return Tooltip(
                          richMessage: TextSpan(
                            text: 'Độ ẩm hiện tại là ',
                            children: [
                              TextSpan(
                                text: humi,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          child: Text(
                            humi,
                            style: const TextStyle(
                              fontSize: 24,
                              height: 1.2,
                              letterSpacing: 0.5,
                              color: Palette.mainBlue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          tooltip: 'Xem thống kê',
                          icon: const Icon(
                            PhosphorIcons.chartLine,
                            color: Palette.mainBlue,
                            size: 28,
                          ),
                          onPressed: () async {},
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
            // Row(
            //   children: [
            //     const Tooltip(
            //       message: "Nhiệt độ",
            //       child: Icon(
            //         PhosphorIcons.thermometer,
            //         color: Palette.elementGray,
            //         size: 28,
            //       ),
            //     ),
            //     const SizedBox(width: 8),
            //     Tooltip(
            //       richMessage: TextSpan(
            //         text: "Nhiệt độ hiện tại là ",
            //         children: [
            //           TextSpan(
            //             text: "${temperature.toStringAsFixed(0)}°C",
            //             style: const TextStyle(
            //               fontWeight: FontWeight.w700,
            //             ),
            //           ),
            //         ],
            //       ),
            //       child: Text(
            //         "${temperature.toStringAsFixed(0)}°C",
            //         style: const TextStyle(
            //           fontSize: 24,
            //           height: 1.2,
            //           letterSpacing: 0.5,
            //           color: Palette.mainBlue,
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 24),
            //     const Tooltip(
            //       message: "Nhiệt độ",
            //       child: Icon(
            //         PhosphorIcons.drop,
            //         color: Palette.elementGray,
            //         size: 28,
            //       ),
            //     ),
            //     const SizedBox(width: 8),
            //     Tooltip(
            //       richMessage: TextSpan(text: "Độ ẩm hiện tại là ", children: [
            //         TextSpan(
            //           text: "${humidity.toStringAsFixed(0)}%",
            //           style: const TextStyle(
            //             fontWeight: FontWeight.w700,
            //           ),
            //         ),
            //       ]),
            //       child: Text(
            //         "${humidity.toStringAsFixed(0)}%",
            //         style: const TextStyle(
            //           fontSize: 24,
            //           height: 1.2,
            //           letterSpacing: 0.5,
            //           color: Palette.mainBlue,
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //     ),
            //     const Spacer(),
            //     ClipOval(
            //       child: Material(
            //         color: Colors.transparent,
            //         child: IconButton(
            //           tooltip: "Xem thống kê",
            //           icon: const Icon(
            //             PhosphorIcons.chartLine,
            //             color: Palette.mainBlue,
            //             size: 28,
            //           ),
            //           onPressed: () async {},
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
