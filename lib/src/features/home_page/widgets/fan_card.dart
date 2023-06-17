import 'dart:convert';

import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/core/utils/app_utils.dart';
import 'package:autohome/src/datasource/socket/socket.dart';
import 'package:autohome/src/features/home_page/controller/action_device_controller.dart';
import 'package:autohome/src/model/device.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FanCard extends StatefulWidget {
  const FanCard({
    Key? key,
    this.color,
    required this.device,
  }) : super(key: key);

  final Device device;
  final Color? color;

  @override
  State<FanCard> createState() => _FanCardState();
}

class _FanCardState extends State<FanCard> {
  late ValueNotifier<bool> statusNotifier;
  late ValueNotifier<double> slideNotifier;

  @override
  void initState() {
    statusNotifier = ValueNotifier(double.parse(widget.device.status) > 0);
    slideNotifier = ValueNotifier(double.parse(widget.device.status));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(left: 24, bottom: 12, right: 24),
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
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Palette.elementBlue.withOpacity(0.7),
                child: const Icon(
                  PhosphorIcons.wind,
                  color: Palette.mainBlue,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.device.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Palette.textBlack,
                  ),
                ),
              ),
              _buildSwitch(),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          _buildSlider(),
        ],
      ),
    );
  }

  ValueListenableBuilder<bool> _buildSlider() {
    return ValueListenableBuilder<bool>(
      valueListenable: statusNotifier,
      builder: (context, value, child) {
        return ValueListenableBuilder<double>(
          valueListenable: slideNotifier,
          builder: (context, slideValue, child) {
            return IgnorePointer(
              ignoring: !value,
              child: Opacity(
                opacity: value ? 1.0 : 0.6,
                child: Row(
                  children: [
                    const Text(
                      'Tốc độ',
                      style: TextStyle(
                        color: Palette.textBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Consumer(
                        builder: (context, ref, child) {
                          ref.watch(socketFanProvider).whenOrNull(
                            data: (data) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (data != null) {
                                  final dataSocket = Map<String, dynamic>.from(
                                    jsonDecode(data),
                                  );
                                  if (dataSocket['data'] != null) {
                                    if (dataSocket['data']['name'] != null &&
                                        dataSocket['data']['name'] ==
                                            widget.device.name) {
                                      slideNotifier.value =
                                          (dataSocket['data']['action'] as int)
                                              .toDouble();
                                    }
                                  }
                                }
                              });
                            },
                          );
                          return Slider(
                            onChanged: (newValue) {},
                            value: slideValue,
                            onChangeStart: (value) {},
                            onChangeEnd: (value) async {
                              slideNotifier.value = value;
                              if (value == 0.0) {
                                statusNotifier.value = false;
                              }
                              await ref
                                  .read(actionDeviceProvider)
                                  .doFanAction(
                                    nameFan: widget.device.name,
                                    value: int.parse(
                                      value.toStringAsFixed(0),
                                    ),
                                  )
                                  .then((_) {
                                Fluttertoast.cancel();
                                Fluttertoast.showToast(
                                  msg: value == 0.0
                                      ? 'Đã tắt ${widget.device.name}'
                                      : 'Đã chỉnh tốc độ ${widget.device.name} ${value.toStringAsFixed(0)}',
                                );
                              }).catchError((error, __) {
                                AppUtils.logger(
                                  error,
                                  location: runtimeType,
                                  isError: true,
                                );
                                Fluttertoast.showToast(
                                  msg:
                                      'Chỉnh tốc độ ${widget.device.name} ${value.toStringAsFixed(0)} không thành công,\nvui lòng thử lại',
                                );
                              });
                            },
                            divisions: 5,
                            max: 50,
                            min: 0,
                            label: slideValue.toStringAsFixed(0),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  ValueListenableBuilder<bool> _buildSwitch() {
    return ValueListenableBuilder<bool>(
      valueListenable: statusNotifier,
      builder: (context, status, child) {
        return Consumer(
          builder: (context, ref, child) {
            ref.watch(socketFanProvider).whenOrNull(
              data: (data) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (data != null) {
                    final dataSocket =
                        Map<String, dynamic>.from(jsonDecode(data));
                    if (dataSocket['data'] != null) {
                      if (dataSocket['data']['name'] != null &&
                          dataSocket['data']['name'] == widget.device.name) {
                        if (dataSocket['data']['action'] > 0) {
                          statusNotifier.value = true;
                        } else {
                          statusNotifier.value = false;
                        }
                      }
                    }
                  }
                });
              },
            );
            return CupertinoSwitch(
              trackColor: Palette.elementLightGray,
              activeColor: Palette.mainBlue,
              onChanged: (value) async {
                Fluttertoast.cancel();
                Fluttertoast.showToast(
                  msg: value
                      ? 'Đang bật ${widget.device.name}'
                      : 'Đang tắt ${widget.device.name}',
                );
                await ref
                    .read(actionDeviceProvider)
                    .doFanAction(
                      nameFan: widget.device.name,
                      value: value ? 20 : 0,
                    )
                    .then((_) {
                  statusNotifier.value = value;
                  slideNotifier.value = value ? 20 : 0;
                  Fluttertoast.cancel();

                  Fluttertoast.showToast(
                    msg: value
                        ? 'Đã bật ${widget.device.name}'
                        : 'Đã tắt ${widget.device.name}',
                  );
                }).catchError((error, __) {
                  AppUtils.logger(
                    error,
                    location: runtimeType,
                    isError: true,
                  );
                  Fluttertoast.cancel();

                  Fluttertoast.showToast(
                    msg: value
                        ? 'Bật ${widget.device.name} không thành công,\nvui lòng thử lại'
                        : 'Tắt ${widget.device.name} không thành công,\nvui lòng thử lại',
                  );
                });
              },
              value: status,
            );
          },
        );
      },
    );
  }
}
