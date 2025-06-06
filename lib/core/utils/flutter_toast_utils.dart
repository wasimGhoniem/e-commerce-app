import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastUtils {
  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primaryColor,
        textColor: AppColors.whiteColor,
        fontSize: 16.0);
  }
}
