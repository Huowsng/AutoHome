import 'package:autohome/src/core/common/base_state.dart';
import 'package:autohome/src/features/home_page/controller/device_controller.dart';
import 'package:autohome/src/model/schedule.dart';
import 'package:autohome/src/repository/data_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceStatusProvider = AutoDisposeStateProvider<String>(
  (ref) => 'on',
  name: 'device status provider',
);

final deviceNameProvider = AutoDisposeStateProvider<String>(
  (ref) {
    final List<String> deviceNames = [];
    ref.watch(deviceProvider).whenOrNull(
      loaded: (data) {
        deviceNames.addAll(data.map((device) => device.name));
      },
    );
    return deviceNames.first;
  },
  name: 'device name provider',
);

final scheduleSetupProvider = AutoDisposeStateNotifierProvider<
    ScheduleSetupController, BaseState<List<Schedule>>>((ref) {
  final dataRepo = ref.watch(dataRepositoryProvider);
  return ScheduleSetupController(dataRepository: dataRepo);
});

class ScheduleSetupController extends StateNotifier<BaseState<List<Schedule>>> {
  ScheduleSetupController({required this.dataRepository})
      : super(const BaseState.initial()) {
    state = const BaseState.loaded([]);
  }

  final DataRepository dataRepository;

  ///Input schedule.timeSettings: min:hour:day:month:year , which null time will scheduled by null value
  ///ex: notnull:null
  Future<void> addSchedule(Schedule schedule) async {
    var oldList = <Schedule>[];
    state.whenOrNull(
      loaded: (data) {
        oldList.addAll(data);
      },
    );
    state = const BaseState.loading();
    final temp = schedule.timeSetting.split(':');
    String formattedTime = '${temp[1]}:${temp[0]}';
    await dataRepository
        .addSchedule(schedule: schedule.copyWith(timeSetting: formattedTime))
        .then((_) {
      oldList.add(schedule);
      state = BaseState.loaded(oldList);
    }).catchError((err, __) {
      state = BaseState.error(err.toString());
    });
  }
}
