import 'dart:convert';
import 'dart:developer';

import 'package:autohome/src/datasource/socket/channel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final socketLedProvider = StreamProvider(
  (ref) {
    final channelProvider = ref
        .watch(webSocketLedProvider)
        .stream
        .asBroadcastStream(onCancel: (sub) => sub.cancel());

    var isSubControlError = false;
    ref.watch(webSocketLedProvider).sink.add(
          jsonEncode(<String, String>{'group': 'group_led', 'status': 'join'}),
        );
    // ref.read(webSocketLedProvider).sink.add(
    //       jsonEncode(<String, String>{'group': 'group_dht11', 'status': 'join'}),
    //     );
    final sub = channelProvider.listen(
      (data) {
        log(data.toString());
      },
      onError: (_, stack) {
        log(stack.toString());
      },
      onDone: () async {
        log('on done');
        isSubControlError = true;
        await Future.delayed(const Duration(seconds: 10));
        ref.container.refresh(webSocketLedProvider);
      },
    );

    ref.onDispose(() {
      ref.watch(webSocketLedProvider).sink.add(
            jsonEncode(
              <String, String>{'group': 'group_led', 'status': 'leave'},
            ),
          );
      sub.cancel();
      if (isSubControlError == false) {
        ref.watch(webSocketLedProvider).sink.close(1001);
      }
    });

    return channelProvider;
  },
);

final socketBH1750Provider = StreamProvider(
  (ref) {
    final channelProvider = ref
        .watch(webSocketBH1750Provider)
        .stream
        .asBroadcastStream(onCancel: (sub) => sub.cancel());

    var isSubControlError = false;
    ref.watch(webSocketBH1750Provider).sink.add(
          jsonEncode(
            <String, String>{'group': 'group_bh1750', 'status': 'join'},
          ),
        );

    final sub = channelProvider.listen(
      (data) {
        log(data.toString());
      },
      onError: (_, stack) {
        log(stack.toString());
      },
      onDone: () async {
        log('on done');
        isSubControlError = true;
        await Future.delayed(const Duration(seconds: 10));
        ref.container.refresh(webSocketBH1750Provider);
      },
    );

    ref.onDispose(() {
      ref.watch(webSocketLedProvider).sink.add(
            jsonEncode(
              <String, String>{'group': 'group_bh1750', 'status': 'leave'},
            ),
          );
      sub.cancel();
      if (isSubControlError == false) {
        ref.watch(webSocketBH1750Provider).sink.close(1001);
      }
    });

    return channelProvider;
  },
);

final socketDHTProvider = StreamProvider(
  (ref) {
    final channelProvider = ref
        .watch(webSocketDHT11Provider)
        .stream
        .asBroadcastStream(onCancel: (sub) => sub.cancel());

    var isSubControlError = false;
    ref.watch(webSocketDHT11Provider).sink.add(
          jsonEncode(
            <String, String>{'group': 'group_dht11', 'status': 'join'},
          ),
        );

    final sub = channelProvider.listen(
      (data) {
        log(data.toString());
      },
      onError: (_, stack) {
        log(stack.toString());
      },
      onDone: () async {
        log('on done');
        isSubControlError = true;
        await Future.delayed(const Duration(seconds: 10));
        ref.container.refresh(webSocketDHT11Provider);
      },
    );

    ref.onDispose(() {
      ref.watch(webSocketLedProvider).sink.add(
            jsonEncode(
              <String, String>{'group': 'group_dht11', 'status': 'leave'},
            ),
          );
      sub.cancel();
      if (isSubControlError == false) {
        ref.watch(webSocketBH1750Provider).sink.close(1001);
      }
    });

    return channelProvider;
  },
);

final socketFanProvider = StreamProvider(
  (ref) {
    final channelProvider = ref
        .watch(webSocketFanProvider)
        .stream
        .asBroadcastStream(onCancel: (sub) => sub.cancel());

    var isSubControlError = false;
    ref.watch(webSocketFanProvider).sink.add(
          jsonEncode(
            <String, String>{'group': 'group_fan', 'status': 'join'},
          ),
        );

    final sub = channelProvider.listen(
      (data) {
        log(data.toString());
      },
      onError: (_, stack) {
        log(stack.toString());
      },
      onDone: () async {
        log('on done');
        isSubControlError = true;
        await Future.delayed(const Duration(seconds: 10));
        ref.container.refresh(webSocketFanProvider);
      },
    );

    ref.onDispose(() {
      ref.watch(webSocketLedProvider).sink.add(
            jsonEncode(
              <String, String>{'group': 'group_fan', 'status': 'leave'},
            ),
          );
      sub.cancel();
      if (isSubControlError == false) {
        ref.watch(webSocketFanProvider).sink.close(1001);
      }
    });

    return channelProvider;
  },
);

final socketDoorProvider = StreamProvider(
  (ref) {
    final channelProvider = ref
        .watch(webSocketDoorProvider)
        .stream
        .asBroadcastStream(onCancel: (sub) => sub.cancel());

    var isSubControlError = false;
    ref.watch(webSocketDoorProvider).sink.add(
          jsonEncode(
            <String, String>{'group': 'group_door', 'status': 'join'},
          ),
        );

    final sub = channelProvider.listen(
      (data) {
        log(data.toString());
      },
      onError: (_, stack) {
        log(stack.toString());
      },
      onDone: () async {
        log('on done');
        isSubControlError = true;
        await Future.delayed(const Duration(seconds: 10));
        ref.container.refresh(webSocketDoorProvider);
      },
    );

    ref.onDispose(() {
      ref.watch(webSocketLedProvider).sink.add(
            jsonEncode(
              <String, String>{'group': 'group_door', 'status': 'leave'},
            ),
          );
      sub.cancel();
      if (isSubControlError == false) {
        ref.watch(webSocketDoorProvider).sink.close(1001);
      }
    });

    return channelProvider;
  },
);

final socketGasProvider = StreamProvider(
  (ref) {
    final channelProvider = ref
        .watch(webSocketGasProvider)
        .stream
        .asBroadcastStream(onCancel: (sub) => sub.cancel());

    var isSubControlError = false;
    ref.watch(webSocketGasProvider).sink.add(
          jsonEncode(
            <String, String>{'group': 'group_gas', 'status': 'join'},
          ),
        );

    final sub = channelProvider.listen(
      (data) {
        log(data.toString());
      },
      onError: (_, stack) {
        log(stack.toString());
      },
      onDone: () async {
        log('on done');
        isSubControlError = true;
        await Future.delayed(const Duration(seconds: 10));
        ref.container.refresh(webSocketGasProvider);
      },
    );

    ref.onDispose(() {
      ref.watch(webSocketGasProvider).sink.add(
            jsonEncode(
              <String, String>{'group': 'group_gas', 'status': 'leave'},
            ),
          );
      sub.cancel();
      if (isSubControlError == false) {
        ref.watch(webSocketGasProvider).sink.close(1001);
      }
    });

    return channelProvider;
  },
);
