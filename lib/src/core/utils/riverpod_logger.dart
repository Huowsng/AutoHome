import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    log(
      '''
{
  "New Provider added": "${provider.name ?? provider.runtimeType}",
  "value init": "$value"
}''',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log(
      '''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''',
    );
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    log(
      '''
{
  "Dispose": "${provider.name ?? provider.runtimeType}",
}''',
    );
  }
}
