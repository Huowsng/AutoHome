import 'dart:developer';

import 'package:autohome/src/datasource/api/base_api.dart';
import 'package:autohome/src/features/home_page/modules/add_device_screen/controller/add_device_params.dart';
import 'package:autohome/src/model/device.dart';
import 'package:autohome/src/model/schedule.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataRepositoryProvider = Provider<DataRepository>((ref) {
  return DataRepository(
    baseApi: ref.watch(
      baseApiProvider('https://aaf8-2402-800-6203-dea6-e12a-994f-3f1e-3426.ap.ngrok.io'),
    ),
  );
});

class DataRepository {
  DataRepository({required this.baseApi});

  final BaseApi baseApi;

  Future<List<Device>> getDeviceData() async {
    try {
      final response = await baseApi.get(path: '/device');
      return (response.data as List<dynamic>)
          .map((e) => Device.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception();
    }
  }

  Future<Map<String, double>> getHumiTempData() async {
    try {
      final response = await baseApi.get(path: '/dht11');
      return <String, double>{
        'temp': double.parse((response.data as Iterable).elementAt(0)['temp']),
        'humi': double.parse((response.data as Iterable).elementAt(0)['hum']),
      };
    } catch (e) {
      throw Exception('get data humi temp fail');
      // rethrow;
    }
  }
  Future<Map<String, double>> getLightSensorData() async {
    try {
      final response = await baseApi.get(path: '/bh1750');
      return <String, double>{
        'LightLevel': double.parse((response.data as Iterable).elementAt(0)['LightLevel']),
      };
    } catch (e) {
      throw Exception('get data fail');
      // rethrow;
    }
  }

  Future<String> doLedAction({
    required String name,
    required String action,
  }) async {
    try {
      final formData =
          FormData.fromMap(<String, dynamic>{'name': name, 'status': action});
      final response = await baseApi.post(
        path: '/led',
        data: formData,
      );

      return response.data;
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> doFanAction({required String name, required int value}) async {
    try {
      final formData =
          FormData.fromMap(<String, dynamic>{'name': name, 'value': value});
      log(formData.toString());
      await baseApi.post(path: '/fan', data: formData);
    } catch (e) {
      throw Exception('happy add device');
    }
  }

  Future<void> doDoorAction({
    required String action,
  }) async {
    try {
     
      final formData = FormData.fromMap(<String, dynamic>{'action': action});
      log(formData.toString());
      await baseApi.post(path: '/door', data: formData);
    } catch (e) {
      throw Exception('happy add device');
    }
  }

  Future<void> addDevice({required AddDeviceParams params}) async {
    try {
      final formData = FormData.fromMap(params.toJson());
      await baseApi.post(path: '/device', data: formData);
    } catch (e) {
      throw Exception('happy add device');
    }
  }

  Future<void> addSchedule({required Schedule schedule}) async {
    try {
      final formData = FormData.fromMap(schedule.toJson());
      await baseApi.post(path: '/schedule/cron', data: formData);
    } catch (e) {
      throw Exception('Happy add schedule');
    }
  }
}
