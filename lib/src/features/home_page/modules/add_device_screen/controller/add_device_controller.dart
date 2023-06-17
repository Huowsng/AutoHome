import 'package:autohome/src/core/common/base_state.dart';
import 'package:autohome/src/features/home_page/modules/add_device_screen/controller/add_device_params.dart';
import 'package:autohome/src/repository/data_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addDeviceProvider =
    AutoDisposeStateNotifierProvider<AddDeviceController, BaseState<String>>(
        (ref) {
  final repository = ref.watch(dataRepositoryProvider);
  return AddDeviceController(dataRepository: repository);
});

class AddDeviceController extends StateNotifier<BaseState<String>> {
  AddDeviceController({required this.dataRepository})
      : super(const BaseState.initial());
  
  final DataRepository dataRepository;


  Future<void> addDevice({required AddDeviceParams params}) async {
    try {
      state = const BaseState.loading();
      await dataRepository.addDevice(params: params).then((_) {
        state = const BaseState.loaded('Thêm thiết bị thành công');
      });
    } catch (e) {
      state = BaseState.error(e.toString());
    }
  }
}
