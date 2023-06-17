import 'package:autohome/src/core/enum/enum.dart';
import 'package:autohome/src/model/device.dart';

const Map<String, DeviceType> deviceTypeMapping = {
  'fan': DeviceType.fan,
  'led': DeviceType.led,
  'door': DeviceType.door,
};

const Map<String, bool> statusMapping = {
  'on': true,
  'off': false,
};

const Map<bool, String> actionMapping = {
  true: 'off',
  false: 'on',
};


extension DeviceExtension on Device {
  DeviceType get mapToDeviceType {
    return deviceTypeMapping[type] ?? DeviceType.led;
  }

  bool get mapToStatus {
    return statusMapping[status] ?? false;
  }
}
