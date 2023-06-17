import 'dart:developer';

import 'package:autohome/src/features/home_page/controller/action_device_controller.dart';
import 'package:autohome/src/repository/audio_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

final recorderProvider = Provider(
  (ref) {
    final audioRepo = ref.read(audioRepositoyRef);
    return RecordAudioProvider(
      recorder: Record(),
      audioRepository: audioRepo,
      reader: ref.read,
    );
  },
);

class RecordAudioProvider {
  RecordAudioProvider({
    required Record recorder,
    required AudioRepository audioRepository,
    required Reader reader,
  })  : _recorder = recorder,
        _audioRepository = audioRepository,
        _reader = reader {
    init();
  }

  final Record _recorder;
  final AudioRepository _audioRepository;
  final Reader _reader;

  Future<void> init() async {
    PermissionStatus micro = await Permission.microphone.request();
    if (micro.isDenied) {
      throw Exception('No have micro permission');
    }
    PermissionStatus storage = await Permission.storage.request();
    if (storage.isDenied) {
      throw Exception('No have storage permission');
    }
  }

  Future<void> record() async {
    final dateTimeNow = DateTime.now();
    final fileName = dateTimeNow.millisecondsSinceEpoch.toString();
    String path = (await getTemporaryDirectory()).path;
    if (await _recorder.hasPermission()) {
      await _recorder.start(
        samplingRate: 16000,
        encoder: AudioEncoder.wav,
        path: join(path, '$fileName.wav'),
      );
    }
  }
   
  Future<void> stopRecorder() async {
        
    await _recorder.stop().then((url) async {
      log(url.toString());
      if (url != null) {
        final result = await _audioRepository.sendFileToServer(
          url,
           
        ); 
        log('huong ${result}' );
        if (result == null) {
          return;
        }
        if (result == 'Bật đèn một' || result == 'Tắt đèn một') {
          _reader(actionDeviceProvider).doLedAction(
            nameLed: 'led1',
            status: result == 'Bật đèn một' ? false : true,
          );
        }
        else if (result == 'Bật đèn hai' || result == 'Tắt đèn hai') {
          _reader(actionDeviceProvider).doLedAction(
            nameLed: 'led2',
            status: result == 'Bật đèn hai' ? false : true,
          );
        }
        else if (result == 'Bật đèn ba' || result == 'Tắt đèn ba') {
          _reader(actionDeviceProvider).doLedAction(
            nameLed: 'led3',
            status: result == 'Bật đèn ba' ? false : true,
          );
        }  
        else if (result == 'Bật quạt' || result == 'Tắt quạt') {
          await _reader(actionDeviceProvider).doFanAction(
            nameFan: 'fan1',
            value: result == 'Bật quạt' ? 20 : 0,
          ); 
        }
        else if(result == 'Mở cửa' || result == 'Đóng cửa'){
          log('testDoor Current  status: $result');
           await _reader(actionDeviceProvider).doDoorAction(
            status: result == 'Mở cửa' ? false : true
          );
        }
      }
    });
  }
}
