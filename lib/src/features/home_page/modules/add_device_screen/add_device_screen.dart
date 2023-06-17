import 'package:autohome/src/core/common/base_state.dart';
import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/features/home_page/modules/add_device_screen/controller/add_device_controller.dart';
import 'package:autohome/src/features/home_page/modules/add_device_screen/controller/add_device_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddDeviceScreen extends StatelessWidget {
  const AddDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Palette.elementLightGray,
                      child: Icon(
                        PhosphorIcons.caretLeftBold,
                        color: Palette.elementBlack,
                      ),
                    ),
                  ),
                  const Text(
                    'Thêm thiết bị',
                    style: TextStyle(
                      color: Palette.textBlack2,
                      fontSize: 22,
                      height: 28 / 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  /// Using for center Title
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const AddDevicePanel()
          ],
        ),
      ),
    );
  }
}

class AddDevicePanel extends ConsumerStatefulWidget {
  const AddDevicePanel({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AddDevicePanel> createState() => _AddDevicePanelState();
}

class _AddDevicePanelState extends ConsumerState<AddDevicePanel> {
  final _deviceTypeMapping = <String, String>{'Led': 'Đèn', 'Motor': 'Quạt'};
  final _deviceStatusMapping = <String, String>{'on': 'Bật', 'off': 'Tắt'};
  final _locationList = <String>[
    'Phòng khách',
    'Nhà bếp',
    'Phòng ngủ',
  ];
  late String _selectedDeviceType;
  late String _selectedStatus;
  late String _selectedLocation;

  late final TextEditingController _nameDeviceController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Widget iconWidget;
  @override
  void initState() {
    super.initState();
    _selectedDeviceType = _deviceTypeMapping.entries.first.value;
    _selectedStatus = _deviceStatusMapping.entries.first.value;
    _selectedLocation = _locationList.first;
    _nameDeviceController = TextEditingController();
    iconWidget = const Icon(
      PhosphorIcons.lightbulbBold,
      color: Palette.mainBlue,
      size: 100,
      key: ValueKey('Đèn'),
    );
  }

  void _onDeviceTypeChooseAction(String? newValue) {
    if (newValue is String) {
      setState(() {
        _selectedDeviceType = newValue;
        iconWidget = Icon(
          newValue == 'Đèn'
              ? PhosphorIcons.lightbulbBold
              : PhosphorIcons.windBold,
          color: Palette.mainBlue,
          size: 100,
          key: ValueKey(newValue),
        );
      });
    }
  }

  void _onLocationChanged(String? newValue) {
    if (newValue is String) {
      setState(() {
        _selectedLocation = newValue;
      });
    }
  }

  void _addDevice() {
    if (_formKey.currentState!.validate()) {
      final deviceType = _deviceTypeMapping.keys
          .firstWhere((key) => _deviceTypeMapping[key] == _selectedDeviceType);
      final deviceStatus = _deviceStatusMapping.keys
          .firstWhere((key) => _deviceStatusMapping[key] == _selectedStatus);

      final params = AddDeviceParams(
        location: _selectedLocation,
        name: _nameDeviceController.text,
        status: deviceStatus,
        type: deviceType,
      );
      ref.read(addDeviceProvider.notifier).addDevice(params: params);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<BaseState<String>>(
      addDeviceProvider,
      ((_, state) {
        state.whenOrNull(
          error: (errorMessage) {
            Fluttertoast.showToast(msg: errorMessage!);
          },
          loaded: (message) {
            Fluttertoast.showToast(msg: message);
            Navigator.pop(context, true);
          },
          loading: () {
            Fluttertoast.showToast(msg: 'Loading');
          },
        );
      }),
    );

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameDeviceController,
                        decoration: const InputDecoration(
                          hintText: 'Tên thiết bị',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nhập giá trị';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          hintText: 'Loại thiết bị',
                          border: OutlineInputBorder(),
                        ),
                        items: _deviceTypeMapping.values
                            .map<DropdownMenuItem<String>>(
                          ((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }),
                        ).toList(),
                        onChanged: _onDeviceTypeChooseAction,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DropdownButtonFormField<String>(
                        value: _selectedLocation,
                        decoration: const InputDecoration(
                          hintText: 'Nơi đặt thiết bị',
                          border: OutlineInputBorder(),
                        ),
                        items: _locationList.map<DropdownMenuItem<String>>(
                          ((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }),
                        ).toList(),
                        onChanged: _onLocationChanged,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DropdownButtonFormField<String>(
                        value: _selectedStatus,
                        decoration: const InputDecoration(
                          hintText: 'Trạng thái',
                          border: OutlineInputBorder(),
                        ),
                        items: _deviceStatusMapping.values
                            .map<DropdownMenuItem<String>>(
                          ((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }),
                        ).toList(),
                        onChanged: _onLocationChanged,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: iconWidget,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
          child: Material(
            color: Palette.mainBlue,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: _addDevice,
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
        )
      ],
    );
  }
}
