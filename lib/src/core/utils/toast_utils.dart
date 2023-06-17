import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void make({required String message}) {
    Fluttertoast.cancel();

    Fluttertoast.showToast(msg: message);
  }
}
