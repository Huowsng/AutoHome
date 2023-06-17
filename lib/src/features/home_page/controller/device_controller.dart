import 'package:autohome/src/core/common/base_state.dart';
import 'package:autohome/src/model/device.dart';
import 'package:autohome/src/repository/data_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceProvider =
    StateNotifierProvider<DeviceController, BaseState<List<Device>>>((ref) {
  return DeviceController(dataRepository: ref.watch(dataRepositoryProvider));
});

class DeviceController extends StateNotifier<BaseState<List<Device>>> {
  DeviceController({required this.dataRepository})
      : super(const BaseState<List<Device>>.initial()) {
    getDataDevice();
  }
  final DataRepository dataRepository;

  Future<void> getDataDevice() async {
    try {
      state = const BaseState<List<Device>>.loading();
      final data = await dataRepository.getDeviceData();
      state = BaseState<List<Device>>.loaded(data);
    } catch (e) {
      state = const BaseState<List<Device>>.error('Error');
    }
  }
}
