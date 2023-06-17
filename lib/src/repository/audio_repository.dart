import 'dart:developer';

import 'package:autohome/src/datasource/api/base_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioRepositoyRef = Provider((ref) {
  final baseApiRef = ref.read(
    httpBaseRef,
  );

  return AudioRepository( 
    baseApi: baseApiRef,
  );
});

class AudioRepository {
  AudioRepository({
    required this.baseApi,
  }); 
 
  final BaseApiHttp baseApi;
  Future <String?> sendFileToServer(String filePath) async {
    final jsonBody = await baseApi.post(filePath);
    String result = jsonBody.toString();
    
    if (result != null) {
            return result;
    } else {
      return null;
    }

  }
}
