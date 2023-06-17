import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';

final webSocketLedProvider = Provider<IOWebSocketChannel>((ref) {
  final channel =
      IOWebSocketChannel.connect('ws://0.tcp.ap.ngrok.io:14242/basehub');
  return channel;
});

final webSocketBH1750Provider = Provider<IOWebSocketChannel>((ref) {
  final channel =
      IOWebSocketChannel.connect('ws://0.tcp.ap.ngrok.io:14242/basehub');
  return channel;
});

final webSocketDHT11Provider = Provider<IOWebSocketChannel>((ref) {
  final channel =
      IOWebSocketChannel.connect('ws://0.tcp.ap.ngrok.io:14242/basehub');
  return channel;
});

final webSocketDoorProvider = Provider<IOWebSocketChannel>((ref) {
  final channel =
      IOWebSocketChannel.connect('ws://0.tcp.ap.ngrok.io:14242/basehub');
  return channel;
});

final webSocketFanProvider = Provider<IOWebSocketChannel>((ref) {
  final channel =
      IOWebSocketChannel.connect('ws://0.tcp.ap.ngrok.io:14242/basehub');
  return channel;
});

final webSocketGasProvider = Provider<IOWebSocketChannel>((ref) {
  final channel =
      IOWebSocketChannel.connect('ws://0.tcp.ap.ngrok.io:14242/basehub');
  return channel;
});
