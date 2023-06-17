import 'dart:developer';

import 'package:autohome/src/core/common/base_state.dart';
import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/features/home_page/controller/device_controller.dart';
import 'package:autohome/src/features/schedule/controller/schedule_controller.dart';
import 'package:autohome/src/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<BaseState<List<Schedule>>>(
      scheduleSetupProvider,
      (_, next) {
        next.whenOrNull(
          error: (errorMessage) {
            Fluttertoast.showToast(msg: errorMessage ?? 'null');
          },
          loading: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Palette.mainBlue,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Đang thêm ghi chú...',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          loaded: (data) {
            Navigator.of(context)
              ..pop()
              ..pop(context);
            Fluttertoast.showToast(msg: 'Đã thêm ghi chú thành công');
          },
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIcons.plusBold),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  List<String> deviceName = [];
                  ref.watch(deviceProvider).whenOrNull(
                    loaded: (data) {
                      deviceName.addAll(data.map((device) => device.name));
                    },
                  );

                  final listStatus = <String>['on', 'off'];
                  final TextEditingController clockController =
                      TextEditingController();
                  return AlertDialog(
                    title: const Text(
                      'Thêm ghi chú',
                      style: TextStyle(
                        color: Palette.mainBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(
                            PhosphorIcons.lightbulbBold,
                            color: Palette.mainBlue,
                          ),
                          title: Consumer(
                            builder: (context, ref, child) {
                              return DropdownButton<String>(
                                isExpanded: true,
                                items: deviceName
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (String? value) {
                                  ref.read(deviceNameProvider.notifier).state =
                                      value!;
                                  log(ref.watch(deviceNameProvider));
                                },
                                value: ref.watch(deviceNameProvider),
                              );
                            },
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            PhosphorIcons.lightningBold,
                            color: Palette.mainBlue,
                          ),
                          title: Consumer(
                            builder: (context, ref, child) {
                              return DropdownButton<String>(
                                isExpanded: true,
                                items: listStatus
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (String? value) {
                                  ref
                                      .read(deviceStatusProvider.notifier)
                                      .state = value!;
                                },
                                value: ref.watch(deviceStatusProvider),
                              );
                            },
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            PhosphorIcons.clockBold,
                            color: Palette.mainBlue,
                          ),
                          title: TextField(
                            controller: clockController,
                            decoration:
                                const InputDecoration(hintText: 'Thời gian'),
                            readOnly: true,
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context,
                              );
                              if (pickedTime != null) {
                                // log(pickedTime.toString());
                                clockController.text =
                                    '${pickedTime.hour}:${pickedTime.minute}';
                              } else {
                                log('Time is not selected');
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          if (clockController.text.isNotEmpty) {
                            final nameDevice =
                                ref.read(deviceNameProvider.notifier).state;
                            final statusDevice =
                                ref.read(deviceStatusProvider.notifier).state;

                            await ref
                                .read(scheduleSetupProvider.notifier)
                                .addSchedule(
                                  Schedule(
                                    device: nameDevice,
                                    deviceStatus: statusDevice,
                                    timeSetting: clockController.text,
                                  ),
                                );
                          }
                        },
                        child: const Text(
                          'Thêm',
                          style: TextStyle(
                            color: Palette.mainBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          clockController.clear();
                        },
                        child: const Text(
                          'Hủy',
                          style: TextStyle(color: Palette.mainBlue),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: ref.watch(scheduleSetupProvider).whenOrNull(
          loaded: (data) {
            return data.isEmpty
                ? const Text('Không có ghi chú')
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data[index].device),
                        leading: const Icon(
                          PhosphorIcons.lightbulbBold,
                          color: Palette.mainBlue,
                        ),
                        subtitle: Text(
                          '${data[index].deviceStatus} lúc ${data[index].timeSetting}',
                        ),
                      );
                    },
                  );
          },
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     TextButton(
        //       onPressed: () {},
        //       child: const Text("show"),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

// class ScheduleScreen extends StatefulWidget {
//   const ScheduleScreen({Key? key}) : super(key: key);

//   @override
//   State<ScheduleScreen> createState() => _ScheduleScreenState();
// }

// class _ScheduleScreenState extends State<ScheduleScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ScheduleScreen"),
//       ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextButton(
      //         onPressed: () {},
      //         child: const Text("show"),
      //       )
      //     ],
      //   ),
      // ),
//     );
//   }
// }


