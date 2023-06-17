import 'package:autohome/src/features/voice/controllers/voice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoiceDialog extends StatefulWidget {
  const VoiceDialog({Key? key}) : super(key: key);

  @override
  State<VoiceDialog> createState() => _VoiceDialogState();
}

class _VoiceDialogState extends State<VoiceDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Đang nhận giọng nói',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton(
              //   onPressed: () async {
              //     await ref.read(recorderProvider).record();
              //   },
              //   child: const Text('Ghi âm'),
              // ),
              Consumer(
                builder: (context, ref, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      await ref
                          .read(recorderProvider)
                          .stopRecorder()
                          .whenComplete(
                            () => Navigator.pop(context),
                          );
                    },
                    child: const Text('Dừng'),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
