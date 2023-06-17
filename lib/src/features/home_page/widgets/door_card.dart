import 'dart:convert';

import 'package:autohome/src/core/extenstion/device_extension.dart';
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

class DoorCard extends StatefulWidget {
  const DoorCard({
    Key? key,
    this.color,
    required this.device,
  }) : super(key: key);

  final Device device;
  final Color? color;
  @override
  State<DoorCard> createState() => _DoorCardState();
}

class _DoorCardState extends State<DoorCard> {
  late ValueNotifier<bool> statusNotifier;

  @override
  void initState() {
    statusNotifier = ValueNotifier(widget.device.mapToStatus);
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
                  PhosphorIcons.door,
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
              ValueListenableBuilder<bool>(
                valueListenable: statusNotifier,
                builder: (context, status, child) {
                  return Consumer(
                    builder: (context, ref, child) {
                      ref.watch(socketDoorProvider).whenOrNull(
                        data: (data) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (data != null) {
                              final dataSocket =
                                  Map<String, dynamic>.from(jsonDecode(data));
                              if (dataSocket['data'] != null) {
                                if (dataSocket['data']['action'] != null) {
                                  if (statusMapping[dataSocket['data']
                                          ['action']] ==
                                      true) {
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
                            msg: value ? 'Đang mở cửa' : 'Đang đóng cửa',
                          );
                          await ref
                              .read(actionDeviceProvider)
                              .doDoorAction(
                                status: status,
                              )
                              .then((_) {
                            statusNotifier.value = value;
                            Fluttertoast.cancel();

                            Fluttertoast.showToast(
                              msg: value ? 'Đã mở cửa' : 'Đã đóng cửa',
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
                                  ? 'Mở cửa không thành công'
                                  : 'Đóng cửa không thành công',
                            );
                          });
                        },
                        value: status,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
