import 'package:autohome/src/core/enum/enum.dart';
import 'package:autohome/src/core/extenstion/device_extension.dart';
import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/features/home_page/controller/device_controller.dart';
import 'package:autohome/src/features/home_page/widgets/door_card.dart';
import 'package:autohome/src/features/home_page/widgets/fan_card.dart';
import 'package:autohome/src/features/home_page/widgets/gas_card.dart';
import 'package:autohome/src/features/home_page/widgets/led_card.dart';
import 'package:autohome/src/features/home_page/widgets/light_card.dart';
import 'package:autohome/src/features/home_page/widgets/temperature_and_humidity_card.dart';
import 'package:autohome/src/model/device.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;
  late List<bool> listDeviceStatus;

  @override
  void initState() {
    // getAllDevice();
    super.initState();
  }

  void changePage(int value) {
    setState(() {
      currentPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(deviceProvider.notifier).getDataDevice(),
          color: Palette.mainBlue,
          child: ListView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 16.0,
                ),
                child: Row(
                  
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    TemperatureAndHumidityCard(),
                    SizedBox(
                      width: 16,
                    ),
                    LightCard(),
                    SizedBox(
                      width: 16,
                    ),
                    GasCard(),
                  ],
                ),
              ),
              const DevicePanel(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                child: Material(
                  color: Palette.mainBlue,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () async {
                      final isRefresh =
                          await Navigator.pushNamed(context, '/add');
                      if (isRefresh == null) {
                        return;
                      } else if (isRefresh as bool) {
                        await ref.read(deviceProvider.notifier).getDataDevice();
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                            color: Palette.shadowBlack.withOpacity(.1),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Thêm thiết bị',
                        style: TextStyle(
                          color: Palette.backgroundColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 22 / 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DevicePanel extends StatefulWidget {
  const DevicePanel({Key? key}) : super(key: key);

  @override
  State<DevicePanel> createState() => _DevicePanelState();
}

class _DevicePanelState extends State<DevicePanel> {
  late List<bool> listRoomSelectedStatus;

  final listRoom = <String>[
    'Tất cả',
    'Nhà bếp',
    'Phòng khách',
    'Phòng ngủ',
  ];

  @override
  void initState() {
    listRoomSelectedStatus = List.filled(listRoom.length, false)..first = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(deviceProvider);
            return state.maybeWhen(
              error: (errorMessage) {
                return const SizedBox();
              },
              loaded: (List<Device> devices) {
                return Column(
                  children: devices.map(
                    ((device) {
                      if (device.mapToDeviceType == DeviceType.fan) {
                        return FanCard(
                          device: device,
                          color: Palette.elementBlue,
                        );
                      } else if (device.mapToDeviceType == DeviceType.led) {
                        return LedCard(
                          device: device,
                          color: Palette.elementBlue,
                        );
                      } else {
                        return DoorCard(
                          device: device,
                          color: Palette.elementBlue,
                        );
                      }
                    }),
                  ).toList(),
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ),
      ],
    );
  }
}
