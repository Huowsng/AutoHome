import 'package:autohome/src/app.dart';
import 'package:autohome/src/core/utils/riverpod_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        RiverpodLogger(),
      ],
      child: const App(),
    ),
  );
}
