import 'dart:convert';

import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/datasource/socket/socket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GasCard extends StatefulWidget {
  const GasCard({Key? key}) : super(key: key);

  @override
  State<GasCard> createState() => _GasCardState();
}

class _GasCardState extends State<GasCard> {
  late ValueNotifier<String> sensorData;

  @override
  void initState() {
    sensorData = ValueNotifier('Không có cảnh báo');

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
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF9675F1),
              Color(0xFFB161F1),
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
                  children: const [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Palette.backgroundColor,
                      child: Icon(
                        PhosphorIcons.cookingPotFill,
                        color: Color(0xFFB161F1),
                        size: 28,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Cảnh báo\nnồng độ khí gas',
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
                  const Icon(
                    PhosphorIcons.cookingPotBold,
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
                          ref.watch(socketGasProvider).whenOrNull(
                            data: (data) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (data != null) {
                                  final dataSocket = Map<String, dynamic>.from(
                                    jsonDecode(data),
                                  );
                                  if (dataSocket['data'] != null) {
                                    if (dataSocket['data']['name'] != null) {
                                      sensorData.value =
                                          dataSocket['data']['name'];
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(sensorData.value),
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
