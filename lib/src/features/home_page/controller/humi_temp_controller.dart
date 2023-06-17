import 'package:autohome/src/core/common/base_state.dart';
import 'package:autohome/src/repository/data_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final humiTempProvider =
    StateNotifierProvider<HumiTempController, BaseState<Map<String, double>>>(
        (ref) {
  final repositoryProvider = ref.watch(dataRepositoryProvider);
  return HumiTempController(dataRepository: repositoryProvider);
});

class HumiTempController extends StateNotifier<BaseState<Map<String, double>>> {
  HumiTempController({required this.dataRepository})
      : super(const BaseState.initial()) {
    getData();
  }

  final DataRepository dataRepository;

  Future<void> getData() async {
    try {
      state = const BaseState.loading();
      await dataRepository
          .getHumiTempData()
          .then((value) => state = BaseState.loaded(value));
    } catch (e) {
      state = BaseState.error(e.toString());
      rethrow;
    }
  }
}
